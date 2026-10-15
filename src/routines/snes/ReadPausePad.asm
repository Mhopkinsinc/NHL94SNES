; ReadjoyA for the controller that owns the pause menu
ReadPausePad:
	lda.w pausepad
	lsr a
	jmp.w ReadjoyA
