; Playoffs: give the other games of the round scores so far
InitScores:
	lda.l $7E35D4
	cmp.w #$0002
	bcs CODE_9FC87B
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
CODE_9FC845:
	lda.b d1
	cmp.l $7E35D6
	beq CODE_9FC873
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FC873
	lda.w #$0000
	sta.l $7E3568,x
	lda.w #$0003
	jsl.l CODE_9BB385
	inc a
	sta.b d0
	bra CODE_9FC86F
