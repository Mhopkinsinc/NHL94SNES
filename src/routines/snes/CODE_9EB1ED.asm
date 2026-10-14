; Unidentified routine.
CODE_9EB1ED:
	lda.w #PenBuf
	sta.b a0
CODE_9EB1F2:
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB1F2
	tay
	bne CODE_9EB206
	jmp.w CODE_9EB2B4
