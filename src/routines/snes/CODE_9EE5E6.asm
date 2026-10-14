; Unidentified routine.
CODE_9EE5E6:
	lda.b d0
	cmp.w #$002C
	bpl CODE_9EE635
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
