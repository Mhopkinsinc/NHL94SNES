; Unidentified routine.
CODE_9F8D96:
	lda.w gsp
	sta.w $1EAD
	jsl.l CODE_9C9786
	jsl.l CODE_9F96F7
CODE_9F8DA4:
	lda.w SoundFadeSpeed
	bne CODE_9F8DA4
	jsl.l CODE_9C98DF
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w CODE_9F8433
