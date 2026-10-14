; Unidentified routine.
CODE_9EADCF:
	ldx.w #$0102
	ldy.w #$011C
	jsr.w CODE_9EAF34
	ldx.w #$0101
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.b tmp2
	bne .t1
	ldx.w #$FEE4
	ldy.w #$FEFE
	jsr.w CODE_9EAF34
	ldx.w #$FEE3
	ldy.w #$FEFF
	stx.b $14
	sty.b $16
	lda.b tmp2
	bne CODE_9EAE31
	ldx.b $E4
	plb
	rtl

.t1:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b tmp0
	bit.w #$000A
	beq .1
	eor.w #$000A
	sta.b tmp0
.1:
	lda.b tmp1
	bit.w #$000A
	beq CODE_9EAE31
	eor.w #$000A
	sta.b tmp1
CODE_9EAE31:
	lda.b tmp1
	beq .t1
	ldx.b tmp0
	jsr (DATA8_9EAF1A,x)
	ldx.b $E4
	plb
	rtl

.t1:
	jsr.w .t3
	ldx.b $E4
	plb
	rtl

.t3:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl .t1x
	lda.b $12
	cmp.w #$FEF8
	bmi .t2
	bra CODE_9EAE78

.t1x:
	lda.b $12
	cmp.w #$FEF8
	bpl .t2
	bra CODE_9EAE91

.t2:
	rts

.t1xx:
	cmp.w Xpos,y
	bpl CODE_9EAEBB
	lda.b $16
	sta.b d1
	rts
