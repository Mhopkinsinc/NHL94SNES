; A goalie and another player collide: the skater falls, and an interference penalty may be called
checkint:
	jsl.l .ci
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l .ci
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
.rtl:
	rtl
.ci:
	ldy.b a2
	lda.w position,y
	bne .rtl
	lda.w gmclock
	bne .rtl
	lda.w shotPlIdx
	cmp.b a3
	beq .1
	lda.w $0F23,x
	sec
	sbc.w #$001A
	bmi .rtl
.1:
	lda.w $0F23,x
	sec
	sbc.w #$0003
	bmi .rtl
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l FallDown
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w $0F23,y
	sec
	sbc.w #$001F
	bmi .rtl
	lda.w pflags,x
	bit.w #$4000
	bne .rtl
	lda.w #$0014
	sec
	sbc.w $1443,x
	jsl.l CODE_9BB385
	cmp.w #$0002
	bcs .rtl
	lda.w gmode
	bit.w #$0010
	bne .rtl
	lda.w $0B05,y
	and.w #$0004
	bne .rtl
	lda.w #$0026
	sta.b d0
	jmp.w AddPenalty
