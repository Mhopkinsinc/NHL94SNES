-- dump.lua: reloctest.lua's input playback; at frame RT_DUMP writes VRAM, CGRAM, OAM, SPC RAM and WRAM to RT_OUT.
-- With RT_WRAMFROM set, also appends WRAM to RT_OUT..'.wram' every frame from RT_WRAMFROM to RT_DUMP.
local press, hold, frame = {}, 6, 0
local dumpAt = tonumber(os.getenv("RT_DUMP"))
local wramFrom = tonumber(os.getenv("RT_WRAMFROM") or "1e9")
local wf = nil
for line in io.lines(os.getenv("RT_INPUT")) do
	local f, what = line:gsub("#.*", ""):match("^%s*(%d+)%s+(%S+)")
	if f and what ~= "shot" and what ~= "end" then
		local t = {}; for b in what:gmatch("[^+]+") do t[b] = true end; press[tonumber(f)] = t
	end
end
emu.addEventCallback(function()
	for f = frame, frame - hold + 1, -1 do if press[f] then emu.setInput(press[f], 0); return end end
end, emu.eventType.inputPolled)
emu.addEventCallback(function()
	frame = frame + 1
	if frame >= wramFrom and frame <= dumpAt then
		wf = wf or assert(io.open(os.getenv("RT_OUT") .. ".wram", "wb"))
		local t = {}
		for i = 0, 0x1FFFF do t[#t + 1] = string.char(emu.read(i, emu.memType.snesWorkRam)) end
		wf:write(table.concat(t))
	end
	if frame == dumpAt then
		if wf then wf:close() end
		local out = assert(io.open(os.getenv("RT_OUT"), "wb"))
		for _, m in ipairs({{emu.memType.snesVideoRam, 0x10000}, {emu.memType.snesCgRam, 0x200}, {emu.memType.snesSpriteRam, 0x220},
				{emu.memType.spcRam, 0x10000}, {emu.memType.snesWorkRam, 0x20000}}) do
			local t = {}
			for i = 0, m[2] - 1 do t[#t + 1] = string.char(emu.read(i, m[1])) end
			out:write(table.concat(t))
		end
		out:close(); emu.stop(0)
	end
end, emu.eventType.endFrame)
