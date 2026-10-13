; Unidentified routine.
CODE_9EC180:
	lda.l $7E344C
	beq CODE_9EC1BB
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0000
	sta.l $7E344C
CODE_9EC1BB:
	lda.b $A5
	bpl CODE_9EC1C2
	jmp.w CODE_80C2AE
