; Draw the game clock unless a replay is playing
showclock:
	lda.w sflags
	bit.w #sf2replay
	beq CODE_9FA083
	jmp.w CODE_9FA12F
