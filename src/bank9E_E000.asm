; Bank $9E, seventh 4 KB: more game code with auto labels for now, and small tables of signed words it reads
; (DATA8_9EE43F, DATA8_9EE5CE, and DATA8_9EEED4 to DATA8_9EEF1C, read in pairs as values and adjustments).

org $9EE002
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	ldy.w #$0000
	lda.w $1503,x
	bne CODE_9EE014
	ldy.w #$000C
CODE_9EE014:
	lda.w $0F43,y
	beq CODE_9EE022
	iny
	iny
	dec.b $A9
	bpl CODE_9EE014
	jmp.w $E0C7
CODE_9EE022:
	lda.w $0EC4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE030
	ora.w #$FF00
CODE_9EE030:
	pha
	asl a
	pla
	ror a
	clc
	adc.w $0D55,y
	sec
	sbc.w $0D71
	sta.b $A5
	lda.w $0EE4,y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EE04C
	ora.w #$FF00
CODE_9EE04C:
	pha
	asl a
	pla
	ror a
	clc
	adc.w $0DB7,y
	sec
	sbc.w $0DD3
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	sta.b $AD
	lda.w #$0012
	sta.b $B1
	ldy.w #$0108
	lda.w $14C3,x
	bne CODE_9EE072
	ldy.w #$FEF8
CODE_9EE072:
	sty.b $B5
	tya
	pha
	lda.b $B1
	pha
	jsr.w $E0CD
	lda.b $B5
	sta.b $B9
	pla
	eor.w #$FFFF
	inc a
	sta.b $B1
	pla
	sta.b $B5
	jsr.w $E0CD
	lda.b $B5
	clc
	adc.b $B9
	sta.b $B5
	ldx.b $95
	stz.b $A5
	lda.b $B5
	cmp.w #$FFD3
	bmi CODE_9EE0C7
	cmp.w #$002D
	bpl CODE_9EE0C7
	lda.w $14C3,x
	beq CODE_9EE0B1
	lda.w #$0000
	sec
	sbc.b $B5
	sta.b $B5
CODE_9EE0B1:
	jsl.l RandomWord
	and.w #$0003
	inc a
	sta.b $A5
	lda.b $B5
	bpl CODE_9EE0C7
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $A5
CODE_9EE0C7:
	lda.b $A5
	sta.w $0D03
CODE_9EE0CC:
	rtl
CODE_9EE0CD:
	lda.b $B1
	sec
	sbc.w $0D71
	sta.b $B1
	lda.b $B5
	sec
	sbc.w $0DD3
	ldx.b $A5
	jsl.l Mul16S
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b $B5
	lda.b $A9
	ldx.b $B1
	jsl.l Mul16S
	lda.b $B5
	sec
	sbc.b $08
	sta.b $08
	lda.b $B7
	sbc.b $0A
	sta.b $0A
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	sta.b $B5
	rts
CODE_9EE10B:
	pla
	sep #$20
	pla
	rep #$30
	lda.w $0DD3
	sta.b $A5
	lda.w $14C3,x
	bne CODE_9EE123
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE123:
	lda.w #$0108
	sec
	sbc.b $A5
	lsr a
	lsr a
	lsr a
	cmp.w #$0014
	bcc CODE_9EE134
	lda.w #$0014
CODE_9EE134:
	sta.b $A9
	stz.w $1023,x
	lda.b $A9
	sta.w $10A3,x
	lda.w #$0013
	sta.b $A5
	jmp.w $8C18
	lda.w $1283,x
	bit.w #$0002
	beq CODE_9EE156
	and.w #$FFFD
	sta.w $1283,x
	bra CODE_9EE17A
CODE_9EE156:
	lda.w $15D8
	bit.w #$0008
	bne CODE_9EE161
	jmp.w $8BE6
CODE_9EE161:
	lda.w $1003,x
	sta.b $A5
	stz.b $AD
	lda.w $10A3,x
	sec
	sbc.b $C1
	sta.w $10A3,x
	bpl ShotMode
	lda.w #$0080
	tsb.b $AD
	bra ShotMode
CODE_9EE17A:
	lda.w #$0008
	sta.w $0D03
	lda.w #$0008
	tsb.w $15D8
	stz.b $A5
	lda.w #$0128
	sta.b $A9
	lda.w $14C3,x
	bne CODE_9EE197
	lda.w #$FED8
	sta.b $A9
CODE_9EE197:
	lda.b $A5
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.b $A9
	sec
	sbc.w $0DB7,x
	sta.b $A9
	jsl.l vtoa
	lda.w #$000F
	sta.w $0D05
	ldy.w #$ED4A
	jsl.l Findhittype
	beq CODE_9EE1BD
	ldy.w #$EE5C
CODE_9EE1BD:
	sty.b $A9
	jml.l SetSPA
ShotMode:
	cpx.w $0AD9
	bne CODE_9EE219
	lda.w $11A3,x
	cmp.w #$ED4A
	bcc CODE_9EE219
	cmp.w #$F021
	bcs CODE_9EE219
	lda.w $11C3,x
	cmp.w #$0018
	bcs CODE_9EE220
	lda.b $A5
	bit.w #$0008
	bne CODE_9EE1EA
	and.w #$0007
	sta.w $0D03
CODE_9EE1EA:
	lda.w $11C3,x
	cmp.w #$0010
	bcs CODE_9EE21F
	lda.w $0D05
	clc
	adc.b $C1
	sta.w $0D05
	lda.b $AD
	bit.w #$0080
	beq CODE_9EE21F
	lda.w #$001C
	sec
	sbc.w $11C3,x
	sta.w $11C3,x
	cmp.w #$0018
	bcc CODE_9EE21F
	lda.w #$0018
	sta.w $11C3,x
	bra CODE_9EE220
CODE_9EE219:
	lda.w #$0008
	trb.w $15D8
CODE_9EE21F:
	rtl
CODE_9EE220:
	jsl.l CODE_9EDFF7
	lda.w #$0007
	pha
	lda.w #$0008
	trb.w $15D8
	sta.w $14E3,x
	stx.w $0D29
	cpx.w $0AD9
	beq CODE_9EE23C
	jmp.w $E408
CODE_9EE23C:
	lda.w #$0001
	sta.b $01,s
	lda.w #$1000
	tsb.w $15D8
	lda.w $11A3,x
	cmp.w #$EE5C
	bne CODE_9EE264
	lda.w #$0001
	sta.b $01,s
	lda.w $0D05
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w $0D05
	sta.w $0D05
CODE_9EE264:
	lda.w $0D05
	sta.w $0BC5
	cmp.w #$001E
	bcc CODE_9EE274
	lda.w #$0002
	sta.b $01,s
CODE_9EE274:
	lda.w $1363,x
	stx.b $89
	jsl.l CODE_9FDCEB
	adc.w #$0014
	tax
	lda.w $0D05
	jsl.l CODE_808F98
	ldx.b $08
	lda.w #$2570
	jsl.l Mul16U
	lda.b $0A
	sta.w $0D05
	lda.w $1E8B
	beq CODE_9EE2A5
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
CODE_9EE2A5:
	ldx.b $E4
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0010
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	ldy.w #$0108
	lda.w $14C3,x
	bne CODE_9EE2C3
	ldy.w #$FEF8
CODE_9EE2C3:
	sty.b $A9
	lda.w $0D03
	asl a
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EE43F
	sta.b $89
	lda.b [$89],y
	sec
	sbc.w $0D71
	sta.b $A5
	iny
	iny
	lda.b [$89],y
	sta.b $AD
	pha
	lda.b $A9
	sec
	sbc.w $0DD3
	sta.b $A9
	pha
	lda.b $A5
	pha
	lda.b $A5
	ldy.b $A9
	jsl.l CODE_9CA554
	cmp.w #$0000
	bne CODE_9EE2FE
	inc a
CODE_9EE2FE:
	sta.b $B1
	lda.w $15D4
	bit.w #$0010
	beq CODE_9EE30B
	jmp.w $E387
CODE_9EE30B:
	lda.b $B1
	cmp.w #$00C9
	bcs CODE_9EE321
	lda.w #$0010
	adc.w $1383,x
	jsl.l CODE_9BB385
	cmp.w #$000F
	bcs CODE_9EE387
CODE_9EE321:
	lda.w $0D05
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $1383,x
	clc
	adc.w #$0010
	ldx.b $B1
	jsl.l Mul16U
	lda.b $08
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	lda.b $B1
	cmp.w #$00FB
	bcs CODE_9EE348
	lsr.b $A5
CODE_9EE348:
	lda.b $A5
	cmp.w #$0088
	bcc CODE_9EE354
	lda.w #$0088
	sta.b $A5
CODE_9EE354:
	pha
	jsl.l CODE_9BB3A4
	adc.b $03,s
	sta.b $03,s
	lda.b $01,s
	sta.b $A5
	cmp.w #$003D
	bcc CODE_9EE36D
	lda.w #$003C
	sta.b $A5
	sta.b $01,s
CODE_9EE36D:
	lda.b $05,s
	bpl CODE_9EE373
	lsr.b $A5
CODE_9EE373:
	jsl.l CODE_9BB3B0
	lda.b $05,s
	adc.b $A5
	sta.b $05,s
	pla
	lsr a
	jsl.l CODE_9BB370
	adc.b $05,s
	sta.b $05,s
CODE_9EE387:
	ldx.w $0D05
	lda.w #$0044
	jsl.l CODE_808F5D
	plx
	jsl.l Mul16S
	lda.b $B1
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w $0EDF
	ldx.w $0D05
	lda.w #$0044
	jsl.l CODE_808F5D
	plx
	jsl.l Mul16S
	lda.b $B1
	sta.b $04
	jsl.l Div32S
	lda.b $00
	asl a
	sta.w $0EFF
	ldx.b $E4
	pla
	beq CODE_9EE408
	tax
	lda.w $0D05
	jsl.l CODE_808F98
	ldx.b $08
	lda.w #$0044
	jsl.l CODE_808F98
	lda.b $B1
	sta.b $04
	jsl.l Div32U
	lda.b $00
	asl a
	sta.b $A9
	lda.w #$0B33
	ldx.b $B1
	jsl.l Mul16U
	lda.w $0D05
	sta.b $04
	jsl.l Div32U
	ldx.b $E4
	lda.b $00
	lsr a
	adc.b $A9
	cmp.w #$1801
	bcc CODE_9EE405
	lda.w #$1800
CODE_9EE405:
	sta.w $0E01
CODE_9EE408:
	pla
	jsl.l CODE_9C9ABC
	ldx.b $95
	ldy.w #$0108
	lda.w $14C3,x
	bne CODE_9EE41A
	ldy.w #$FEF8
CODE_9EE41A:
	sty.b $C5
	tya
	sec
	sbc.w $0DD3
	eor.w $0EFF
	bpl CODE_9EE430
	lda.w #$0000
	sec
	sbc.w $0EFF
	sta.w $0EFF
CODE_9EE430:
	lda.w $163A
	beq CODE_9EE43E
	lda.w #$0012
	sta.b $A5
	jsl.l CODE_9E8C18
CODE_9EE43E:
	rtl
DATA8_9EE43F:
	dw 0,12,15,12,15,6,15,0,0
	dw 0,-15,0,-15,6,-15,12,0,6
	cpx.w $0AD9
	bne CODE_9EE46D
	lda.w $19D4,x
	bmi CODE_9EE47E
CODE_9EE46D:
	jmp.w $8BE6
CODE_9EE470:
	rtl
CODE_9EE471:
	jsl.l CODE_9E8000
	lda.w #$003C
	sta.w $1203,x
	jmp.w $8BD7
CODE_9EE47E:
	lda.w $15D6
	bne CODE_9EE471
	lda.w $0DB7,x
	sta.b $A5
	ldy.w $14C3,x
	bne CODE_9EE495
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE495:
	lda.w $1283,x
	bit.w #$0002
	beq CODE_9EE4BE
	and.w #$FFFD
	sta.w $1283,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1EA7
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
	jsr.w $E5E6
CODE_9EE4BE:
	lda.w $1EA5
	bmi CODE_9EE502
	lda.b $A5
	cmp.w $1EA5
	bmi CODE_9EE4D3
	jsr.w $E593
	lda.w $1163,x
	sta.w $1EAB
CODE_9EE4D3:
	lda.w $1EA1
	sta.b $A5
	lda.w $1EA3
	sta.b $A9
	lda.w $14C3,x
	bne CODE_9EE4EA
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EE4EA:
	lda.w #$009E
	sta.b $8B
	lda.w #$E592
	sta.b $89
	lda.w $1023,x
	sec
	sbc.w $0CDD
	sta.w $1023,x
	jml.l CODE_9EA5A4
CODE_9EE502:
	lda.w $1163,x
	sec
	sbc.w $1EAB
	beq CODE_9EE4D3
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EE51F
	jsl.l RandomWord
	and.w #$0F80
	bne CODE_9EE4D3
	bra CODE_9EE528
CODE_9EE51F:
	jsl.l RandomWord
	and.w #$0600
	bne CODE_9EE4D3
CODE_9EE528:
	jsl.l RandomWord
	and.w #$0001
	inc a
	inc a
	sta.b $A5
	ldy.w $1EA9
	bpl CODE_9EE540
	lda.b $A5
	clc
	adc.w #$0003
	sta.b $A5
CODE_9EE540:
	lda.b $A5
	sta.w $0D03
	lda.w #$0014
	sta.w $0D05
	lda.w #$0000
	sec
	sbc.w $0D55,x
	sta.b $A5
	lda.w $14C3,x
	bne CODE_9EE564
	lda.w #$FEF8
	sec
	sbc.w $0DB7,x
	sta.b $A9
	bra CODE_9EE56D
CODE_9EE564:
	lda.w #$0108
	sec
	sbc.w $0DB7,x
	sta.b $A9
CODE_9EE56D:
	jsl.l vtoa
	jsl.l Findhittype
	beq CODE_9EE57C
	lda.w #$F020
	bra CODE_9EE57F
CODE_9EE57C:
	lda.w #$EF6E
CODE_9EE57F:
	jsl.l CODE_9EA3F1
	jsl.l CODE_9EA419
	lda.w #$0002
	sta.w $11E3,x
	jsl.l CODE_9EE220
	rtl
	rtl
CODE_9EE593:
	lda.w $1EA7
	asl a
	adc.w $1EA7
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EE5CE
	sta.b $89
	lda.b [$89],y
	sta.b $A5
	lda.w $1EA9
	bpl CODE_9EE5B7
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE5B7:
	lda.b $A5
	sta.w $1EA1
	iny
	iny
	lda.b [$89],y
	sta.w $1EA3
	iny
	iny
	lda.b [$89],y
	sta.w $1EA5
	inc.w $1EA7
	rts
DATA8_9EE5CE:
	dw 40,120,74,-22,151,134,-22,224,177,44,227,-1
CODE_9EE5E6:
	lda.b $A5
	cmp.w #$002C
	bpl CODE_9EE635
	jsl.l RandomWord
	and.w #$00C0
	beq CODE_9EE600
	lda.w $0E03,x
	bit.w #$0800
	bne CODE_9EE611
	bra CODE_9EE616
CODE_9EE600:
	jsl.l RandomWord
	and.w #$00F0
	sta.b $A5
	lda.w #$007F
	sec
	sbc.b $A5
	bmi CODE_9EE616
CODE_9EE611:
	lda.w #$002D
	bra CODE_9EE619
CODE_9EE616:
	lda.w #$FFD3
CODE_9EE619:
	ldy.w $14C3,x
	bne CODE_9EE622
CODE_9EE61E:
	eor.w #$FFFF
	inc a
CODE_9EE622:
	sta.w $1EA9
	sta.w $1EA1
	lda.w #$0028
	sta.w $1EA3
	lda.w #$001E
	sta.w $1EA5
	rts
CODE_9EE635:
	lda.w $0D55,x
	cmp.w #$0020
	bpl CODE_9EE690
	cmp.w #$FFE0
	bmi CODE_9EE690
	jsl.l RandomWord
	and.w #$00C0
	beq CODE_9EE655
	lda.w $0E03,x
	bit.w #$0800
	bne CODE_9EE666
	bra CODE_9EE66B
CODE_9EE655:
	jsl.l RandomWord
	and.w #$00F0
	sta.b $A5
	lda.w #$007F
	sec
	sbc.b $A5
	bmi CODE_9EE66B
CODE_9EE666:
	lda.w #$002C
	bra CODE_9EE66E
CODE_9EE66B:
	lda.w #$FFD4
CODE_9EE66E:
	ldy.w $14C3,x
	bne CODE_9EE677
	eor.w #$FFFF
	inc a
CODE_9EE677:
	sta.w $1EA9
	sta.w $1EA1
CODE_9EE67D:
	lda.w #$0002
	sta.w $1EA7
	lda.w #$0097
	sta.w $1EA3
	lda.w #$0086
	sta.w $1EA5
	rts
CODE_9EE690:
	sta.w $1EA9
	stz.w $1EA1
	bra CODE_9EE67D
Findhittype:
	lda.b $A5
	eor.w #$FFFF
	inc a
	clc
	adc.w $1163,x
	and.w #$0007
	sta.b $A5
	lda.w $0E03,x
	bit.w #$0800
	beq CODE_9EE6BB
	phx
	ldx.b $A5
	lda.l DATA8_9EE6C7,x
	plx
	and.w #$00FF
	rtl
CODE_9EE6BB:
	phx
	ldx.b $A5
	lda.l DATA8_9EE6C7+3,x
	plx
	and.w #$00FF
	rtl
DATA8_9EE6C7:
	db $00,$00,$00,$00,$01,$01,$01,$01,$00,$00,$00
CODE_9EE6D2:
	lda.w $0F43,x
	bne CODE_9EE6F6
	lda.w $0D71
	cmp.w #$FFF0
	bmi CODE_9EE6F6
	cmp.w #$0010
	bpl CODE_9EE6F6
	lda.w $0DD3
	cmp.w #$0108
	bpl CODE_9EE6F1
	cmp.w #$FEF8
	bpl CODE_9EE6F6
CODE_9EE6F1:
	cmp.w #$0110
	bcc CODE_9EE705
CODE_9EE6F6:
	lda.w $1163,x
	and.w #$0007
	sta.w $0D03
	lda.w #$0004
	tsb.w $15D8
CODE_9EE705:
	rtl
	lda.w $1283,x
	bit.w #$0002
	beq CODE_9EE720
	and.w #$FFFD
	ora.w #$0001
	sta.w $1283,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9EE720:
	lda.w $0BAD,x
	sec
	sbc.w $0ADB
	sta.w $0BAD,x
	bmi CODE_9EE77E
	lda.w $0AD9
	bpl CODE_9EE77E
	lda.w $0BAB
	bne CODE_9EE797
	ldy.w $19D4,x
	bmi CODE_9EE74E
	lda.w $0AB8,y
	bit.w #$8000
	bne CODE_9EE77E
	bit.w #$0080
	beq CODE_9EE74E
CODE_9EE748:
	inc.w $0BAB
	bra CODE_9EE797
CODE_9EE74D:
	rtl
CODE_9EE74E:
	ldy.b $91
	lda.w $19D0,y
	bne CODE_9EE779
	lda.w $14C3,x
	bne CODE_9EE771
	lda.w $0DB7,x
	cmp.w #$FFA8
	bpl CODE_9EE779
CODE_9EE762:
	jsl.l RandomWord
	and.w #$0080
	bne CODE_9EE779
	inc.w $0BAB
	jmp.w $E797
CODE_9EE771:
	lda.w $0DB7,x
	cmp.w #$0058
	bpl CODE_9EE762
CODE_9EE779:
	lda.w $0AD9
	bmi CODE_9EE796
CODE_9EE77E:
	lda.w #$FFFF
	sta.w $0D07
	stz.w $14E3,x
	stz.w $0BAB
	lda.w $1283,x
	and.w #$FFFE
	sta.w $1283,x
	jmp.w $8BE6
CODE_9EE796:
	rtl
CODE_9EE797:
	lda.w $11A3,x
	cmp.w #$EF6E
	beq CODE_9EE7F6
	cmp.w #$F020
	beq CODE_9EE7F6
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9EE7B0
	ldy.w #$0002
CODE_9EE7B0:
	lda.w $17D2,y
	inc a
	sta.w $17D2,y
	ply
	lda.w #$0000
	sec
	sbc.w $0BA7
	sta.b $A5
	lda.w $14C3,x
	bne CODE_9EE7D1
	lda.w #$FEF8
	sec
	sbc.w $0BA9
	sta.b $A9
	bra CODE_9EE7DA
CODE_9EE7D1:
	lda.w #$0108
	sec
	sbc.w $0BA9
	sta.b $A9
CODE_9EE7DA:
	jsl.l vtoa
	jsl.l Findhittype
	beq CODE_9EE7E9
	lda.w #$F020
	bra CODE_9EE7EC
CODE_9EE7E9:
	lda.w #$EF6E
CODE_9EE7EC:
	jsl.l CODE_9EA3F1
	jmp.w $E796
CODE_9EE7F3:
	jmp.w $E77E
CODE_9EE7F6:
	lda.w #$000A
	sta.w $1203,x
	lda.w $11C3,x
	cmp.w #$0010
	bcs CODE_9EE7F3
	txa
	jsl.l CODE_9BC002
	lda.w $0D55,x
	clc
	adc.b $A5
	sec
	sbc.w $0D71
	sta.b $A5
	lda.w $0DB7,x
	clc
	adc.b $A9
	sec
	sbc.w $0DD3
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	cmp.w #$0008
	bcs CODE_9EE891
	stz.w $11E3,x
	cmp.w #$000C
	bcs CODE_9EE891
	stx.w $0AD9
	ldy.w $19D4,x
	bmi CODE_9EE844
CODE_9EE83C:
	lda.w $0AA4,y
	sta.w $0D03
	bra CODE_9EE84A
CODE_9EE844:
	lda.w #$0008
	sta.w $0D03
CODE_9EE84A:
	lda.w #$0024
	sta.w $0D05
	sta.w $14E3,x
	lda.w $15D6
	bne CODE_9EE86C
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9EE864
	ldy.w #$0002
CODE_9EE864:
	lda.w $17D6,y
	inc a
	sta.w $17D6,y
	ply
CODE_9EE86C:
	lda.w #$0001
	sta.w $1E89
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EE87E
	sta.w $19BE
CODE_9EE87E:
	lda.b $91
	pha
	stx.b $91
	jsl.l a2touchpuck
	pla
	sta.b $91
	jsl.l CODE_9EE220
	jmp.w $E77E
CODE_9EE891:
	lda.w $0AD9
	bmi CODE_9EE89E
CODE_9EE896:
	cpx.w $0AD9
	beq CODE_9EE89E
	jmp.w $E77E
CODE_9EE89E:
	rtl
CODE_9EE89F:
	lda.w $0D2D
	bne CODE_9EE8B4
	lda.w #$0010
	clc
	adc.w $13E3,x
	jsl.l CODE_9BB385
	cmp.w #$0009
	bcs CODE_9EE8ED
CODE_9EE8B4:
	lda.w #$0006
	jsl.l CODE_9BB385
	sta.b $A5
	cpx.w #$000C
	bcc CODE_9EE8C8
	clc
	adc.w #$0006
	sta.b $A5
CODE_9EE8C8:
	lda.w $0F43,x
	beq CODE_9EE8E7
	lda.w $0D71
	cmp.w #$FFD7
	bmi CODE_9EE8E7
	cmp.w #$0029
	bpl CODE_9EE8E7
	lda.w $0DD3
	cmp.w #$FF33
	bmi CODE_9EE8ED
	cmp.w #$00CD
	bpl CODE_9EE8ED
CODE_9EE8E7:
	asl.b $A5
	cpx.b $A5
	bne CODE_9EE8EE
CODE_9EE8ED:
	rtl
CODE_9EE8EE:
	ldy.b $A5
	sty.b $89
	lda.w $0F43,y
	beq CODE_9EE8ED
	bmi CODE_9EE8ED
	lda.w $1283,y
	and.w #$1000
	ora.w $14E3,y
	bne CODE_9EE8ED
	lda.w $0DB7,y
	sta.b $A5
	lda.w $0DB7,x
	sta.b $A9
	lda.w $14C3,x
	bne CODE_9EE923
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EE923:
	lda.w $15D4
	bit.w #$0020
	beq CODE_9EE93D
	lda.b $A5
	sec
	sbc.w #$0058
	sta.b $C5
	lda.b $A9
	sec
	sbc.w #$0058
	eor.b $C5
	bmi CODE_9EE8ED
CODE_9EE93D:
	lda.b $A5
	cmp.w #$0058
	bpl CODE_9EE950
	lda.b $A5
	sec
	sbc.b $A9
	sta.b $A5
	cmp.w #$FFF1
	bmi CODE_9EE9A2
CODE_9EE950:
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w $0D03
	lda.w $0B3D,y
	sta.b $AD
	lda.w #$0005
	sta.b $B1
	ldy.w #$0000
	stz.b $8D
	cpx.w #$000C
	bcs CODE_9EE974
	ldy.w #$000C
CODE_9EE974:
	lda.b $AD
	cmp.w $0B3D,y
	bcc CODE_9EE98A
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.w $0D03
	beq CODE_9EE9A2
CODE_9EE98A:
	iny
	iny
	dec.b $B1
	bpl CODE_9EE974
	jsl.l CODE_9EE9BF
	lda.w $0F43,x
	beq CODE_9EE9A2
	pla
	sep #$20
	pla
	rep #$30
	jmp.w $8BE6
CODE_9EE9A2:
	rtl
passmode:
	lda.b $AD
	bit.w #$8000
	bne CODE_9EE9BF
	lda.b $A5
	bit.w #$0008
	bne CODE_9EE9BE
	and.w #$0007
	sta.w $0D03
	ora.w #$0008
	sta.b $A5
	bra CODE_9EE9BF
CODE_9EE9BE:
	rtl
CODE_9EE9BF:
	stz.w $0BAB
	lda.w #$0004
	trb.w $15D8
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$0010
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	lda.w #$0007
	sta.b $A5
	lda.w $0F43,x
	beq CODE_9EE9E8
	lda.w $13A3,x
	sta.b $A5
CODE_9EE9E8:
	lda.b $A5
	asl a
	asl a
	adc.w #$0090
	sta.w $0D05
	lda.w #$FFFF
	sta.b $B5
	lda.w #$0005
	sta.b $B1
	stz.b $8D
	cpx.w #$000C
	bcc CODE_9EEA08
	lda.w #$000C
	sta.b $8D
CODE_9EEA08:
	cpx.b $8D
	beq CODE_9EEA50
	ldy.b $8D
	lda.w $0F43,y
	bmi CODE_9EEA50
	beq CODE_9EEA50
	lda.w $1283,y
	bit.w #$1000
	bne CODE_9EEA50
	lda.w $0B5D,y
	sec
	sbc.w $0D03
	sec
	sbc.w #$0004
	stz.b $00
	and.w #$0007
	beq CODE_9EEA3E
	cmp.w #$0001
	beq CODE_9EEA39
	cmp.w #$0007
	bne CODE_9EEA50
CODE_9EEA39:
	lda.w #$1000
	sta.b $00
CODE_9EEA3E:
	lda.b $00
	clc
	adc.w $0B3D,y
	bcs CODE_9EEA50
	cmp.b $B5
	bcs CODE_9EEA50
	sta.b $B5
	lda.b $8D
	sta.b $89
CODE_9EEA50:
	inc.b $8D
	inc.b $8D
	dec.b $B1
	bmi CODE_9EEA5B
	jmp.w $EA08
CODE_9EEA5B:
	ldx.b $95
	lda.b $B5
	bmi CODE_9EEA6F
	jsl.l CODE_9EEB2E
	lda.w #$0000
	jsl.l CODE_9C9ABC
	jmp.w $EACC
CODE_9EEA6F:
	lda.w $0D03
	asl a
	asl a
	adc.w #$DA08
	sta.b $89
	lda.w #$0080
	sta.b $8B
	lda.b [$89]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l CODE_808F5D
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w $0EFF
	dec.b $89
	dec.b $89
	lda.b [$89]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l CODE_808F5D
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w $0EDF
	jsl.l RandomWord
	and.w #$0FFF
	sta.w $0E01
CODE_9EEACC:
	lda.w $0F43,x
	bne CODE_9EEAE9
	lda.w $14C3,x
	beq CODE_9EEADD
	lda.w $0EFF
	bmi CODE_9EEAE2
	bra CODE_9EEAE9
CODE_9EEADD:
	lda.w $0EFF
	bmi CODE_9EEAE9
CODE_9EEAE2:
	eor.w #$FFFF
	inc a
	sta.w $0EFF
CODE_9EEAE9:
	lda.w $0EDF
	sta.b $A5
	lda.w $0EFF
	sta.b $A9
	jsl.l vtoa
	ldy.w #$E34E
	lda.w $0F43,x
	beq CODE_9EEB0B
	ldy.w #$EC66
	jsl.l Findhittype
	beq CODE_9EEB0B
	ldy.w #$ECD8
CODE_9EEB0B:
	sty.b $A9
	jsl.l SetSPA
	lda.w #$0001
	sta.w $14E3,x
	lda.w $0F43,x
	bne CODE_9EEB2D
	lda.w $19D4,x
	bmi CODE_9EEB2D
	stz.w $0EC3,x
	stz.w $0EE3,x
	sta.b $B5
	jsl.l CODE_9FCBB6
CODE_9EEB2D:
	rtl
CODE_9EEB2E:
	jsl.l CODE_9FC757
	lda.w $15D6
	bne CODE_9EEB40
	ldy.b $91
	lda.w $17BE,y
	inc a
	sta.w $17BE,y
CODE_9EEB40:
	ldx.w $0B9D,y
	lda.w $1343,x
	lsr a
	clc
	adc.w #$0001
	adc.w $1003,x
	sta.w $1003,x
	lda.b $89
	sta.w $0D07
	ldx.b $89
	lda.w #$0015
	sta.b $A5
	jsl.l CODE_9E8C0E
	ldx.b $95
	ldy.b $89
	lda.w $0D97,y
	pha
	lda.w $0E03,y
	bit.w #$0800
	beq CODE_9EEB7A
	lda.w #$0000
	sec
	sbc.w $1163,y
	bra CODE_9EEB7D
CODE_9EEB7A:
	lda.w $1163,y
CODE_9EEB7D:
	and.w #$0007
	asl a
	tax
	lda.l $9DEF6E,x
	tax
	lda.l $9D0000,x
	ldx.b $95
	ldy.b $89
	sta.w $0D97,y
	lda.b $89
	jsl.l CODE_9BC002
	ldy.b $89
	pla
	sta.w $0D97,y
	lda.b $A9
	clc
	adc.w $0DB7,y
	sec
	sbc.w $0DD3
	sta.b $A9
	lda.b $A5
	clc
	adc.w $0D55,y
	sec
	sbc.w $0D71
	sta.b $A5
	lda.w #$0018
	sta.b $BD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldy.b $89
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A5
	sta.b $AD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A9
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	sta.b $B5
	asl a
	tax
	lda.w #$0003
	jsl.l DivX8U
	cmp.w #$0040
	bcc CODE_9EEC10
	cmp.w #$0050
	bcc CODE_9EEC4D
	ldx.b $B5
	lda.w #$0005
	jsl.l DivX8U
	sta.b $BD
	lda.w #$0050
	bra CODE_9EEC19
CODE_9EEC10:
	lda.b $B5
	lsr a
	lsr a
	sta.b $BD
	lda.w #$0040
CODE_9EEC19:
	pha
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldy.b $89
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A5
	sta.b $AD
	lda.b $BD
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b $A9
	sta.b $B1
	ldy.b $AD
	jsl.l CODE_9CA554
	sta.b $B5
	pla
CODE_9EEC4D:
	sta.b $B9
	sta.w $0D05
	ldx.b $E4
	lda.w #$0010
	sec
	sbc.w $13A3,x
	jsl.l CODE_9BB3A4
	clc
	adc.b $B9
	sta.b $B9
	ldx.b $AD
	jsl.l CODE_808FC9
	lda.b $B5
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w $0EDF
	lda.b $B9
	ldx.b $B1
	jsl.l CODE_808FC9
	lda.b $B5
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w $0EFF
	lda.b $AD
	clc
	adc.w $0D71
	sta.w $0BA7
	lda.b $B1
	clc
	adc.w $0DD3
	sta.w $0BA9
	lda.b $B5
	asl a
	asl a
	asl a
	sta.w $0E01
	lda.w #$000A
	sta.w $121F
	ldy.b $89
	lda.b $BD
	clc
	adc.w #$0006
	sta.w $0BAD,y
	ldx.b $E4
	lda.b $BD
	sta.w $1203,x
	ldy.b $91
	lda.w $19D4,x
	sta.w $0B01,y
	lda.w $0F43,x
	bne CODE_9EECF5
	lda.w $19D4,x
	bmi CODE_9EECF5
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w $19D4,x
	sta.b $B5
	lda.w $0D07
	sta.b $A5
	jsl.l CODE_9FCB5C
	lda.w $19D4,x
	bmi CODE_9EECF5
	jsl.l CODE_9FCBB6
CODE_9EECF5:
	rtl
CODE_9EECF6:
	stx.w $0BA3
	lda.w $0F43,x
	beq CODE_9EED6D
	lda.w $14C3,x
	bne CODE_9EED38
	lda.w $0DB7,x
	cmp.w #$FFA8
	bmi CODE_9EED24
CODE_9EED0B:
	lda.w #$0004
	sta.w $0D03
	lda.w $0D55,x
	bmi CODE_9EED1D
	lda.w #$000A
	sta.w $0BA5
	rtl
CODE_9EED1D:
	lda.w #$0006
	sta.w $0BA5
	rtl
CODE_9EED24:
	lda.w $0B77
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w $0D03
	lda.w #$0008
	sta.w $0BA5
	rtl
CODE_9EED38:
	lda.w $0DB7,x
	cmp.w #$0058
	bpl CODE_9EED59
	lda.w #$0000
	sta.w $0D03
	lda.w $0D55,x
	bmi CODE_9EED52
	lda.w #$0016
	sta.w $0BA5
	rtl
CODE_9EED52:
	lda.w #$0012
	sta.w $0BA5
	rtl
CODE_9EED59:
	lda.w $0B75
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w $0D03
	lda.w #$0014
	sta.w $0BA5
	rtl
CODE_9EED6D:
	stz.w $0BA5
	stz.w $0D03
	lda.w $14C3,x
	bne CODE_9EED84
	lda.w #$000C
	sta.w $0BA5
	lda.w #$0004
	sta.w $0D03
CODE_9EED84:
	rtl
CODE_9EED85:
	lda.w #$0014
	sta.b $A5
	jmp.w $8C18
	cpx.w $0AD9
	bne CODE_9EEDBD
	lda.w $1283,x
	bit.w #$0002
	beq CODE_9EEDC0
	jsl.l CODE_9EECF6
	lda.w $1283,x
	and.w #$FFFD
	sta.w $1283,x
	lda.w $19D4,x
	bpl CODE_9EEDC0
	lda.w $0BA5
	cmp.w #$0014
	beq CODE_9EEDBA
	cmp.w #$0008
	beq CODE_9EEDBA
CODE_9EEDB9:
	rtl
CODE_9EEDBA:
	jmp.w $E10B
CODE_9EEDBD:
	jmp.w $8BE6
CODE_9EEDC0:
	ldy.w #$0000
	lda.w $0D03
	cmp.w $1163,x
	beq CODE_9EEDEA
	iny
	dec a
	and.w #$0007
	cmp.w $1163,x
	beq CODE_9EEDEA
	iny
	inc a
	inc a
	and.w #$0007
	cmp.w $1163,x
	beq CODE_9EEDEA
	lda.w $0D03
	sta.b $A5
	jsl.l CODE_9EDC06
	rtl
CODE_9EEDEA:
	lda.w $0F43,x
	bne CODE_9EEDFD
CODE_9EEDEF:
	tya
	asl a
	adc.w $0BA5
	sta.w $0BA5
	lda.w $1163,x
	sta.w $0D03
CODE_9EEDFD:
	jsl.l CODE_9EEE04
	jmp.w $8BE6
CODE_9EEE04:
	phk
	plb
	lda.w #$000F
	sec
	sbc.w $13A3,x
	asl a
	sta.b $B5
	ldy.w $0BA5
	lda.w DATA8_9EEED4,y
	clc
	adc.b $B5
	jsl.l CODE_9BB3A4
	clc
	adc.w DATA8_9EEF04,y
	sec
	sbc.w $0D71
	sta.b $A5
	lda.w DATA8_9EEEEC,y
	clc
	adc.b $B5
	jsl.l CODE_9BB3A4
	clc
	adc.w DATA8_9EEF1C,y
	sec
	sbc.w $0DD3
	sta.b $A9
	ldy.b $A5
	jsl.l CODE_9CA554
	sta.b $AD
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0078
	jsl.l DivX8U
	cmp.w #$0060
	bcc CODE_9EEE57
CODE_9EEE54:
	lda.w #$0060
CODE_9EEE57:
	ldx.b $E4
	ldy.w $0F43,x
	beq CODE_9EEE68
	cmp.w #$0010
	bcs CODE_9EEE66
CODE_9EEE63:
	lda.w #$0010
CODE_9EEE66:
	bra CODE_9EEE70
CODE_9EEE68:
	cmp.w #$0020
	bcs CODE_9EEE70
	lda.w #$0020
CODE_9EEE70:
	sta.b $B1
	ldx.b $A5
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w $0EDF
	lda.b $B1
	ldx.b $A9
	jsl.l CODE_808FC9
	lda.b $AD
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w $0EFF
	asl a
	asl a
	asl a
	asl a
	lda.w #$03C0
	sec
	sbc.b $B5
	jsl.l CODE_9BB370
	clc
	adc.w #$10E0
	sta.w $0E01
	jsl.l CODE_9EDE5E
	ldx.b $E4
	lda.w #$FFFF
	sta.w $0BA3
	sta.w $0AD9
	lda.w #$001E
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	jmp.w $EACC
DATA8_9EEED4:
	dw 25,25,25,25,20,25,25,25,25,25,20,25
DATA8_9EEEEC:
	dw 20,25,25,70,20,70,20,25,25,70,20,70
DATA8_9EEF04:
	dw 0,-80,80,-80,0,80,0,80,-80,-80,0,80
DATA8_9EEF1C:
	dw -105,-115,-115,-180,-215,-180,105,115,115,180,215,180
	lda.w $0D97,x
	cmp.w #$018C
	bne CODE_9EEF58
	lda.w $0D71
	sta.w $0D55,x
	lda.w $0DD3
	sta.w $0DB7,x
	stz.w $0DFB
	lda.w $15DA
	beq CODE_9EEF54
	inc.w $0D55,x
	rtl
CODE_9EEF54:
	inc.w $0DB7,x
	rtl
CODE_9EEF58:
	tay
	beq CODE_9EEF7E
	stz.w $0D55,x
	lda.w #$012C
	sta.w $0DB7,x
	lda.w #$000E
	sta.w $0DFB
	lda.w $0DD3
	bpl CODE_9EEF7E
CODE_9EEF6F:
	lda.w #$8000
	sta.w $0E03,x
	lda.w #$FED4
	sta.w $0DB7,x
	dec.w $0DFB
CODE_9EEF7E:
	rtl
CODE_9EEF7F:
	lda.w $0DF9
	cmp.w #$0008
	bpl CODE_9EEF91
	lda.b $A5
	and.w #$000F
	beq CODE_9EEF91
	jmp.w $F02A
CODE_9EEF91:
	jsl.l a2touchpuck
	ldy.w $0DF9
	cmp.w #$000E
	bmi CODE_9EEFA6
	lda.w #$0005
	jsl.l CODE_9C9A7F
	bra CODE_9EEFAD
CODE_9EEFA6:
	lda.w #$0008
	jsl.l CODE_9C9ABC
CODE_9EEFAD:
	stz.w $0E01
	ldy.b $91
	lda.w #$0008
	sta.w $1203,y
	lda.w $0D55,x
	sec
	sbc.w $0D55,y
	sta.b $A5
	lda.w $0DB7,x
	sec
	sbc.w $0DB7,y
	sta.b $A9
	bne CODE_9EEFD1
	tya
	jsl.l CODE_9BC002
CODE_9EEFD1:
	lda.w $0EC3,x
	sta.b $AD
	lda.w $0EE3,x
	sta.b $B1
	sep #$20
	lda.b $A5
	sta.w $0EC4,x
	lda.b $A9
	sta.w $0EE4,x
	rep #$30
	jsl.l CODE_9EDE5E
	lda.w $0DF9
	cmp.w #$0008
	bmi CODE_9EF02A
	lda.b $AD
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $AF
