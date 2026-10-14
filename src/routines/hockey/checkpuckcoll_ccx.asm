; Puck contact with a player's stick, body or the goalie
checkpuckcoll_ccx:
	sty.b a2
	cpy.w puckc
	beq .rtl
	cpy.w #$0018
	bcs .rtl
	lda.w position,y
	bmi .rtl
	lda.w $1563,y
	ora.w $1203,y
	beq .4
.rtl:
	rtl
.1:
	jmp.w CODE_9E9899
.2:
	jmp.w CODE_9E9987
.4:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$001C
	bne .loop
	ldx.b xsave
	lda.w pflags,y
	bit.w #$1000
	bne .1
	lda.w position,y
	beq .2
	lda.w $0DF9
	cmp.w #$0005
	bpl .1
	lda.w $0E01
	cmp.w #$0100
	bpl .1
	tya
	jsl.l GetHot
	ldy.b a2
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq .1x
	eor.w #$FFFF
	inc a
.1x:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b d0
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	bit.w #$8000
	beq .2x
	eor.w #$FFFF
	inc a
.2x:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b d1
	lda.b d0
	tax
	jsl.l Mul8U
	sta.b d0
	lda.b d1
	tax
	jsl.l Mul8U
	ldx.b $E4
	clc
	adc.b d0
	sta.b d0
	lda.w #$00C4
	sta.b d1
	lda.w $121F
	bmi .3
	beq .3
	lsr.b d1
	lsr.b d1
.3:
	lda.b d1
	cmp.b d0
	bcc CODE_9E9899
	jsl.l puckstick
	bra CODE_9E98EC
