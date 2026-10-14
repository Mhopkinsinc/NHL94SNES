; Unidentified routine.
CODE_9FABB3:
	pla
	sta.b d2
	jsl.l SprSort
	pla
	sta.b a3
	pla
	sta.b $97
	lda.w $1E9B
	beq CODE_9FAC25
	ldx.w #$0008
CODE_9FABC8:
	lda.w $19F6,x
	cmp.w $1E91
	bne CODE_9FABDE
	cpx.w $1E93
	beq CODE_9FABDE
CODE_9FABD5:
	ora.w #$8000
	sta.w $19F6,x
	stz.w $1C84,x
CODE_9FABDE:
	dex
	dex
	bpl CODE_9FABC8
	lda.w $1E91
	eor.w #$0002
	sta.b d0
	tax
	lda.w $19D0,x
	beq CODE_9FAC25
	ldy.w $0AFD,x
CODE_9FABF3:
	iny
	iny
	cpy.w #$000A
	bne CODE_9FABFD
	ldy.w #$0000
CODE_9FABFD:
	lda.w $19F6,y
	cmp.b d0
	bne CODE_9FABF3
	sty.b d1
	tya
	sta.w $0AFD,x
	ldx.w #$0008
CODE_9FAC0D:
	lda.w $19F6,x
	cmp.b d0
	bne CODE_9FAC21
	cpx.b d1
	beq CODE_9FAC21
CODE_9FAC18:
	ora.w #$8000
	sta.w $19F6,x
	stz.w $1C84,x
CODE_9FAC21:
	dex
	dex
	bpl CODE_9FAC0D
CODE_9FAC25:
	ldx.b a3
	jsl.l CODE_9FC988
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8AE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0036
	sta.b d0
	lda.l $7E3136
	bpl CODE_9FAC55
	lda.w #$00BE
	sta.b d0
CODE_9FAC55:
	lda.b d0
	sta.l $7E3126
	sec
	sbc.w #$002E
	lsr a
	lsr a
	lsr a
	sta.w printx
	lda.w #$005C
	sta.l $7E3128
	lda.w #$0003
	sta.w printy
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	jsl.l CODE_9F9353
	lda.w printy
	clc
	adc.l DATA8_9AD6A6+2
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	adc.l DATA8_9AD6A6
	dec a
	jsl.l CODE_9F935C
	jsl.l CODE_9EBF11
	lda.w #$D6AC
	sta.l $7E3120
	sta.b tmp0
	lda.w #$009A
	sta.b tmp1
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	ldy.w #$0000
	lda.l DATA8_9AD6A6+2
	sta.b $C8
	clc
	lda.w $1E9B
	bne CODE_9FACFC
CODE_9FACC9:
	lda.l DATA8_9AD6A6
	sta.b $CA
CODE_9FACCF:
	lda.b [tmp0],y
	clc
	adc.l $7E35BA
	adc.l $7E35AA
	sta.l textmap,x
	iny
	iny
	inx
	inx
	dec.b $CA
	bne CODE_9FACCF
	txa
	clc
	adc.w #$0040
	sec
	sbc.l DATA8_9AD6A6
	sbc.l DATA8_9AD6A6
	tax
	dec.b $C8
	bne CODE_9FACC9
	jmp.w CODE_9FADB5
