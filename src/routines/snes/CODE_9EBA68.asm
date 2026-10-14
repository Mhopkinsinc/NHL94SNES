; Unidentified routine.
CODE_9EBA68:
	ldy.b a2
	lda.w position,y
	bne CODE_9EBA67
	lda.w gmclock
	bne CODE_9EBA67
	lda.w $0AD9
	cmp.b a3
	beq .1
	lda.w $0F23,x
	sec
	sbc.w #$001A
	bmi CODE_9EBA67
.1:
	lda.w $0F23,x
	sec
	sbc.w #$0003
	bmi CODE_9EBA67
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CODE_9E9B52
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w $0F23,y
	sec
	sbc.w #$001F
	bmi CODE_9EBA67
	lda.w pflags,x
	bit.w #$4000
	bne CODE_9EBA67
	lda.w #$0014
	sec
	sbc.w $1443,x
	jsl.l CODE_9BB385
	cmp.w #$0002
	bcs CODE_9EBA67
	lda.w gmode
	bit.w #$0010
	bne CODE_9EBA67
	lda.w $0B05,y
	and.w #$0004
	bne CODE_9EBA67
	lda.w #$0026
	sta.b d0
	jmp.w AddPenalty
