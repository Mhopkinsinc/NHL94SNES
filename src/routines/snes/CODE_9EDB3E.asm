; Unidentified routine.
CODE_9EDB3E:
	lda.w puckc
	bpl CODE_9EDB3A
	lda.w iflags
	bit.w #$0004
	bne CODE_9EDB3A
	lda.w puckx
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	cmp.w #$0068
	bmi CODE_9EDB3A
	lda.w puckvy
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	cmp.w #$3800
	bmi CODE_9EDB3A
	lda.w pucky
	cmp.w #$00B8
	bpl .3
	lda.w pucky
	cmp.w #$FF48
	bpl CODE_9EDB3A
.3:
	lda.w puckvy
	ldy.w pfgoal,x
	beq .4
	eor.w #$FFFF
	inc a
.4:
	cmp.w #$FC00
	bmi CODE_9EDB3A
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq .5
	stz.b a2
	lda.w #$0002
	sta.b a1
.5:
	ldy.b a1
	lda.w $17AE,y
	cmp.w #$0132
	bcc .t1
	ldy.b a2
	lda.w $17AE,y
	cmp.w #$0132
	bcc .t1
	lda.w #$000F
	sta.b d0
	jmp.w assinsert

.t1:
	jmp.w CODE_9EDA51
