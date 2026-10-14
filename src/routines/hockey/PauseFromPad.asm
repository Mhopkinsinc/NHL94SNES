; Pause for pad A: pausepad = A, then SetPauseMode
PauseFromPad:
	sta.w pausepad
	jmp.w SetPauseMode
