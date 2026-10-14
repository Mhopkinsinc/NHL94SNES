; Unidentified routine.
CODE_9DBD4F:
	jsl.l CODE_9DE0E9
	lda.b $91
	pha
	stz.w $07C6
	jsl.l CODE_9DC697
	pla
	sta.b $91
	lda.b $91
	pha
	stz.w $1DB9
	jsl.l GetPlayerCount
	lda.b $A5
	clc
	adc.w #$0006
	sta.w $1DC1
	jsl.l CODE_8086BD
	jsl.l CODE_9DBE79
CODE_9DBD7B:
	jsl.l CODE_9DD923
CODE_9DBD7F:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9DBDAA
	bit.w #$0100
	bne CODE_9DBE06
	bit.w #$0200
	bne CODE_9DBDAE
	bit.w #$4000
	beq CODE_9DBDA8
	jmp.w CODE_9DBE5B
