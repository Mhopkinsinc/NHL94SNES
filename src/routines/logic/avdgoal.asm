; Do not skate through the goal: aim beside the net when the path crosses it
avdgoal:
	phb
	phk
	plb
	stz.b tmp2
	lda.w Xpos,x
	sta.b $0C
	lda.w Ypos,x
	sta.b $0E
	lda.b d0
	sta.b $10
	lda.b d1
	sta.b $12
	lda.w position,x
	bne .t1
	jmp.w CODE_9EADCF

.t1:
	ldx.w #$00E5
	ldy.w #$011C
	jsr.w CODE_9EAD4E
	ldx.w #$00E4
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.w #$0108
	sta.b $22
	lda.w $0B9D
	sta.b $20
	lda.b tmp2
	bne .t2
	ldx.w #$FEE4
	ldy.w #$FF1B
	jsr.w CODE_9EAD4E
	ldx.w #$FEE3
	ldy.w #$FF1C
	stx.b $14
	sty.b $16
	lda.w #$FEF8
	sta.b $22
	lda.w $0B9F
	sta.b $20
	lda.b tmp2
	bne .2
	ldx.b $E4
	plb
	rtl

.t2:
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
	beq .2
	eor.w #$000A
	sta.b tmp1
.2:
	lda.b tmp1
	beq .t1x
	ldx.b tmp0
	jsr (DATA8_9EAD34,x)
	ldx.b $E4
	plb
	rtl

.t1x:
	jsr.w .t2x
	ldx.b $E4
	plb
	rtl

.t2x:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl .t1xx
	lda.b $12
	cmp.w #$FEF8
	bmi .3
	bra CODE_9EAC67

.t1xx:
	lda.b $12
	cmp.w #$FEF8
	bmi .5
	ldy.b $20
	bmi .3
	lda.b $0C
	cmp.b $10
	bmi .4
	cmp.w Xpos,y
	bmi .3
	lda.b $16
	sta.b d1
.3:
	rts
.4:
	cmp.w Xpos,y
	bpl .rts
	lda.b $16
	sta.b d1
.rts:
	rts
.5:
	lda.b $16
	sta.b d1
	bra CODE_9EAC95
