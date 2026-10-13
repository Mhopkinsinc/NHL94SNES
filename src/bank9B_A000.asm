; Bank $9B, third 4 KB: screen code, with auto labels for now. It unpacks the linear tiles DATA8_96D7AC and converts them
; with LinearToPlanar, loads colours and small packed maps from bank $9A, and moves things on screen with the word table
; DATA8_9BAE57 (x and y steps of 2 for eight directions). DATA8_9BA849 and the byte and pointer records after it, and
; the word list DATA8_9BA414, are read here but not identified yet.

org $9BA000
	jmp.w $A110
CODE_9BA003:
	cpx.w #$0026
	beq CODE_9BA076
	cpx.w #$0024
	beq CODE_9BA076
	cpx.w #$0022
	beq CODE_9BA04D
	cpx.w #$0020
	beq CODE_9BA079
	cpx.w #$0028
	beq CODE_9BA038
	ldy.w #$0008
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	cmp.l $7E35E0
	beq CODE_9BA02F
	bcs CODE_9BA076
CODE_9BA02F:
	jsl.l RandomWord
	and.w #$03F0
	bne CODE_9BA076
CODE_9BA038:
	lda.w #$000A
	sta.w $0C2B,x
	tay
	stz.w $0C55,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	bra CODE_9BA0A2
CODE_9BA04D:
	lda.w $0DF9
	cmp.w #$001A
	bmi CODE_9BA076
	asl a
	adc.w $0DF9
	clc
	adc.w $0DD3
	cmp.w #$FEB8
	bpl CODE_9BA076
	cmp.w #$FEB0
	bmi CODE_9BA076
	lda.w $0D71
	cmp.w #$FFF4
	bpl CODE_9BA076
	cmp.w #$FFEC
	bmi CODE_9BA076
	bra CODE_9BA038
CODE_9BA076:
	jmp.w $A106
CODE_9BA079:
	lda.w $0DF9
	cmp.w #$001A
	bmi CODE_9BA076
	asl a
	adc.w $0DF9
	clc
	adc.w $0DD3
	cmp.w #$FE98
	bpl CODE_9BA076
	cmp.w #$FE90
	bmi CODE_9BA076
	lda.w $0D71
	cmp.w #$FFFD
	bpl CODE_9BA076
	cmp.w #$FFF4
	bmi CODE_9BA076
	bra CODE_9BA038
CODE_9BA0A2:
	ldy.w #$0006
	lda.b [$10],y
	asl a
	adc.b [$10],y
	sta.w $0C7F,x
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi CODE_9BA076
	tax
	lda.b [$10]
	jsl.l CODE_808F4C
	ldy.w #$0004
	clc
	adc.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$8000
	sta.b $0C
	lda.w #$0090
	sta.b $0E
	ldy.w #$0002
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	lda.b [$10]
	asl a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l CODE_80891F
	ldx.b $08
	cpx.w #$0028
	bne CODE_9BA106
	lda.w $0C51
	bne CODE_9BA106
	lda.w #$000A
	sta.w $0C4F
	sta.w $0C51
	stz.w $0CA3
	stz.w $0CA5
CODE_9BA106:
	ldx.b $08
	dex
	dex
	bmi CODE_9BA10F
	jmp.w $9FDC
CODE_9BA10F:
	rtl
CODE_9BA110:
	lda.w $0C7F,x
	sec
	sbc.w $0ADB
	sta.w $0C7F,x
	bpl CODE_9BA106
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	ldy.w $0C55,x
	lda.b [$0C],y
	bmi CODE_9BA13C
	iny
	iny
	lda.b [$0C],y
	bmi CODE_9BA13C
	tya
	sta.w $0C55,x
	jmp.w $A0A2
CODE_9BA13C:
	lda.w $0C2B,x
	cmp.w #$000E
	bne CODE_9BA149
	stz.w $0C2B,x
	bra CODE_9BA106
CODE_9BA149:
	cpx.w #$0024
	beq CODE_9BA153
	cpx.w #$0026
	bne CODE_9BA15B
CODE_9BA153:
	lda.w $0C53
	sta.w $0C2B,x
	bra CODE_9BA166
CODE_9BA15B:
	cmp.w #$000C
	beq CODE_9BA178
	lda.w #$000C
	sta.w $0C2B,x
CODE_9BA166:
	ldy.w $0C2B,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	stz.w $0C55,x
	jmp.w $A0A2
CODE_9BA178:
	jsl.l RandomWord
	and.w #$00C0
	bne CODE_9BA166
	lda.w #$000E
	sta.w $0C2B,x
	bra CODE_9BA166
CODE_9BA189:
	phx
	ldx.w #$0012
	lda.w #$0000
CODE_9BA190:
	sta.l $7E340C,x
	dex
	dex
	bpl CODE_9BA190
	plx
	lda.w #$0001
	sta.l $7E3448
	rtl
CODE_9BA1A1:
	lda.w $15DA
	bne CODE_9BA1B4
	lda.w $15D8
	and.w #$0800
	bne CODE_9BA1B4
	lda.l $7E3448
	bne CODE_9BA1B5
CODE_9BA1B4:
	rtl
CODE_9BA1B5:
	ldx.w #$0012
CODE_9BA1B8:
	stx.b $B5
	lda.l $7E340C,x
	beq CODE_9BA1C3
	jmp.w $A31C
CODE_9BA1C3:
	jsl.l RandomWord
	and.w #$07C0
	beq CODE_9BA1CF
	jmp.w $A312
CODE_9BA1CF:
	jsl.l RandomWord
	and.w #$003F
	sta.b $A5
	lsr a
	adc.b $A5
	clc
	adc.w #$0050
	asl a
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l RandomWord
	and.w #$003F
	clc
	adc.w #$0060
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
	jsl.l RandomWord
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	sta.l $7E33A8,x
	jsl.l RandomWord
	and.w #$003F
	clc
	adc.w #$0078
	sta.b $AD
	lda.b $A9
	sec
	sbc.l $7E33A8,x
	tax
	lda.b $AD
	jsl.l DivX8S
	ldx.b $B5
	sta.l $7E33E4,x
	lda.b $A5
	and.w #$0100
	beq CODE_9BA23C
	lda.w #$1100
	sta.l $7E3394,x
	lda.b $A5
	sec
	sbc.w #$1100
	bra CODE_9BA249
CODE_9BA23C:
	lda.w #$FF00
	sta.l $7E3394,x
	lda.b $A5
	sec
	sbc.w #$FF00
CODE_9BA249:
	tax
	lda.b $AD
	jsl.l DivX8S
	ldx.b $B5
	sta.l $7E33D0,x
	lda.b $AD
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $B5
	sta.b $AD
	asl a
	adc.b $AD
	sta.l $7E33BC,x
	jsl.l RandomWord
	lsr a
	lsr a
	and.w #$0003
	beq CODE_9BA276
	dec a
CODE_9BA276:
	sta.b $AD
	asl a
	adc.b $AD
	sta.l $7E3434,x
	lda.w #$0000
	sta.l $7E33F8
	inc a
	sta.l $7E340C,x
	lda.l DATA8_9BA414,x
	sta.l $7E3420,x
CODE_9BA293:
	lda.l $7E3434,x
	clc
	adc.l $7E340C,x
	clc
	adc.w #$03C5
	sta.b $00
	lda.w #$0082
	sta.b $12
	lda.w #$8000
	sta.b $10
	lda.l $7E33BC,x
	lsr a
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2C9
	ora.w #$F000
CODE_9BA2C9:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2DA
	ora.w #$F000
CODE_9BA2DA:
	tax
	lda.w #$2000
	jsl.l DrawSprite
	ldx.b $B5
	lda.w #$03CF
	sta.b $00
	lda.l $7E33A8,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA2F9
	ora.w #$F000
CODE_9BA2F9:
	tay
	lda.l $7E3394,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA30A
	ora.w #$F000
CODE_9BA30A:
	tax
	lda.w #$2000
	jsl.l DrawSprite
CODE_9BA312:
	ldx.b $B5
	dex
	dex
	bmi CODE_9BA31B
	jmp.w $A1B8
CODE_9BA31B:
	rtl
CODE_9BA31C:
	lda.l $7E3420,x
	sec
	sbc.w $0ADB
	bpl CODE_9BA342
	clc
	adc.l DATA8_9BA414,x
	sta.l $7E3420,x
	lda.l $7E340C,x
	inc a
	cmp.w #$0004
	bne CODE_9BA33C
	lda.w #$0001
CODE_9BA33C:
	sta.l $7E340C,x
	bra CODE_9BA346
CODE_9BA342:
	sta.l $7E3420,x
CODE_9BA346:
	ldy.w $0ADB
	beq CODE_9BA352
CODE_9BA34B:
	jsl.l CODE_9BA355
	dey
	bne CODE_9BA34B
CODE_9BA352:
	jmp.w $A293
CODE_9BA355:
	lda.l $7E33D0,x
	ora.l $7E33E4,x
	beq CODE_9BA3A8
	lda.l $7E3394,x
	clc
	adc.l $7E33D0,x
	sta.l $7E3394,x
	lda.l $7E33A8,x
	clc
	adc.l $7E33E4,x
	sta.l $7E33A8,x
	lda.l $7E33BC,x
	beq CODE_9BA3B1
	lda.l $7E33F8,x
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9BA38D
	ora.w #$C000
CODE_9BA38D:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33BC,x
	bmi CODE_9BA3A9
	sta.l $7E33BC,x
	lda.l $7E33F8,x
	clc
	adc.w #$0006
	sta.l $7E33F8,x
CODE_9BA3A8:
	rtl
CODE_9BA3A9:
	lda.w #$0000
	sta.l $7E33BC,x
	rtl
CODE_9BA3B1:
	lda.w #$0000
	sta.l $7E33F8,x
	sta.l $7E33BC,x
	lda.w #$03E8
	sta.l $7E3420,x
	lda.l $7E33D0,x
	cmp.w #$0010
	bcc CODE_9BA408
	cmp.w #$FFF0
	bcs CODE_9BA408
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA3DD
	ora.w #$F000
CODE_9BA3DD:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33D0,x
	sta.l $7E33D0,x
	lda.l $7E33E4,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9BA3FA
	ora.w #$F000
CODE_9BA3FA:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33E4,x
	sta.l $7E33E4,x
	rtl
CODE_9BA408:
	lda.w #$0000
	sta.l $7E33D0,x
	sta.l $7E33E4,x
	rtl
DATA8_9BA414:
	dw $0004,$0008,$0009,$000F,$000C,$000D,$000A,$0007,$000B,$000E
CODE_9BA428:
	lda.w $1C9A
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	jsl.l $9DD9AD
	lda.w #$009C
	sta.b $0E
	lda.w #$8328
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
	ldy.w #$0050
	ldx.w #$0010
	jsl.l $9DE0BD
	jsl.l $9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F163
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0014
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l $9D8091
	lda.w #$0096
	sta.b $0E
	lda.w #$D7AC
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
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.b $10
	sta.b $0C
	tax
	lda.l $7E35C4
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #$CFB6
	sta.b $0C
	ldy.w #$0070
	ldx.w #$0010
	jsl.l $9DE0BD
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l $9DE0D4
	stz.w $1DB9
	jsl.l CODE_8086BD
CODE_9BA4FE:
	jsl.l SpriteFrameStart
	ldx.w #$0048
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #$F168
	sta.b $8D
	jsl.l $9C936C
	jsl.l $9DDDB3
	jsl.l CODE_9BA563
	jsl.l SpriteFrameEnd
CODE_9BA522:
	jsl.l $9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9BA549
	bit.w #$0800
	bne CODE_9BA54A
	bit.w #$0400
	bne CODE_9BA555
	bra CODE_9BA522
CODE_9BA549:
	rtl
CODE_9BA54A:
	lda.w $1DB9
	dec a
	bmi CODE_9BA522
	sta.w $1DB9
	bra CODE_9BA4FE
CODE_9BA555:
	lda.w $1DB9
	inc a
	cmp.w #$0003
	bcs CODE_9BA522
	sta.w $1DB9
	bra CODE_9BA4FE
CODE_9BA563:
	lda.w $1DB9
	beq CODE_9BA59E
CODE_9BA568:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F175
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F181
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9BA5D2
CODE_9BA59E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F188
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F194
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9BA5D2:
	lda.w #$0014
	sta.w $0D0F
	lda.w #$0011
	sta.w $0D11
	lda.w $19C2
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l $9FC623
	jsl.l $9EC7BE
	lda.w $1DB9
	cmp.w #$0001
	beq CODE_9BA62E
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F19B
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1A4
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9BA662
CODE_9BA62E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1AB
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1B4
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9BA662:
	lda.w #$0014
	sta.w $0D0F
	lda.w #$0013
	sta.w $0D11
	lda.w $19C4
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l $9FC623
	jsl.l $9EC7BE
	lda.w $1DB9
	cmp.w #$0002
	beq CODE_9BA6BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1BB
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1C7
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9BA6F2
CODE_9BA6BE:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1CE
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F1DA
	sta.b $8D
	jsl.l $9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9BA6F2:
	lda.w #$0014
	sta.w $0D0F
	lda.w #$0015
	sta.w $0D11
	lda.w $19C6
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l $9FC623
	jsl.l $9EC7BE
	lda.w $1DB9
	beq CODE_9BA724
CODE_9BA715:
	cmp.w #$0001
	beq CODE_9BA71F
	lda.w $19C6
	bra CODE_9BA727
CODE_9BA71F:
	lda.w $19C4
	bra CODE_9BA727
CODE_9BA724:
	lda.w $19C2
CODE_9BA727:
	jsl.l CODE_9BA77C
	rtl
CODE_9BA72C:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	sta.b $0C
CODE_9BA757:
	ldx.w $1DD1
	ldy.w #$0000
CODE_9BA75D:
	lda.b [$0C],y
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	dex
	bne CODE_9BA75D
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne CODE_9BA757
	rtl
CODE_9BA77C:
	sec
	sbc.w #$0032
	bpl CODE_9BA785
	lda.w #$0000
CODE_9BA785:
	lsr a
	lsr a
	sta.b $04
	cmp.w #$0013
	bmi CODE_9BA79F
CODE_9BA78E:
	lda.w #$0000
	sta.b $04
	lda.w #$009A
	sta.b $0E
	lda.w #$DFCB
	sta.b $0C
	bra CODE_9BA7A9
CODE_9BA79F:
	lda.w #$009A
	sta.b $0E
	lda.w #$E919
	sta.b $0C
CODE_9BA7A9:
	lda.b $04
	pha
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
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l CODE_808E2D
	jsl.l WaitFrame
	pla
	sta.b $04
	sta.w $1DD1
	beq CODE_9BA848
CODE_9BA7FB:
	lda.w #$009A
	sta.b $0E
	lda.w #$E8EC
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
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l CODE_9BA72C
CODE_9BA848:
	rtl
DATA8_9BA849:
	db $EF,$E7,$E3,$E0
DATA8_9BA84D:		; records of a byte and a pointer into DATA8_9BA849; $00 ends them
	db $0C : dw DATA8_9BA849+3
	db $06 : dw DATA8_9BA849+2
	db $1C : dw DATA8_9BA849+1
	db $08 : dw DATA8_9BA849
	db $22 : dw DATA8_9BA849+3
	db $18 : dw DATA8_9BA849+1
	db $14 : dw DATA8_9BA849+3
	db $00
CODE_9BA863:
	lda.w $19CE
	bne CODE_9BA89E
	ldy.w #$0033
	ldx.w #$0000
CODE_9BA86E:
	sep #$20
	lda.w $1A13,x
	inc a
	inc a
	sta.w $1A13,x
	lda.w $1A12,x
	inc a
	inc a
	sta.w $1A12,x
	lda.w $1A15,x
	inc a
	inc a
	sta.w $1A15,x
	lda.w $1A14,x
	inc a
	inc a
	sta.w $1A14,x
	rep #$20
	txa
	clc
	adc.w #$000C
	tax
	dey
	bpl CODE_9BA86E
	inc.w $19CE
CODE_9BA89E:
	rtl
CODE_9BA89F:
	lda.w $19CE
	beq CODE_9BA8DA
	ldy.w #$0033
	ldx.w #$0000
CODE_9BA8AA:
	sep #$20
	lda.w $1A13,x
	dec a
	dec a
	sta.w $1A13,x
	lda.w $1A12,x
	dec a
	dec a
	sta.w $1A12,x
	lda.w $1A15,x
	dec a
	dec a
	sta.w $1A15,x
	lda.w $1A14,x
	dec a
	dec a
	sta.w $1A14,x
	rep #$20
	txa
	clc
	adc.w #$000C
	tax
	dey
	bpl CODE_9BA8AA
	dec.w $19CE
CODE_9BA8DA:
	rtl
CODE_9BA8DB:
	lda.w $15D4
	bit.w #$0010
	bne CODE_9BA8EB
	lda.w $0CA9
	beq CODE_9BA8F1
	dec a
	bne CODE_9BA8EE
CODE_9BA8EB:
	jmp.w $AA5F
CODE_9BA8EE:
	sta.w $0CA9
CODE_9BA8F1:
	lda.w $15D8
	bit.w #$0400
	bne CODE_9BA927
	lda.w $0D1F
	clc
	adc.w #$007A
	sta.w $0D1F
	bcc CODE_9BA908
	inc.w $0D21
CODE_9BA908:
	cmp.w #$E676
	bne CODE_9BA927
	lda.w $0D21
	cmp.w #$007E
	bne CODE_9BA927
	lda.w #$0010
	tsb.w $15D8
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w $0D1F
CODE_9BA927:
	sep #$20
	ldx.w $0D1F
	stx.w WMADDL
	lda.w $0D21
	sta.w WMADDH
	lda.b #$0F
	sta.b $AD
	ldx.w #$0000
	ldy.w #$0001
CODE_9BA93F:
	lda.w $0D55,x
	sta.w WMDATA
	lda.w $0D56,x
	and.b #$0F
	sta.b $14
	lda.w $0DB8,x
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	lda.w $0DB7,x
	sta.w WMDATA
	lda.w $0D97,x
	sta.w WMDATA
	lda.w $0D98,x
	and.b #$3F
	sta.b $14
	lda.w $0E04,x
	and.b #$18
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	dec.b $AD
	bpl CODE_9BA93F
	lda.b #$05
	sta.b $AD
	ldx.w #$0000
CODE_9BA985:
	lda.w $13C3,x
	sta.w WMDATA
	lda.w $13C5,x
	sta.w WMDATA
	lda.w $0F43,x
	bpl CODE_9BA998
	lda.b #$FF
CODE_9BA998:
	and.b #$0F
	sta.b $14
	lda.w $0F45,x
	bpl CODE_9BA9A3
	lda.b #$FF
CODE_9BA9A3:
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	inx
	inx
	dec.b $AD
	bpl CODE_9BA985
	lda.w $0DF9
	sta.w WMDATA
	lda.w $0DFB
	sta.w WMDATA
	lda.w $0CAD
	sta.w WMDATA
	lda.w $0CAF
	sta.w WMDATA
	lda.w $0CB0
	sta.w WMDATA
	lda.w $0CB2
	sta.w WMDATA
	lda.w $0CB3
	sta.w WMDATA
	lda.w $0CB5
	sta.w WMDATA
	lda.w $0CB6
	sta.w WMDATA
	lda.w $0CB8
	sta.w WMDATA
	lda.b $C1
	sta.w WMDATA
	lda.w $0AE9
	asl a
	asl a
	asl a
	asl a
	ora.w $0AE7
	sta.w WMDATA
	lda.w $0AED
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEB
	sta.w WMDATA
	lda.w $0AF1
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEF
	sta.w WMDATA
	lda.l $7E35E0
	sta.w WMDATA
	lda.l $7E35E1
	sta.w WMDATA
	lda.w $1624
	sta.w WMDATA
	lda.w $0CEB
	sta.w WMDATA
	lda.w $0CEC
	sta.w WMDATA
	lda.w $0D37
	sta.w WMDATA
	lda.w $0D38
	sta.w WMDATA
	lda.w $0C29
	sta.w WMDATA
	lda.w $0C2A
	sta.w WMDATA
	rep #$20
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
CODE_9BAA5F:
	rtl
CODE_9BAA60:
	lda.w $07F9
	bne CODE_9BAA60
	jsl.l $9C98DF
	lda.w #$0000
	sta.l $7E35E0
	lda.w #$0800
	tsb.w $15D8
	jsl.l $9FB9A4
	lda.w #$FFFF
	sta.w $0CD5
	stz.w $0CD7
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0400
	ldy.w #$0000
	jsl.l CODE_808862
	lda.w #$FFFF
	sta.w $0CAB
	sta.l $7E35F0
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0020
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0008
	sta.b $18
	lda.w #$0008
	sta.b $1A
	lda.w #$0000
	sta.w $079C
	lda.w #$2000
	sta.b $14
	lda.l $7E35AA
	ldx.w #$0002
	ldy.w #$0002
	jsl.l CODE_808A11
	lda.w $0D1F
	pha
	lda.w $0D21
	pha
	lda.w #$0020
	trb.w $15D8
	lda.w $0D37
	pha
	lda.w $0CEB
	pha
	lda.w $0D1F
	cmp.w #$577E
	lda.w $0D21
	sbc.w #$007E
	bcs CODE_9BAB07
CODE_9BAAFB:
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w $0D1F
CODE_9BAB07:
	lda.w #$E676
	cmp.w $0D1F
	lda.w #$007E
	sbc.w $0D21
	bcc CODE_9BAAFB
	lda.w $0D1F
	sec
	sbc.w #$577E
	sta.b $08
	lda.w $0D21
	sbc.w #$007E
	sta.b $0A
	lda.w #$007A
	sta.b $04
	jsl.l Div32U
	lda.b $0A
	bne CODE_9BAAFB
	lda.w $0D21
	sta.b $9B
	lda.w $0D1F
	sta.b $99
	lda.w #$0000
	pha
CODE_9BAB41:
	jsl.l $9BB0C5
	pla
	inc a
	pha
	lda.b $C1
	bne CODE_9BAB41
	pla
	lsr a
	pha
CODE_9BAB4F:
	lda.b $01,s
	beq CODE_9BAB5C
	jsl.l $9BB136
	pla
	dec a
	pha
	bra CODE_9BAB4F
CODE_9BAB5C:
	pla
	lda.w $0CEB
	sta.w $0CBD
	lda.w $0D37
	sta.w $0CBF
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	stz.w $0AD3
	lda.w #$000A
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	jsl.l CODE_8086BD
	jsl.l $9CA19B
	jsl.l SpriteFrameStart
	jsl.l $9FBAAA
	jsl.l SpriteFrameEnd
	lda.w #$0001
	sta.b $C1
	lda.w #$0002
	trb.w $15DC
	jmp.w $ACE5
CODE_9BABAB:
	lda.w $0CAB
	bpl CODE_9BABB3
	jmp.w CODE_80AC3E
CODE_9BABB3:
	tax
	lda.w $0D55,x
	sta.w $0D75
	cmp.w $0CBD
	bpl CODE_9BABD0
	lda.w $0CBD
	sec
	sbc.w #$0004
	cmp.w $0D75
	bpl CODE_9BABCE
CODE_9BABCB:
	lda.w $0D75
CODE_9BABCE:
	bra CODE_9BABDF
CODE_9BABD0:
	lda.w $0CBD
	clc
	adc.w #$0004
	cmp.w $0D75
	bmi CODE_9BABDF
	lda.w $0D75
CODE_9BABDF:
	cmp.w #$FFC0
	bpl CODE_9BABE7
	lda.w #$FFC0
CODE_9BABE7:
	cmp.w #$0040
	bmi CODE_9BABEF
	lda.w #$0040
CODE_9BABEF:
	sta.w $0CEB
	sta.w $0CBD
	lda.w $0DB7,x
	sta.w $0DD7
	cmp.w $0CBF
	bpl CODE_9BAC11
	lda.w $0CBF
	sec
	sbc.w #$0004
	cmp.w $0DD7
	bpl CODE_9BAC0F
CODE_9BAC0C:
	lda.w $0DD7
CODE_9BAC0F:
	bra CODE_9BAC20
CODE_9BAC11:
	lda.w $0CBF
	clc
	adc.w #$0004
	cmp.w $0DD7
	bmi CODE_9BAC20
	lda.w $0DD7
CODE_9BAC20:
	cmp.w #$FF39
	bpl CODE_9BAC28
CODE_9BAC25:
	lda.w #$FF39
CODE_9BAC28:
	cmp.w #$0100
	bmi CODE_9BAC30
CODE_9BAC2D:
	lda.w #$0100
CODE_9BAC30:
	sta.w $0D37
	sta.w $0CBF
	txa
	lsr a
	sta.w $0AF3
	jmp.w $ACCD
CODE_9BAC3E:
	cmp.w #$FFFF
	beq CODE_9BACC1
	lda.w $0D75
	cmp.w $0CBD
	bpl CODE_9BAC5C
	lda.w $0CBD
	sec
	sbc.w #$0002
	cmp.w $0D75
	bpl CODE_9BAC5A
	lda.w $0D75
CODE_9BAC5A:
	bra CODE_9BAC6B
CODE_9BAC5C:
	lda.w $0CBD
	clc
	adc.w #$0002
	cmp.w $0D75
	bmi CODE_9BAC6B
	lda.w $0D75
CODE_9BAC6B:
	cmp.w #$FFC0
	bpl CODE_9BAC73
	lda.w #$FFC0
CODE_9BAC73:
	cmp.w #$0040
	bmi CODE_9BAC7B
	lda.w #$0040
CODE_9BAC7B:
	sta.w $0CEB
	sta.w $0CBD
	lda.w $0DD7
	cmp.w $0CBF
	bpl CODE_9BAC9A
	lda.w $0CBF
	sec
	sbc.w #$0002
	cmp.w $0DD7
	bpl CODE_9BAC98
	lda.w $0DD7
CODE_9BAC98:
	bra CODE_9BACA9
CODE_9BAC9A:
	lda.w $0CBF
	clc
	adc.w #$0002
	cmp.w $0DD7
	bmi CODE_9BACA9
	lda.w $0DD7
CODE_9BACA9:
	cmp.w #$FF39
	bpl CODE_9BACB1
CODE_9BACAE:
	lda.w #$FF39
CODE_9BACB1:
	cmp.w #$0100
	bmi CODE_9BACB9
CODE_9BACB6:
	lda.w #$0100
CODE_9BACB9:
	sta.w $0D37
	sta.w $0CBF
	bra CODE_9BACCD
CODE_9BACC1:
	lda.w $0CEB
	sta.w $0CBD
	lda.w $0D37
	sta.w $0CBF
CODE_9BACCD:
	lda.b $C1
	sta.w $0ADB
	jsl.l $9CA19B
	jsl.l SpriteFrameStart
	jsl.l $9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0CB9
CODE_9BACE5:
	ldx.b $C1
	bne CODE_9BACEA
CODE_9BACE9:
	inx
CODE_9BACEA:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.w #$0001
	sta.b $C1
	lda.b $A5
	bit.w #$0008
	beq CODE_9BAD08
	jmp.w CODE_80AE77
CODE_9BAD08:
	sta.b $B9
	lda.w #$FFFF
	sta.b $B5
	sta.b $B7
	sta.w $0CAB
	lda.w #$0016
	sta.b $89
CODE_9BAD19:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9BAD81
	lda.w $0D55,y
	sec
	sbc.w $0D75
	sta.b $A5
	sta.b $AD
	lda.w $0DB7,y
	sec
	sbc.w $0DD7
	sta.b $A9
	sta.b $B1
	jsl.l $9BB445
	cmp.w #$0008
	beq CODE_9BAD81
	sec
	sbc.b $B9
	beq CODE_9BAD4E
	cmp.w #$0001
	beq CODE_9BAD4E
	cmp.w #$0007
	bne CODE_9BAD81
CODE_9BAD4E:
	lda.b $AD
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9BAD5B
	ora.w #$E000
CODE_9BAD5B:
	tax
	jsl.l CODE_808F7D
	sta.b $A5
	lda.b $B1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9BAD6F
	ora.w #$E000
CODE_9BAD6F:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $A5
	cmp.b $B7
	bcs CODE_9BAD81
	sta.b $B7
	lda.b $89
	sta.b $B5
CODE_9BAD81:
	dec.b $89
	dec.b $89
	bpl CODE_9BAD19
	lda.b $B5
	bmi CODE_9BADA5
	lda.b $B7
	cmp.w #$0002
	bcs CODE_9BADA5
	lda.b $B5
	sta.w $0CAB
	lda.w #$001E
	sta.b $C1
	lda.w #$0020
	trb.w $15D8
	jmp.w $ABAB
CODE_9BADA5:
	phk
	plb
	jsl.l CODE_9B851F
	lda.w #$FFFE
	sta.w $0CAB
	lda.w #$0020
	tsb.w $15D8
	asl.b $A5
	asl.b $A5
	ldy.b $A5
	lda.w DATA8_9BAE57,y
	adc.w $0D75
	sta.b $AD
	ldx.w #$0020
	lda.w DATA8_9BAE57,y
	xba
	and.w #$FF00
	sta.w $0EC3,x
	lda.w $AE59,y
	clc
	adc.w $0DD7
	sta.b $B1
	lda.w $AE59,y
	xba
	and.w #$FF00
	sta.w $0EE3,x
	lda.b $AD
	pha
	lda.b $B1
	pha
	stx.b $95
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l $9E8D3E
	pla
	sta.b $B1
	pla
	sta.b $AD
	lda.w $1123,x
	ora.w $1103,x
	beq CODE_9BAE3E
CODE_9BAE0E:
	lda.w $1123,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BAE1E
	ora.w #$FF00
CODE_9BAE1E:
	clc
	adc.w $0D75
	sta.b $AD
	lda.w $1103,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BAE34
	ora.w #$FF00
CODE_9BAE34:
	eor.w #$FFFF
	inc a
	clc
	adc.w $0DD7
	sta.b $B1
CODE_9BAE3E:
	lda.b $AD
	sta.w $0D75
	sta.w $0CEB
	lda.b $B1
	sta.w $0DD7
	sta.w $0D37
	lda.w #$0010
	sta.w $0AF3
	jmp.w $ABAB
DATA8_9BAE57:		; x and y steps (words) for eight directions
	dw $0000,$0002, $0002,$0002, $0002,$0000, $0002,$FFFE
	dw $0000,$FFFE, $FFFE,$FFFE, $FFFE,$0000, $FFFE,$0002
CODE_9BAE77:
	lda.w $0CAB
	cmp.w #$FFFF
	bne CODE_9BAECF
	lda.w $0AE7
	cmp.w #$000F
	beq CODE_9BAE9D
	asl a
	tax
	lda.w #$000F
	sta.w $0AF3
	lda.w $0D55,x
	sta.w $0D75
	lda.w $0DB7,x
	sta.w $0DD7
	bra CODE_9BAECF
CODE_9BAE9D:
	lda.w #$000F
	sta.w $0AF3
	lda.w $0D71
	cmp.w #$FF78
	bpl CODE_9BAEAE
CODE_9BAEAB:
	lda.w #$FF78
CODE_9BAEAE:
	cmp.w #$0088
	bmi CODE_9BAEB6
CODE_9BAEB3:
	lda.w #$0088
CODE_9BAEB6:
	sta.w $0D75
	lda.w $0DD3
	cmp.w #$FED4
	bpl CODE_9BAEC4
CODE_9BAEC1:
	lda.w #$FED4
CODE_9BAEC4:
	cmp.w #$012C
	bmi CODE_9BAECC
CODE_9BAEC9:
	lda.w #$012C
CODE_9BAECC:
	sta.w $0DD7
CODE_9BAECF:
	lda.b $A9
	bit.w #$8000
	beq CODE_9BAF03
	lda.l $7E35F0
	beq CODE_9BAEFA
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0180
	ldy.w #$0000
	jsl.l CODE_808862
	jsl.l WaitFrame
	lda.w #$0000
	sta.l $7E35F0
CODE_9BAEFA:
	lda.w $15DC
	eor.w #$0002
	sta.w $15DC
CODE_9BAF03:
	lda.b $B1
	bit.w #$0020
	bne CODE_9BAF31
	bit.w #$0050
	bne CODE_9BAF56
	lda.b $A9
	bit.w #$2000
	bne CODE_9BAF3D
	bit.w #$1000
	bne CODE_9BAF3A
	lda.b $B1
	bit.w #$0080
	bne CODE_9BAF4C
	bit.w #$4000
	beq CODE_9BAF80
	jsl.l $9BB0C5
	jsl.l $9BB0C5
	bra CODE_9BAF6E
CODE_9BAF31:
	jsl.l $9BB0C5
	ldx.w #$0006
	bra CODE_9BAF67
CODE_9BAF3A:
	jmp.w $B020
CODE_9BAF3D:
	lda.w #$FFFF
	sta.w $0CAB
	lda.w #$0020
	trb.w $15D8
	jmp.w $ACE5
CODE_9BAF4C:
	jsl.l $9BB136
	jsl.l $9BB136
	bra CODE_9BAF6E
CODE_9BAF56:
	jsl.l $9BB136
	ldx.w #$0006
	lda.b $B1
	bit.w #$0010
	bne CODE_9BAF67
	ldx.w #$000C
CODE_9BAF67:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
CODE_9BAF6E:
	jsl.l SoundVoicesOff
	lda.w #$0001
	sta.b $C1
	lda.w #$0002
	trb.w $15DC
	jmp.w $ABAB
CODE_9BAF80:
	lda.w $15DC
	bit.w #$0002
	bne CODE_9BAF8B
	jmp.w $ACE5
CODE_9BAF8B:
	jsl.l $9BB136
	lda.b $C1
	beq CODE_9BAF6E
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BAFD8
	cmp.w #$0016
	bcs CODE_9BAFD0
	lda.w $0CB7
	sta.b $64
	lda.w $0CB3
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9BAFCC
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CB5
	sta.w $094A,y
CODE_9BAFCC:
	rep #$20
	bra CODE_9BAFD8
CODE_9BAFD0:
	sec
	sbc.w #$0015
	jsl.l $9C9A7F
CODE_9BAFD8:
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9BB01D
	cmp.w #$0016
	bcs CODE_9BB015
	lda.w $0CB1
	sta.b $64
	lda.w $0CAD
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne CODE_9BB011
