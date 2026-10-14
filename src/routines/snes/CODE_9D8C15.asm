; Unidentified routine.
CODE_9D8C15:
	jsl.l CODE_8086A9
CODE_9D8C19:
	sep #$20
	lda.b #$09
	sta.w BGMODE
	lda.b #$01
	sta.w BG1SC
	lda.b #$08
	sta.w BG2SC
	lda.b #$39
	sta.w BG3SC
	lda.b #$31
	sta.w BG12NBA
	lda.b #$04
	sta.w BG34NBA
	lda.b #$03
	sta.w OBSEL
	lda.b #$07
	sta.w TM
	rep #$30
	lda.w #a3
	sta.b $0E
	lda.w #DATA8_95F1AE
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$3000
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ABA95
	sta.b $0C
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0246
	sta.b $0C
	phx
	ldx.w #$0240
	ldy.w #$0800
	jsl.l CODE_80891F
	pla
	sec
	sbc.w #$0240
	tax
	ldy.w #$0920
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE121
	sta.b $0C
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE8BF
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.l $7E35B6
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE027
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$35F4
	sta.b $10
	jsl.l Decompress
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	adc.l $7E35B6
	sta.l $7E35AE
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b a0
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D7
	sta.b a1
	jsl.l RemapTiles
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35AE
	sta.l $7E35CE
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$031A
	sta.l $7E3676
	sta.l $7E3696
	sta.l $7E36B6
	sta.l $7E36D6
	lda.w #$007E
	sta.b $12
	lda.w #$3674
	sta.b $10
	ldx.w #$001B
CODE_9D8DA2:
	phx
	txa
	asl a
	asl a
	tax
	lda.l DATA8_9C850F+2,x
	sta.b $0E
	lda.l DATA8_9C850F,x
	sta.b $0C
	ldy.w #$0008
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	lda.l DATA8_9D93AD,x
	and.w #$00FF
	tay
	pla
	sta.b [$10],y
	lda.b $01,s
	asl a
	asl a
	asl a
	tax
	jsr.w CODE_9D93E3
	ldy.w #$0012
	lda.b [$0C],y
	pha
	lda.b $03,s
	asl a
	tax
	inx
	lda.l DATA8_9D93AD,x
	and.w #$00FF
	tay
	pla
	sta.b [$10],y
	lda.b $01,s
	asl a
	inc a
	asl a
	asl a
	tax
	jsr.w CODE_9D93E3
	plx
	dex
	bpl CODE_9D8DA2
	lda.l $7E35CE
	clc
	adc.w #$0070
	sta.l $7E35C6
	lda.w #$007F
	sta.b $0E
	lda.w #$6700
	sta.b $0C
	ldx.w #$0E00
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE884
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3654
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_968C02
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AB610
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	jsl.l Decompress
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	lda.w #$0000
	ldx.w #$8000
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $12
	lda.w #$A676
	sta.b $10
	lda.w #$0000
	ldx.w #$4002
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $8F
	lda.w #$34D2
	sta.b a1
	lda.w #$009D
	sta.b $8B
	lda.w #DATA8_9D94FE
	sta.b a0
	lda.l $7E35D4
	asl a
	tay
	lda.b [a0],y
	adc.b a0
	sta.b a0
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF415
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	sta.l $7E3466
CODE_9D8F15:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printx
	lda.w #$3000
	sta.w $0D0D
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printy
	lda.b [a1]
	inc.b a1
	and.w #$00FF
	sta.b $CD
	tay
	lda.l $7E34F2
	tax
	tya
	eor.l $7E34D2,x
	and.w #$00FF
	bne CODE_9D8F4E
	lda.w #$3400
	sta.w $0D0D
CODE_9D8F4E:
	lda.b $CD
	asl a
	tax
	lda.l TeamPlaceNames,x
	sta.b $0C
	lda.w #$009C
	sta.b $0E
	lda.w printx
	pha
	lda.w #$005C
	sta.w $1D59
	lda.w #$9C53
	sta.w $1D5A
	lda.w #$009D
	sta.w $1D5C
	jsl.l CODE_9D9A5C
	pla
	sta.w printx
	lda.b $CD
	asl a
	asl a
	asl a
	clc
	adc.w #$7500
	sta.b a2
	lda.w #$0000
	adc.w #$007F
	sta.b $93
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.w #$0007
	sta.b tmp0
	sta.b tmp1
	lda.b [a2]
	clc
	adc.l $7E35CE
	sta.l $7EA676,x
	ora.w #$4000
	sta.l $7EA686,x
	inx
	inx
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l $7E35CE
CODE_9D8FC3:
	sta.l $7EA676,x
	inx
	inx
	dec.b tmp0
	bne CODE_9D8FC3
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l $7E35CE
	ora.w #$8000
	sta.l $7EA766,x
	ora.w #$C000
	sta.l $7EA776,x
	inx
	inx
	inc.b a2
	inc.b a2
	lda.b [a2]
	clc
	adc.l $7E35CE
	ora.w #$8000
CODE_9D8FF6:
	sta.l $7EA766,x
	inx
	inx
	dec.b tmp1
	bne CODE_9D8FF6
org $9D9000
	dec.b d4
	beq CODE_9D9007
	jmp.w CODE_9D8F15
