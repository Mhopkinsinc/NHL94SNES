; Yes or No exit prompt
AskExitGame:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF011:
	jsl.l DrawExitPrompt
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.b d1
	bit.w #$1000
	bne .t4
	bit.w #$8080
	bne CODE_9FF05B
	bit.w #$0800
	bne .t1
	bit.w #DMA_OAM
	bne .t2
	bra CODE_9FF011

.t1:
	lda.w $1DB9
	dec a
	bpl .t3
	bra CODE_9FF011

.t2:
	lda.w $1DB9
	inc a
	cmp.w #$0002
	bmi .t3
	bra CODE_9FF011

.t3:
	sta.w $1DB9
	bra CODE_9FF011

.t4:
	lda.w #$0000
	sta.w $1DB9
CODE_9FF05B:
	jsl.l CODE_9B865F
	lda.w $1DB9
	rtl
