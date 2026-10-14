; Unidentified routine.
CODE_9EE5E6:
	lda.b d0
	cmp.w #$002C
	bpl .4
	jsl.l RandomWord
	and.w #$00C0
	beq .t1
	lda.w attribute,x
	bit.w #$0800
	bne .1
	bra .2

.t1:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi .2
.1:
	lda.w #$002D
	bra .3
.2:
	lda.w #$FFD3
.3:
	ldy.w pfgoal,x
	bne .2x
.1x:
	eor.w #$FFFF
	inc a
.2x:
	sta.w $1EA9
	sta.w $1EA1
	lda.w #$0028
	sta.w $1EA3
	lda.w #$001E
	sta.w $1EA5
	rts
.4:
	lda.w Xpos,x
	cmp.w #$0020
	bpl CODE_9EE690
	cmp.w #$FFE0
	bmi CODE_9EE690
	jsl.l RandomWord
	and.w #$00C0
	beq .t1x
	lda.w attribute,x
	bit.w #$0800
	bne .1xx
	bra CODE_9EE66B

.t1x:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi CODE_9EE66B
.1xx:
	lda.w #$002C
	bra CODE_9EE66E
