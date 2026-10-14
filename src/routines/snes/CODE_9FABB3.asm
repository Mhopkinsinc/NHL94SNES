; Unidentified routine.
CODE_9FABB3:
	pla
	sta.b $AD
	jsl.l SprSort
	pla
	sta.b $95
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
	sta.b $A5
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
	cmp.b $A5
	bne CODE_9FABF3
	sty.b $A9
	tya
	sta.w $0AFD,x
	ldx.w #$0008
CODE_9FAC0D:
	lda.w $19F6,x
	cmp.b $A5
	bne CODE_9FAC21
	cpx.b $A9
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
	ldx.b $95
	jsl.l CODE_9FC988
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8AE
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0036
	sta.b $A5
	lda.l $7E3136
	bpl CODE_9FAC55
	lda.w #$00BE
	sta.b $A5
CODE_9FAC55:
	lda.b $A5
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
	sta.b $C5
	lda.w #$009A
	sta.b $C7
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
	lda.b [$C5],y
	clc
	adc.l $7E35BA
	adc.l $7E35AA
	sta.l $7E37F4,x
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
