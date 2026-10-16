; Pause for pad A: pausepad = A, then startpause
PauseFromPad:
	sta.w pausepad
	jmp.w startpause
