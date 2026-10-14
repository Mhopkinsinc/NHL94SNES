; Unidentified routine.
CODE_9EB1ED:
	lda.w #$15DE
	sta.b $89
CODE_9EB1F2:
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB1F2
	tay
	bne CODE_9EB206
	jmp.w CODE_9EB2B4
