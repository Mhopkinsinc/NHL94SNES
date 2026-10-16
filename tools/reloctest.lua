-- reloctest.lua: run a ROM in Mesen 2 (--testrunner) with a fixed input script and log a hash of the PPU and APU state.
-- Two builds that differ only in where things sit in ROM must log the same hashes: VRAM, CGRAM, OAM and SPC RAM hold
-- no ROM addresses. A hash that differs points at an address the source still has as a number.
-- Environment: RT_INPUT (input script), RT_OUT (log file), RT_SHOTS (folder for screenshots, optional), RT_EVERY (frames
-- between hashes, default 10).
-- Input script lines: "<frame> <buttons>" (buttons: a b x y l r up down left right start select, joined with +), pressed
-- from that frame for RT_HOLD frames (default 6); "<frame> shot" saves a screenshot; "<frame> end" stops. # starts a comment.

local inputPath = os.getenv("RT_INPUT")
local out = assert(io.open(os.getenv("RT_OUT"), "w"))
local shots = os.getenv("RT_SHOTS")
local every = tonumber(os.getenv("RT_EVERY") or "10")
local hold = tonumber(os.getenv("RT_HOLD") or "6")

local press, shotAt, endAt = {}, {}, 1e9
for line in io.lines(inputPath) do
	line = line:gsub("#.*", "")
	local f, what = line:match("^%s*(%d+)%s+(%S+)")
	if f then
		f = tonumber(f)
		if what == "shot" then shotAt[f] = true
		elseif what == "end" then endAt = f
		else
			local t = {}
			for b in what:gmatch("[^+]+") do t[b] = true end
			press[f] = t
		end
	end
end

local function hash(memType, size)
	local h = 0
	for i = 0, size - 1 do h = (h * 31 + emu.read(i, memType)) % 4294967296 end
	return h
end

local frame, polls = 0, 0
emu.addEventCallback(function()
	polls = polls + 1
	for f = frame, frame - hold + 1, -1 do
		if press[f] then emu.setInput(press[f], 0); return end
	end
end, emu.eventType.inputPolled)

emu.addEventCallback(function()
	frame = frame + 1
	if frame % every == 0 then
		out:write(string.format("%d vram=%08x cgram=%08x oam=%08x aram=%08x\n", frame,
			hash(emu.memType.snesVideoRam, 0x10000), hash(emu.memType.snesCgRam, 0x200),
			hash(emu.memType.snesSpriteRam, 0x220), hash(emu.memType.spcRam, 0x10000)))
	end
	if shots and shotAt[frame] then
		local f = assert(io.open(string.format("%s/%06d.png", shots, frame), "wb"))
		f:write(emu.takeScreenshot()); f:close()
	end
	if frame >= endAt then
		out:write(string.format("polls %d\n", polls)); out:close(); emu.stop(0)
	end
end, emu.eventType.endFrame)
