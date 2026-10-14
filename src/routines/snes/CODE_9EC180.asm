; Unidentified routine.
CODE_9EC180:
	lda.l $7E344C
	beq CODE_9EC1BB
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$000E
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0000
	sta.l $7E344C
CODE_9EC1BB:
	lda.b d0
	bpl CODE_9EC1C2
	jmp.w CODE_80C2AE
