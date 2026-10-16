; Pause started from controller 1: pausepad = 0, then startpause
startpause1:
	stz.w pausepad
	jmp.w startpause

.t1:
	jmp.w startpause
