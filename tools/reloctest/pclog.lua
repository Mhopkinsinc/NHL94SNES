-- pclog.lua: reloctest.lua's input playback; writes the CPU PC and cycle count at the end of every frame to RT_OUT,
-- up to frame RT_T1. Two builds whose code runs the same cycles end every frame at the same (shifted) PC.
local press, hold, frame = {}, 6, 0
local t1 = tonumber(os.getenv("RT_T1"))
for line in io.lines(os.getenv("RT_INPUT")) do
	local f, what = line:gsub("#.*", ""):match("^%s*(%d+)%s+(%S+)")
	if f and what ~= "shot" and what ~= "end" then
		local t = {}; for b in what:gmatch("[^+]+") do t[b] = true end; press[tonumber(f)] = t
	end
end
emu.addEventCallback(function()
	for f = frame, frame - hold + 1, -1 do if press[f] then emu.setInput(press[f], 0); return end end
end, emu.eventType.inputPolled)
local out = assert(io.open(os.getenv("RT_OUT"), "w"))
emu.addEventCallback(function()
	frame = frame + 1
	local s = emu.getState()
	out:write(string.format("%d %02X%04X %d\n", frame, s["cpu.k"], s["cpu.pc"], s["cpu.cycleCount"]))
	if frame >= t1 then out:close(); emu.stop(0) end
end, emu.eventType.endFrame)
