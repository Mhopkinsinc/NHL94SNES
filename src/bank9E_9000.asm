; Bank $9E, second 4 KB: more game code for the objects on the ice, with auto labels for now. DATA8_9E9927 gives two
; thirds of its index, rounded.

org $9E9000
	sec
	sbc.b $A7
	sta.b $B1
	bra CODE_9E904D
CODE_9E9007:
	jmp.w $9091
CODE_9E900A:
	lda.b $AD
	sec
	sbc.w #$03E8
	bpl CODE_9E9007
	lda.b $AD
	sec
	sbc.w #$F000
	bpl CODE_9E9034
	lda.w $0F23,x
	sec
	sbc.w #$000A
	bmi CODE_9E9034
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	lda.w #$000D
	jsl.l CODE_9C9AD0
CODE_9E9034:
	lda.b $AD
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9040
	ora.w #$C000
CODE_9E9040:
	sta.b $AD
	sec
	sbc.w #$FC7C
	bmi CODE_9E904D
	lda.w #$FC18
	sta.b $AD
CODE_9E904D:
	lda.b $01,s
	ldx.b $B1
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $C5
	lda.b $03,s
	ldx.b $AD
	jsl.l CODE_808FEB
	lda.b $C5
	sec
	sbc.b $09
	ldx.b $95
	sta.w $0EC3,x
	lda.b $03,s
	ldx.b $B1
	jsl.l CODE_808FEB
	lda.b $09
	sta.b $B1
	lda.b $01,s
	ldx.b $AD
	jsl.l CODE_808FEB
	lda.b $09
	clc
	adc.b $B1
	ldx.b $95
	sta.w $0EE3,x
	lda.w $0E01
	bmi CODE_9E9091
	stz.w $0E01
CODE_9E9091:
	pla
	pla
	pla
	sta.b $B1
	pla
	sta.b $AD
	cpx.w #$001C
	bne CODE_9E90AD
	lda.w $0AD9
	bpl CODE_9E90AD
	jsl.l $9EC791
	stz.w $1E8B
	stz.w $1E89
CODE_9E90AD:
	rtl
CODE_9E90AE:
	cpx.w #$001C
	beq CODE_9E90B6
	jmp.w $92F8
CODE_9E90B6:
	ldy.w $0AD9
	bmi CODE_9E90C0
	lda.w $0F43,y
	beq CODE_9E9116
CODE_9E90C0:
	lda.w $0DF9
	cmp.w #$000D
	bpl CODE_9E9116
	ldy.b $91
	lda.b $AD
	sec
	sbc.w $0D55,y
	sta.b $AD
	cmp.w #$0017
	bpl CODE_9E9116
	lda.b $AD
	cmp.w #$FFEA
	bmi CODE_9E9116
	lda.w #$0009
	sta.b $B9
	lda.b $B1
	sec
	sbc.w $0DB7,y
	sta.b $B1
	cmp.w #$000A
	bpl CODE_9E9116
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
	lda.b $B1
	cmp.w #$FFF7
	bmi CODE_9E9116
	lda.w #$FFFF
	sta.w $0CDB
	lda.w $0DFF
	cmp.w #$000D
	bmi CODE_9E9117
	lda.w $0DFF
	sta.w $0DF9
	jmp.w $92AE
CODE_9E9116:
	rtl
CODE_9E9117:
	stz.w $14DF
	lda.w $0AD9
	bmi CODE_9E9148
	tay
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0008
	sta.w $1203,y
	lda.w $0DD3
	sta.b $A9
	lda.w $14C3,y
	bne CODE_9E913E
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E913E:
	lda.b $A9
	bpl CODE_9E9148
	lda.w #$0001
	sta.w $14DF
CODE_9E9148:
	lda.w #$FF01
	sta.b $A5
	lda.w #$FF01
	sta.b $0C
	lda.w $0DD9,x
	sec
	sbc.w $0EA3,x
	sta.b $A9
	lda.w $0DB7,x
	sbc.w $0E83,x
	sta.b $AB
	lda.b $AA
	sta.b $A9
	cmp.w #$0000
	beq CODE_9E91E9
	bmi CODE_9E9186
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b $B9
	sta.b $B9
CODE_9E9186:
	lda.b $B9
	clc
	adc.b $B1
	sta.b $B9
	sta.b $08
	lda.w $0D77,x
	sec
	sbc.w $0E63,x
	sta.b $B1
	lda.w $0D55,x
	sbc.w $0E43,x
	sta.b $B3
	lda.b $B2
	sta.b $B1
	ldx.b $08
	jsl.l Mul16S
	ldx.b $95
	lda.b $A9
	bit.w #$8000
	beq CODE_9E91B7
	eor.w #$FFFF
	inc a
CODE_9E91B7:
	sta.b $04
	lda.b $0A
	bit.w #$8000
	beq CODE_9E91C4
	eor.w #$FFFF
	inc a
CODE_9E91C4:
	cmp.b $04
	bcs CODE_9E91E9
	lda.b $A9
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $B9
	ldx.b $95
	lda.b $AD
	sec
	sbc.b $B9
	sta.b $AD
	cmp.w #$FFEA
	bmi CODE_9E91E9
	lda.b $AD
	cmp.w #$0017
	bmi CODE_9E9212
CODE_9E91E9:
	jmp.w $92BE
CODE_9E91EC:
	lda.w $0EFF
	cmp.w #$0800
	bpl CODE_9E920C
	cmp.w #$F800
	bmi CODE_9E920C
	cmp.w #$0000
	bpl CODE_9E9206
	lda.w #$F800
	sta.w $0EFF
	bra CODE_9E920C
CODE_9E9206:
	lda.w #$0800
	sta.w $0EFF
CODE_9E920C:
	jmp.w $8F42
CODE_9E920F:
	jmp.w $F319
CODE_9E9212:
	stz.b $A9
	lda.w $0DD3
	eor.b $0C
	bmi CODE_9E91EC
	lda.w #$0000
	sec
	sbc.b $0C
	sta.b $0C
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w $14DF
	bne CODE_9E91EC
	lda.w $0DF9
	cmp.w #$000D
	beq CODE_9E9246
	lda.b $AD
	cmp.w #$0012
	bpl CODE_9E9246
	lda.b $AD
	cmp.w #$FFEF
	bpl CODE_9E920F
CODE_9E9246:
	jsl.l $9EF213
	stz.w $1E8B
	stz.w $1E89
	lda.w #$0009
	jsl.l CODE_9C9ABC
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w $19BE
	clc
	adc.w #$0028
	bmi CODE_9E9274
	sta.w $19BE
CODE_9E9274:
	jsl.l RandomWord
	and.w #$0FFF
	sta.b $A5
	lda.w $0DD3
	bmi CODE_9E928A
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E928A:
	lda.b $A5
	sta.w $0EFF
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w $0EDF
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w $0E01
	jmp.w $DE5E
CODE_9E92AE:
	lda.w $0E01
	bit.w #$8000
	beq CODE_9E92BA
	eor.w #$FFFF
	inc a
CODE_9E92BA:
	sta.w $0E01
	rtl
CODE_9E92BE:
	lda.w $0EDF
	cmp.w #$0800
	bpl CODE_9E92DE
	cmp.w #$F800
	bmi CODE_9E92DE
	cmp.w #$0000
	bpl CODE_9E92D8
	lda.w #$F800
	sta.w $0EDF
	bra CODE_9E92DE
CODE_9E92D8:
	lda.w #$0800
	sta.w $0EDF
CODE_9E92DE:
	stz.b $A5
	lda.w #$00FF
	sta.b $A9
	lda.w $0D71
	sec
	sbc.w $0E5F
	sta.b $AD
	bmi CODE_9E92F5
	lda.w #$FF01
	sta.b $A9
CODE_9E92F5:
	jmp.w $8F42
CODE_9E92F8:
	lda.w $1283,x
	bit.w #$8000
	bne CODE_9E9305
	cpx.w #$0017
	bcc CODE_9E9306
CODE_9E9305:
	rtl
CODE_9E9306:
	ldy.b $91
	cpy.w #$0018
	beq CODE_9E931A
	lda.b $B1
	sec
	sbc.w $0D3D
	cmp.w #$FF16
	bpl CODE_9E9305
	bra CODE_9E9325
CODE_9E931A:
	lda.b $B1
	clc
	adc.w $0D3D
	cmp.w #$00EA
	bmi CODE_9E9305
CODE_9E9325:
	lda.b $AD
	bit.w #$8000
	beq CODE_9E9330
	eor.w #$FFFF
	inc a
CODE_9E9330:
	sec
	sbc.w $0D3B
	cmp.w #$0040
	bpl CODE_9E9305
	lda.b $B1
	pha
	sec
	sbc.w $0DB7,y
	sta.b $B1
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.b $AD
	pha
	sec
	sbc.w $0D55,y
	sta.b $A9
	sta.b $04
	tax
	jsl.l CODE_808F7D
	sta.b $08
	ldx.b $95
	lsr a
	lsr a
	cmp.w #$0101
	bcs CODE_9E9379
	sta.b $AD
	lda.b $B1
	sta.b $06
	tax
	jsl.l CODE_808F7D
	asl a
	sta.b $0A
	ldx.b $95
	clc
	adc.b $AD
	cmp.w #$0101
CODE_9E9379:
	bcs CODE_9E93D9
	pla
	sta.b $AD
	pla
	sta.b $B1
	jsr.w $93E0
	lda.b $B1
	pha
	lda.b $AD
	pha
	lda.b $04
	ldy.b $06
	jsl.l CODE_9CA554
	inc a
	sta.b $AD
	lda.b $A5
	xba
	and.w #$FF00
	tax
	lda.b $AD
	jsl.l DivX8S
	cmp.w #$00FF
	bmi CODE_9E93AA
	lda.w #$00FF
CODE_9E93AA:
	cmp.w #$FF01
	bpl CODE_9E93B2
	lda.w #$FF01
CODE_9E93B2:
	sta.b $A5
	lda.b $A9
	xba
	and.w #$FF00
	tax
	lda.b $AD
	jsl.l DivX8S
	cmp.w #$00FF
	bmi CODE_9E93C9
	lda.w #$00FF
CODE_9E93C9:
	cmp.w #$FF01
	bpl CODE_9E93D1
	lda.w #$FF01
CODE_9E93D1:
	sta.b $A9
	ldx.b $95
	jsl.l CODE_9E8F42
CODE_9E93D9:
	pla
	sta.b $AD
	pla
	sta.b $B1
	rtl
CODE_9E93E0:
	lda.b $A5
	pha
	lda.b $A9
	pha
	lda.w $0792
	and.w #$01C0
	bne CODE_9E9429
	lda.w $11A3,x
	cmp.w #$F342
	bne CODE_9E9429
	ldy.b $91
	lda.w $0DD3
	sec
	sbc.w $0DB7,y
	cmp.w #$FF80
	bmi CODE_9E9429
	cmp.w #$0080
	bpl CODE_9E9429
	lda.w $0EC3,x
	sta.b $A5
	lda.w $0EE3,x
	sta.b $A9
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
	lda.b $A5
	cmp.w #$DFFF
	bmi CODE_9E9430
	cmp.w #$2001
	bpl CODE_9E9430
CODE_9E9429:
	pla
	sta.b $A9
	pla
	sta.b $A5
CODE_9E942F:
	rts
CODE_9E9430:
	pla
	pla
	lda.b $A5
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E943F
	ora.w #$E000
CODE_9E943F:
	sta.b $A5
	cmp.w #$8000
	ror a
	clc
	adc.b $A5
	sta.b $A5
	ldy.b $91
	sta.w $0EC3,y
	lda.b $A9
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9E945C
	ora.w #$E000
CODE_9E945C:
	sta.b $A9
	cmp.w #$8000
	ror a
	clc
	adc.b $A9
	sta.b $A9
	sta.w $0EE3,y
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$0040
	tsb.w $15D8
	lda.w $15D6
	bne CODE_9E942F
	pla
	lda.w #$0008
	sta.b $A5
	jmp.w $B88A
CODE_9E9484:
	lda.w $1283,x
	bit.w #$8000
	bne CODE_9E9491
	cpx.w #$0018
	bcc CODE_9E9492
CODE_9E9491:
	rtl
CODE_9E9492:
	lda.w $15A3,x
	sta.b $A9
CODE_9E9497:
	ldy.b $A9
	cpy.w #$000F
	beq CODE_9E94DE
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w $1583,y
	sec
	sbc.b $B1
	sec
	sbc.w #$000E
	bpl CODE_9E94DE
	lda.w $0F43,y
	bmi CODE_9E94DA
	lda.w $0D55,y
	sec
	sbc.b $AD
	cmp.w #$FFF1
	bmi CODE_9E94DA
	cmp.w #$000F
	bpl CODE_9E94DA
	lda.w $1283,y
	and.w #$8000
	ora.w $1563,y
	bne CODE_9E94DA
	cpy.w #$0018
	bcs CODE_9E94DA
	jsl.l CODE_9E9528
CODE_9E94DA:
	inc.b $A9
	bra CODE_9E9497
CODE_9E94DE:
	lda.w $15A3,x
	beq CODE_9E9527
	sta.b $A9
CODE_9E94E5:
	ldy.b $A9
	lda.w $15C2,y
	and.w #$00FF
	tay
	lda.b $B1
	sec
	sbc.w $1583,y
	sec
	sbc.w #$000E
	bpl CODE_9E9527
	lda.w $0F43,y
	bmi CODE_9E9523
	lda.w $0D55,y
	sec
	sbc.b $AD
	cmp.w #$FFF1
	bmi CODE_9E9523
	cmp.w #$000F
	bpl CODE_9E9523
	lda.w $1283,y
	and.w #$8000
	ora.w $1563,y
	bne CODE_9E9523
	cpy.w #$0018
	bcs CODE_9E9523
	jsl.l CODE_9E9528
CODE_9E9523:
	dec.b $A9
	bne CODE_9E94E5
CODE_9E9527:
	rtl
CODE_9E9528:
	lda.b $A5
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $B1
	pha
	lda.b $B5
	pha
	lda.b $B9
	pha
	sty.b $91
	lda.w $0D55,y
	sec
	sbc.w $0D55,x
	sta.b $AD
	lda.w $0DB7,y
	sec
	sbc.w $0DB7,x
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	cmp.w #$0010
	bmi CODE_9E955F
	jmp.w $976E
CODE_9E955F:
	ldy.b $91
	lda.w $0EC3,x
	sec
	sbc.w $0EC3,y
	sta.b $A5
	lda.w $0EE3,x
	sec
	sbc.w $0EE3,y
	sta.b $A9
	lda.b $A5
	ora.b $A9
	bne CODE_9E957C
	jmp.w $976E
CODE_9E957C:
	lda.b $A9
	pha
	lda.b $A5
	pha
	lda.b $B1
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b $A9
	lda.b $AD
	ldx.b $A5
	jsl.l CODE_808FEB
	ldx.b $95
	lda.b $08
	clc
	adc.b $A9
	sta.b $A9
	lda.b $0A
	adc.b $AB
	sta.b $AB
	bpl CODE_9E95AE
	jmp.w $9784
CODE_9E95AE:
	lda.w $11A3,x
	cmp.w #$F3A6
	bcc CODE_9E95DC
	cmp.w #$F46B
	bcs CODE_9E95DC
	stz.w $14E3,x
	stz.w $1543,x
	ldy.w $0F03,x
	lda.w $11A3,y
	cmp.w #$F3A6
	bcc CODE_9E95DA
	cmp.w #$F46B
	bcs CODE_9E95DA
	lda.w #$0000
	sta.w $14E3,y
	sta.w $1543,y
CODE_9E95DA:
	ldy.b $91
CODE_9E95DC:
	lda.w $11A3,y
	cmp.w #$F3A6
	bcc CODE_9E960A
	cmp.w #$F46B
	bcs CODE_9E960A
	lda.w #$0000
	sta.w $14E3,y
	sta.w $1543,y
	ldx.w $0F03,y
	lda.w $11A3,x
	cmp.w #$F3A6
	bcc CODE_9E9608
	cmp.w #$F46B
	bcs CODE_9E9608
	stz.w $14E3,x
	stz.w $1543,x
CODE_9E9608:
	ldx.b $95
CODE_9E960A:
	lda.b $AA
	sta.b $A9
	lda.w $1503,x
	cmp.w $1503,y
	beq CODE_9E9692
	lda.b $A9
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0005
	bcs CODE_9E9624
	lda.w #$0005
CODE_9E9624:
	sta.b $B5
	lda.w $11A3,x
	cmp.w #$F208
	bcc CODE_9E963C
	cmp.w #$F343
	bcs CODE_9E963C
CODE_9E9633:
	lda.b $B5
	lsr a
	adc.b $B5
	sta.b $B5
	bra CODE_9E9649
CODE_9E963C:
	lda.w $11A3,y
	cmp.w #$F208
	bcc CODE_9E9649
	cmp.w #$F343
	bcc CODE_9E9633
CODE_9E9649:
	lda.b $B5
	clc
	adc.w $0F23,x
	sta.w $0F23,x
	lda.b $B5
	clc
	adc.w $0F23,y
	sta.w $0F23,y
	txa
	sta.w $0F03,y
	tya
	sta.w $0F03,x
	lda.b $B5
	cmp.w #$0014
	bcc CODE_9E9678
	cpx.w $0AD9
	beq CODE_9E9674
	cpy.w $0AD9
	bne CODE_9E9678
CODE_9E9674:
	jsl.l CODE_9E9B0E
CODE_9E9678:
	lda.b $A9
	pha
	lda.b $AD
	pha
	lda.b $B1
	pha
	jsl.l $9EBA4F
	jsl.l CODE_9E9FF9
	pla
	sta.b $B1
	pla
	sta.b $AD
	pla
	sta.b $A9
CODE_9E9692:
	lda.b $A9
	sta.b $B5
	pla
	sta.b $A5
	pla
	sta.b $A9
	lda.w $0CDB
	bpl CODE_9E96A4
	jmp.w $976E
CODE_9E96A4:
	lda.b $AD
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b $A9
	lda.b $B1
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b $A9
	sta.b $A9
	lda.b $0A
	sbc.b $AB
	sta.b $AB
	lda.b $AA
	sta.b $B9
	ldx.b $95
	lda.w $12C3,x
	clc
	adc.w #$008C
	sta.b $A5
	ldy.b $91
	lda.w $12C3,y
	clc
	adc.w #$008C
	sta.b $A9
	lda.b $A9
	clc
	adc.b $A5
	sta.b $A9
	lda.b $A5
	ldx.b $B5
	jsl.l CODE_808FC9
	lda.b $A9
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $A5
	sta.b $A9
	lda.b $B1
	ldx.b $B9
	jsl.l CODE_808FEB
	lda.b $08
	sta.b $C5
	lda.b $AD
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.b $C5
	ldx.b $95
	clc
	adc.w $0EC3,y
	sta.w $0EC3,x
	lda.b $AD
	ldx.b $B9
	jsl.l CODE_808FEB
	lda.b $08
	sta.b $C5
	lda.b $B1
	ldx.b $A5
	jsl.l CODE_808FEB
	lda.b $08
	sec
	sbc.b $C5
	ldx.b $95
	clc
	adc.w $0EE3,y
	sta.w $0EE3,x
	lda.b $AD
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w $0EC3,y
	sta.w $0EC3,y
	lda.b $B1
	ldx.b $A9
	jsl.l CODE_808FEB
	lda.b $08
	clc
	adc.w $0EE3,y
	sta.w $0EE3,y
	ldx.b $95
	lda.w #$FFFF
	sta.w $0CDB
CODE_9E976E:
	pla
	sta.b $B9
	pla
	sta.b $B5
	pla
	sta.b $B1
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A5
	rtl
CODE_9E9784:
	pla
	pla
	bra CODE_9E976E
CODE_9E9788:
	lda.w $0DF9
	sec
	sbc.w #$0010
	bpl CODE_9E97DC
	ldy.w $15BF
CODE_9E9794:
	sty.b $A9
	cpy.w #$000F
	beq CODE_9E97B8
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w $1583,y
	sec
	sbc.w $0DD3
	sec
	sbc.w #$0028
	bpl CODE_9E97B8
	jsl.l CODE_9E97DD
	ldy.b $A9
	iny
	bra CODE_9E9794
CODE_9E97B8:
	ldy.w $15BF
	beq CODE_9E97DC
CODE_9E97BD:
	sty.b $A9
	lda.w $15C2,y
	and.w #$00FF
	tay
	lda.w $0DD3
	sec
	sbc.w $1583,y
	sec
	sbc.w #$0028
	bpl CODE_9E97DC
	jsl.l CODE_9E97DD
	ldy.b $A9
	dey
	bne CODE_9E97BD
CODE_9E97DC:
	rtl
CODE_9E97DD:
	sty.b $91
	cpy.w $0AD9
	beq CODE_9E97F6
	cpy.w #$0018
	bcs CODE_9E97F6
	lda.w $0F43,y
	bmi CODE_9E97F6
	lda.w $1563,y
	ora.w $1203,y
	beq CODE_9E97FD
CODE_9E97F6:
	rtl
CODE_9E97F7:
	jmp.w $9899
CODE_9E97FA:
	jmp.w $9987
CODE_9E97FD:
	stx.b $87
	ldx.w #$0000
CODE_9E9802:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9E9802
	ldx.b $87
	lda.w $1283,y
	bit.w #$1000
	bne CODE_9E97F7
	lda.w $0F43,y
	beq CODE_9E97FA
	lda.w $0DF9
	cmp.w #$0005
	bpl CODE_9E97F7
	lda.w $0E01
	cmp.w #$0100
	bpl CODE_9E97F7
	tya
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w $0D55,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq CODE_9E9845
	eor.w #$FFFF
	inc a
CODE_9E9845:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b $A5
	lda.b $A9
	clc
	adc.w $0DB7,y
	sec
	sbc.w $0DD3
	bit.w #$8000
	beq CODE_9E985F
	eor.w #$FFFF
	inc a
CODE_9E985F:
	cmp.w #$000F
	bcs CODE_9E9899
	sta.b $A9
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.b $A5
	sta.b $A5
	lda.w #$00C4
	sta.b $A9
	lda.w $121F
	bmi CODE_9E988D
	beq CODE_9E988D
	lsr.b $A9
	lsr.b $A9
CODE_9E988D:
	lda.b $A9
	cmp.b $A5
	bcc CODE_9E9899
	jsl.l $9EF5DA
	bra CODE_9E98EC
CODE_9E9899:
	lda.w $0F43,y
	beq CODE_9E98FB
	lda.w $0D55,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq CODE_9E98AE
	eor.w #$FFFF
	inc a
CODE_9E98AE:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b $A5
	lda.w $0DB7,y
	sec
	sbc.w $0DD3
	bit.w #$8000
	beq CODE_9E98C5
	eor.w #$FFFF
	inc a
CODE_9E98C5:
	cmp.w #$0009
	bcs CODE_9E98EC
	sta.b $A9
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	ldx.b $95
	cmp.w #$0041
	bcs CODE_9E98EC
	jsl.l $9EEF7F
CODE_9E98EC:
	stx.b $87
	ldx.w #$001A
CODE_9E98F1:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9E98F1
	ldx.b $87
	rtl
CODE_9E98FB:
	lda.w $0D55,y
	sec
	sbc.w $0D71
	sta.b $A5
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	lda.w $0DB7,y
	sec
	sbc.w $0DD3
	sta.b $A9
	cmp.w #$FFF5
	bmi CODE_9E98EC
	cmp.w #$000B
	bpl CODE_9E98EC
	jsl.l $9EF042
	bra CODE_9E98EC
DATA8_9E9927:		; index * 2 / 3, rounded (words)
	dw 0,1,1,2,3,3,4,5,5,6,7,7,8,9,9,10
	dw 11,11,12,13,13,14,15,15,16,17,17,18,19,19,20,21
	dw 21,22,23,23,24,25,25,26,27,27,28,29,29,30,31,31
CODE_9E9987:
	tya
	jsl.l CODE_9BC074
	lda.b $A5
	bit.w #$8000
	beq CODE_9E9997
	eor.w #$FFFF
	inc a
CODE_9E9997:
	sta.b $AD
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b $B5
	lda.b $A9
	bit.w #$8000
	beq CODE_9E99AC
	eor.w #$FFFF
	inc a
CODE_9E99AC:
	asl a
	tax
	lda.l DATA8_9E9927,x
	sta.b $B1
	ldx.b $E4
	lda.b $91
	jsl.l CODE_9BC002
	ldy.b $91
	lda.b $A5
	clc
	adc.w $0D55,y
	sec
	sbc.w $0D71
	bit.w #$8000
	beq CODE_9E99D1
	eor.w #$FFFF
	inc a
CODE_9E99D1:
	cmp.b $AD
	bcs CODE_9E9A0E
	sta.b $A5
	lda.b $A9
	clc
	adc.w $0DB7,y
	sec
	sbc.w $0DD3
	bit.w #$8000
	beq CODE_9E99EA
	eor.w #$FFFF
	inc a
CODE_9E99EA:
	cmp.b $AD
	bcs CODE_9E9A0E
	sta.b $A9
	lda.b $B1
	clc
	adc.b $B5
	cmp.w #$0005
	bpl CODE_9E99FD
	lda.w #$0005
CODE_9E99FD:
	cmp.w $0DF9
	bcc CODE_9E9A0E
	lda.b $B1
	sec
	sbc.b $B5
	bmi CODE_9E9A11
	cmp.w $0DF9
	bcc CODE_9E9A11
CODE_9E9A0E:
	jmp.w $98FB
CODE_9E9A11:
	lda.b $A5
	tax
	jsl.l CODE_808F4C
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	lda.b $AD
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.b $A9
	lda.w $121F
	bmi CODE_9E9A3C
	beq CODE_9E9A3C
CODE_9E9A38:
	lsr.b $A9
	lsr.b $A9
CODE_9E9A3C:
	lda.b $A9
	cmp.b $A5
	bcc CODE_9E9A46
	jsl.l $9EF5DA
CODE_9E9A46:
	jmp.w $98FB
CODE_9E9A49:
	ldy.b $91
	cpy.w $0AD9
	beq CODE_9E9A61
	lda.w #$0003
	jsl.l CODE_9C9ABC
	jsl.l $9EC791
	stz.w $1E8B
	stz.w $1E89
CODE_9E9A61:
	ldy.b $91
	sty.w $0AD9
	sty.b $A5
	stz.b $89
	lda.w #$0002
	sta.b $8D
	lda.w $1503,y
	bne CODE_9E9A7B
	stz.b $8D
	lda.w #$0002
	sta.b $89
CODE_9E9A7B:
	ldy.b $89
	lda.w #$FFFF
	sta.w $179E,y
	sta.w $17A2,y
	lda.w $17DE,y
	ora.w #$0004
	sta.w $17DE,y
	lda.w #$0010
	trb.w $15DC
	beq CODE_9E9AB1
	ldy.b $8D
	lda.w $1792,y
	inc a
	sta.w $1792,y
	lda.l $7E35E0
	clc
	adc.w #$00C8
	sta.l $7E35E0
	lda.w #$0014
	sta.b $81
CODE_9E9AB1:
	lda.w $15D6
	bne CODE_9E9AC6
	lda.b $91
	cmp.w $0D07
	bne CODE_9E9AC6
	ldy.b $8D
	lda.w $17BA,y
	inc a
	sta.w $17BA,y
CODE_9E9AC6:
	lda.w #$000C
	trb.w $15D8
	ldy.b $91
	lda.w $0F43,y
	bne CODE_9E9AED
	jsl.l $9EF213
	ldy.b $91
	lda.w #$008C
	sta.w $1083,y
	lda.w $11A3,y
	cmp.w #$E4B6
	bne CODE_9E9AED
CODE_9E9AE7:
	lda.w #$0005
	sta.w $1083,y
CODE_9E9AED:
	lda.b $91
	cmp.w $0D07
	bne CODE_9E9B03
	ldy.b $8D
	lda.w $0B01,y
	sta.b $B5
	bmi CODE_9E9B03
	jsl.l $9FCB5C
	bra CODE_9E9B07
CODE_9E9B03:
	jsl.l $9FCB16
CODE_9E9B07:
	lda.w #$FFFF
	sta.w $0D07
	rtl
CODE_9E9B0E:
	phy
	ldy.w $0EC3,x
	lda.w $0EE3,x
	jsl.l CODE_9CA554
	sta.b $14
	lda.b $01,s
	tay
	lda.w $0EC3,y
	pha
	lda.w $0EE3,y
	tay
	pla
	jsl.l CODE_9CA554
	ply
	cmp.b $14
	bcs CODE_9E9B3C
	lda.w $0EC3,x
	sta.b $0C
	lda.w $0EE3,x
	sta.b $0E
	bra CODE_9E9B46
CODE_9E9B3C:
	lda.w $0EC3,y
	sta.b $0C
	lda.w $0EE3,y
	sta.b $0E
CODE_9E9B46:
	asl.b $0C
	asl.b $0E
	lda.w #$000F
	jsl.l CODE_9C9AD0
	rtl
CODE_9E9B52:
	lda.w $19BE
	clc
	adc.w #$000F
	bmi CODE_9E9B5E
	sta.w $19BE
CODE_9E9B5E:
	ldy.b $91
	cpy.w #$0018
	bcs CODE_9E9BB2
	lda.w $11A3,y
	cmp.w #$F90E
	beq CODE_9E9BB2
	cmp.w #$F7B2
	beq CODE_9E9BB2
	cmp.w #$F49C
	beq CODE_9E9BB2
	cmp.w #$F54E
	beq CODE_9E9BB2
	cmp.w #$F6C0
	beq CODE_9E9BB2
	lda.w #$F7B2
	sta.b $A9
	lda.w $15D6
	bne CODE_9E9BB3
	lda.w $1403,y
	cmp.w #$000C
	bcc CODE_9E9BB3
	lda.w $1223,y
	bne CODE_9E9BB3
	lda.w $0792
	and.w #$000F
	adc.w #$000A
	sta.b $A5
	sec
	sbc.w $0F23,y
	bmi CODE_9E9BB3
	lda.w #$003C
	sta.w $1223,y
	jmp.w $9D59
CODE_9E9BB2:
	rtl
CODE_9E9BB3:
	lda.w $0F43,x
	beq CODE_9E9BD2
	stz.b $89
	lda.w $1503,x
	beq CODE_9E9BC4
	lda.w #$0002
	sta.b $89
CODE_9E9BC4:
	lda.w $15D6
	bne CODE_9E9BD2
	ldy.b $89
	lda.w $17B6,y
	inc a
	sta.w $17B6,y
CODE_9E9BD2:
	ldy.b $91
	lda.w #$0078
	sta.w $1203,y
	lda.w $0D55,x
	sec
	sbc.w $0D55,y
	sta.b $A5
	lda.w $0DB7,x
	sec
	sbc.w $0DB7,y
	sta.b $A9
	jsl.l CODE_9BB445
	lda.w $0D55,y
	cmp.w #$0068
	bpl CODE_9E9C16
	cmp.w #$FF98
	bmi CODE_9E9C43
	lda.w $0DB7,y
	cmp.w #$0112
	bpl CODE_9E9C10
	cmp.w #$FEED
	bmi CODE_9E9C0D
CODE_9E9C0A:
	jmp.w $9D0D
CODE_9E9C0D:
	jmp.w $9CE0
CODE_9E9C10:
	jmp.w $9CB6
CODE_9E9C13:
	jmp.w $9EC2
CODE_9E9C16:
	lda.w $0DB7,y
	cmp.w #$00F0
	bpl CODE_9E9C13
	cmp.w #$FF0A
	bmi CODE_9E9C13
	lda.b $A5
	cmp.w #$0005
	bcc CODE_9E9C0A
	lda.w #$0082
	sta.w $0D55,y
	lda.w #$0000
	sta.w $0EC3,y
CODE_9E9C36:
	lda.w $0E03,y
	bit.w #$0800
	bne CODE_9E9C79
CODE_9E9C3E:
	lda.w #$FD3A
	bra CODE_9E9C7C
CODE_9E9C43:
	lda.w $0DB7,y
	cmp.w #$00F0
	bpl CODE_9E9C13
	cmp.w #$FF0A
	bmi CODE_9E9C13
	lda.b $A5
	dec a
	cmp.w #$0003
	bcs CODE_9E9C0A
	lda.w #$FF7E
	sta.w $0D55,y
	lda.w #$0000
	sta.w $0EC3,y
	lda.w $0DB7,y
	cmp.w #$0058
	bpl CODE_9E9C71
	cmp.w #$FFA8
	bpl CODE_9E9CB3
CODE_9E9C71:
	lda.w $0E03,y
	bit.w #$0800
	bne CODE_9E9C3E
CODE_9E9C79:
	lda.w #$FD9C
CODE_9E9C7C:
	ldx.b $91
	sta.w $14E3,x
	jsl.l $9EA403
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9E9C91
	sta.w $19BE
CODE_9E9C91:
	stz.w $0C23
	ldy.b $91
	lda.w $1503,y
	beq CODE_9E9C9E
	lda.w #$0002
CODE_9E9C9E:
	clc
	adc.w #$0006
	jsl.l CODE_9C9FD5
	lda.w #$0002
	sta.w $0C25
	ldx.b $95
	ldy.b $91
	jmp.w $9D79
CODE_9E9CB3:
	jmp.w $9E8A
CODE_9E9CB6:
	lda.w $0D55,y
	cmp.w #$0050
	bpl CODE_9E9D0A
	cmp.w #$FFB0
	bmi CODE_9E9D0A
	lda.b $A5
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9E9D0D
	lda.w #$0128
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EE3,y
CODE_9E9CDB:
	lda.w #$FC76
	bra CODE_9E9C7C
CODE_9E9CE0:
	lda.w $0D55,y
	cmp.w #$0050
	bpl CODE_9E9D0A
	cmp.w #$FFB0
	bmi CODE_9E9D0A
	lda.b $A5
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9E9D0D
	lda.w #$FED8
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EE3,y
CODE_9E9D04:
	lda.w #$FCD8
	jmp.w $9C7C
CODE_9E9D0A:
	jmp.w $9EC2
CODE_9E9D0D:
	ldy.b $95
	lda.w $1503,y
	beq CODE_9E9D17
	lda.w #$0002
CODE_9E9D17:
	inc a
	inc a
	jsl.l CODE_9C9FD5
	lda.w #$0002
	sta.w $0C25
	lda.w #$F54E
	sta.b $A9
	ldy.b $91
	lda.b $A5
	sec
	sbc.w $1163,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcc CODE_9E9D59
	lda.w #$F49C
	sta.b $A9
	lda.w $1163,y
	and.w #$0003
	bne CODE_9E9D59
	lda.w $1483,x
	sec
	sbc.w #$000A
	bmi CODE_9E9D59
	cpx.w #$0018
	bcs CODE_9E9D59
	lda.w #$F6C0
	sta.b $A9
CODE_9E9D59:
	ldx.b $91
	lda.w #$0001
	sta.w $14E3,x
	jsl.l $9EA3DD
	ldx.b $95
	lda.w $0F43,x
	bne CODE_9E9D79
	cpx.w #$0018
	bcs CODE_9E9D79
	bra CODE_9E9D79
CODE_9E9D73:
	jmp.w $9B0E
CODE_9E9D76:
	jmp.w $9E59
CODE_9E9D79:
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	lda.w $0AD9
	sta.b $A5
	bmi CODE_9E9D73
	cpy.b $A5
	bne CODE_9E9D73
	lda.w $15D4
	bit.w #$0010
	bne CODE_9E9D76
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9E9D76
	lda.w $0F43,x
	beq CODE_9E9D76
	lda.w $11A3,y
	cmp.w #$F54E
	bne CODE_9E9D76
	lda.w $1163,y
	and.w #$0003
	bne CODE_9E9D76
	lda.w $1283,y
	bit.w #$4000
	bne CODE_9E9D76
	lda.w #$0096
	jsl.l CODE_9BB385
	asl a
	ldy.b $91
	sec
	sbc.w $0F23,y
	bpl CODE_9E9D76
	lda.w $15D6
	bne CODE_9E9D76
	lda.w $0F43,y
	bmi CODE_9E9E59
	beq CODE_9E9E59
	lda.w #$FFFF
	sta.w $0AD9
	stz.w $0C23
	ldy.b $91
	lda.w $1503,y
	beq CODE_9E9DF2
	lda.w #$0002
CODE_9E9DF2:
	clc
	adc.w #$0006
	jsl.l CODE_9C9FD5
	ldx.b $91
	lda.w #$F90E
	jsl.l $9EA3F1
	ldx.b $95
	lda.w $0EC3,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	jsl.l $9EC2D0
	lda.w #$0004
	sta.w $1626
	lda.w #$0016
	sta.b $A5
	lda.w $19BE
	clc
	adc.w #$001E
	bmi CODE_9E9E3C
	sta.w $19BE
CODE_9E9E3C:
	lda.w $0F43,x
	bne CODE_9E9E44
	jmp.w $B88A
CODE_9E9E44:
	lda.l $7E34C4
	bne CODE_9E9E4D
	jmp.w $B88A
CODE_9E9E4D:
	lda.w #$0014
	sta.b $A5
	jsl.l $9EB88A
	jmp.w $B2C9
CODE_9E9E59:
	ldy.b $91
	lda.w $11A3,y
	cmp.w #$F7B2
	beq CODE_9E9E69
	lda.w #$FFFF
	sta.w $0AD9
CODE_9E9E69:
	ldy.b $91
	lda.w $1503,y
	bne CODE_9E9E78
	lda.w #$0003
	jsl.l CODE_9C9A7F
	rtl
CODE_9E9E78:
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	rtl
CODE_9E9E8A:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9E9E96
	sta.w $19BE
CODE_9E9E96:
	ldx.b $91
	lda.w #$FF7E
	sta.w $0D55,x
	lda.w #$0000
	sta.w $0EC3,x
	lda.w $0E03,x
	bit.w #$0800
	bne CODE_9E9EB1
	lda.w #$FE60
	bra CODE_9E9EB4
CODE_9E9EB1:
	lda.w #$FDFE
CODE_9E9EB4:
	sta.w $14E3,x
	jsl.l $9EA3F1
	ldx.b $95
	ldy.b $91
	jmp.w $9D79
CODE_9E9EC2:
	lda.b $A5
	sta.b $B9
	lda.w $0D55,y
	sta.b $AD
	lda.w $0DB7,y
	sta.b $B1
	ldx.w #$0048
	ldy.w #$00EA
	lda.b $AD
	bpl CODE_9E9EDD
	ldx.w #$FFB8
CODE_9E9EDD:
	lda.b $B1
	bpl CODE_9E9EE4
	ldy.w #$FF16
CODE_9E9EE4:
	stx.b $A7
	sty.b $AB
	lda.b $AD
	sec
	sbc.b $A7
	sta.b $A5
	lda.b $B1
	sec
	sbc.b $AB
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	ldy.b $91
	sta.b $B5
	cmp.w #$0014
	bcs CODE_9E9F0A
	ldx.b $95
	jmp.w $9D0D
CODE_9E9F0A:
	lda.b $A5
	xba
	tax
	lda.b $B5
	jsl.l DivX8S
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9F1E
	ora.w #$C000
CODE_9E9F1E:
	sta.b $A5
	bit.w #$8000
	beq CODE_9E9F29
	eor.w #$FFFF
	inc a
CODE_9E9F29:
	sta.b $AF
	lda.b $A9
	xba
	tax
	lda.b $B5
	jsl.l DivX8S
	ldx.b $95
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E9F41
	ora.w #$C000
CODE_9E9F41:
	sta.b $A9
	bit.w #$8000
	beq CODE_9E9F4C
	eor.w #$FFFF
	inc a
CODE_9E9F4C:
	cmp.b $AF
	bcs CODE_9E9FA6
	lda.b $A7
	bpl CODE_9E9F7F
	lda.b $B9
	dec a
	cmp.w #$0003
	bcs CODE_9E9F7C
	lda.b $A5
	clc
	adc.w #$0006
	clc
	adc.b $A7
	sta.w $0D55,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w $9C71
CODE_9E9F7C:
	jmp.w $9D0D
CODE_9E9F7F:
	lda.b $B9
	cmp.w #$0005
	bcc CODE_9E9F7C
	lda.b $A5
	sec
	sbc.w #$0006
	clc
	adc.b $A7
	sta.w $0D55,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w $9C36
CODE_9E9FA6:
	lda.b $AB
	bpl CODE_9E9FD1
	lda.b $B9
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9E9F7C
	lda.b $A5
	clc
	adc.b $A7
	sta.w $0D55,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w $9D04
CODE_9E9FD1:
	lda.b $B9
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcc CODE_9E9F7C
	lda.b $A5
	clc
	adc.b $A7
	sta.w $0D55,y
	lda.b $A9
	clc
	adc.b $AB
	sta.w $0DB7,y
	lda.w #$0000
	sta.w $0EC3,y
	sta.w $0EE3,y
	jmp.w $9CDB
CODE_9E9FF9:
	lda.b $B5
	pha
	lda.b $91
	pha
	lda.b $95
