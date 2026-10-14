; Yes or No exit prompt
AskExitGame:
	lda.w #$0000
	sta.w $1DB9
.1:
	jsl.l DrawExitPrompt
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.b d1
	bit.w #$1000
	bne .t4
	bit.w #$8080
	bne .2
	bit.w #$0800
	bne .t1
	bit.w #$0400
	bne .t2
	bra .1

.t1:
	lda.w $1DB9
	dec a
	bpl .t3
	bra .1

.t2:
	lda.w $1DB9
	inc a
	cmp.w #$0002
	bmi .t3
	bra .1

.t3:
	sta.w $1DB9
	bra .1

.t4:
	lda.w #$0000
	sta.w $1DB9
.2:
	jsl.l WaitButtonRelease
	lda.w $1DB9
	rtl
