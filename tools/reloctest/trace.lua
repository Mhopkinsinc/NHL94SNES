-- trace.lua: reloctest.lua's input playback; logs "PC A X Y DB" for every CPU instruction of frames RT_T0..RT_T1 to RT_OUT.
local press, hold, frame = {}, 6, 0
local t0, t1 = tonumber(os.getenv("RT_T0")), tonumber(os.getenv("RT_T1"))
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
local on = false
emu.addMemoryCallback(function(addr)
	if on then
		local s = emu.getState()
		out:write(string.format("%06X %04X %04X %04X %02X\n", addr, s["cpu.a"], s["cpu.x"], s["cpu.y"], s["cpu.dbr"]))
	end
end, emu.callbackType.exec, 0, 0xFFFFFF)
emu.addEventCallback(function()
	frame = frame + 1
	on = frame >= t0 - 1 and frame < t1
	if frame >= t1 then out:close(); emu.stop(0) end
end, emu.eventType.endFrame)
