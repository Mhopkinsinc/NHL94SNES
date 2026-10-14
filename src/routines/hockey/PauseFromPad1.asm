; Pause for pad 1: pausepad = 0, then SetPauseMode
PauseFromPad1:
	stz.w pausepad
	jmp.w SetPauseMode

.t1:
	jmp.w SetPauseMode
