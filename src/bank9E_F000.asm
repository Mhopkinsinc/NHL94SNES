; Bank $9E, last 4 KB: the end of the game code for the objects on the ice, with auto labels for now, then $FF fill.

org $9EF000
	lda.b $08
	sta.b $AD
	lda.b $B1
	tax
	jsl.l Mul16S
	ldx.b $95
	lda.b $08
	clc
	adc.b $AD
	sta.b $AD
	lda.b $0A
	adc.b $AF
	sta.b $AF
	cmp.w #$0900
	bcc CODE_9EF02B
	lda.w $0DF9
	cmp.w #$000C
	bmi CODE_9EF02A
	jmp.w $9B52
CODE_9EF02A:
	rtl
CODE_9EF02B:
	ldy.b $91
	lda.w $14E3,y
	bne CODE_9EF02A
	inc a
	sta.w $1543,y
	lda.w #$F896
	ldx.b $91
	jsl.l CODE_9EA3F1
	ldx.b $95
	rtl
CODE_9EF042:
	lda.w $15D4
	bit.w #$0010
	beq CODE_9EF04D
	jmp.w $F1CA
CODE_9EF04D:
	stz.b $AD
	lda.w $0DF9
	cmp.w #$0008
	bpl CODE_9EF05B
	inc.b $AD
	inc.b $AD
CODE_9EF05B:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
	jsl.l vtoa
	ldy.b $91
	lda.b $A5
	sec
	sbc.w $1163,y
	and.w #$0007
	sta.b $A5
	and.w #$0003
	sta.b $A9
	bne CODE_9EF088
	lda.w $0792
	sta.b $A5
CODE_9EF088:
	lda.b $A5
	and.w #$0004
	lsr a
	lsr a
	eor.w #$0001
	clc
	adc.b $AD
	asl a
	sta.b $AD
	lda.w $1443,y
	sta.b $A9
	lda.b $AD
	beq CODE_9EF0BE
	lda.w $13A3,y
	sta.b $A9
	lda.b $AD
	cmp.w #$0002
	beq CODE_9EF0BE
	lda.w $13E3,y
	sta.b $A9
	lda.b $AD
	cmp.w #$0004
	beq CODE_9EF0BE
	lda.w $1423,y
	sta.b $A9
CODE_9EF0BE:
	lda.b $A9
	clc
	adc.w #$000F
	sta.b $A9
	lda.w $0E03,y
	bit.w #$0800
	beq CODE_9EF0D5
	lda.b $AD
	eor.w #$0002
	sta.b $AD
CODE_9EF0D5:
	lda.w $0D97,y
	sec
	sbc.w #$0296
	cmp.w #$0010
	bcs CODE_9EF0EC
	lda.w $0DF9
	cmp.w #$0005
	bmi CODE_9EF0EC
	jmp.w $F1CA
CODE_9EF0EC:
	jsl.l CODE_9EF213
	jsl.l a2touchpuck
	lda.w #$0006
	jsl.l CODE_9C9ABC
	lda.w $0EFF
	cmp.w #$3000
	bpl CODE_9EF108
	cmp.w #$D000
	bpl CODE_9EF135
CODE_9EF108:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EF114
	sta.w $19BE
CODE_9EF114:
	ldy.b $91
	lda.w $1503,y
	beq CODE_9EF124
	lda.w #$0004
	jsl.l CODE_9C9A7F
	bra CODE_9EF135
CODE_9EF124:
	lda.l $7E35E0
	clc
	adc.w #$0258
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
CODE_9EF135:
	lda.w $0AD9
	bmi CODE_9EF13B
	lsr a
CODE_9EF13B:
	sta.b $AD
	bpl CODE_9EF142
	jmp.w $F1CE
CODE_9EF142:
	cpx.w $0AD9
	bne CODE_9EF14A
	jmp.w $F1CE
CODE_9EF14A:
	lda.w #$FF00
	tsb.w $0AD9
	asl.b $AD
	lda.b $AD
	sta.b $89
	tay
	lda.w #$0014
	sta.w $1203,y
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w $15D8
CODE_9EF168:
	stz.w $0E01
	ldy.b $91
	lda.w #$000A
	sta.w $1203,y
	lda.w #$0004
	sta.w $1063,y
	lda.w $0D55,x
	sec
	sbc.w $0D55,y
	sta.b $A5
	lda.w $0DB7,x
	sec
	sbc.w $0DB7,y
	sta.b $A9
	bne CODE_9EF193
	lda.b $91
	jsl.l CODE_9BC002
CODE_9EF193:
	lda.b $A9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EF1A0
	ora.w #$FF00
CODE_9EF1A0:
	sta.b $A9
	lda.b $A9
	beq CODE_9EF1A8
	inc.b $A9
CODE_9EF1A8:
	ldy.b $91
	lda.w $0EE3,y
	eor.b $A9
	bmi CODE_9EF1B9
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EF1B9:
	sep #$20
	lda.b $A5
	sta.w $0EC4,x
	lda.b $A9
	sta.w $0EE4,x
	rep #$20
	jmp.w $DE5E
CODE_9EF1CA:
	rtl
CODE_9EF1CB:
	jmp.w $F168
CODE_9EF1CE:
	lda.w #$0002
	clc
	adc.w $1363,y
	xba
	and.w #$FF00
	asl a
	jsl.l CODE_9BB370
	adc.w #$2000
	sta.b $A5
	cmp.w $0EDF
	bmi CODE_9EF1CB
	lda.b $A5
	cmp.w $0EFF
	bmi CODE_9EF1CB
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	cmp.w $0EDF
	bpl CODE_9EF1CB
	lda.b $A5
	cmp.w $0EFF
	bpl CODE_9EF1CB
	ldy.b $91
	lda.w $1283,y
	bit.w #$1000
	bne CODE_9EF1CB
	stz.w $0E01
	jmp.w $9A49
CODE_9EF213:
	lda.w #$1000
	trb.w $15D8
	bne CODE_9EF21E
	jmp.w $F318
CODE_9EF21E:
	lda.w $15D6
	beq CODE_9EF226
	jmp.w $F318
CODE_9EF226:
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $91
	pha
	lda.b $93
	pha
	lda.b $95
	pha
	lda.b $97
	pha
	lda.b $A5
	pha
	lda.b $A7
	pha
	phx
	ldx.w $0D29
	stx.b $95
	stz.b $91
	lda.w #$0002
	sta.b $8D
	txa
	cmp.w #$000C
	bmi CODE_9EF258
	lda.w #$0002
	sta.b $91
	stz.b $8D
CODE_9EF258:
	ldy.w #$177A
	lda.w $1503,x
	beq CODE_9EF262
	iny
	iny
CODE_9EF262:
	lda.w $0000,y
	inc a
	sta.w $0000,y
	ldy.b $91
	bne CODE_9EF28A
	lda.w $17A6
	sec
	sbc.w $17A8
	beq CODE_9EF2A5
	bmi CODE_9EF281
	lda.w $175A
	inc a
	sta.w $175A
	bra CODE_9EF2A5
CODE_9EF281:
	lda.w $175E
	inc a
	sta.w $175E
	bra CODE_9EF2A5
CODE_9EF28A:
	lda.w $17A8
	sec
	sbc.w $17A6
	beq CODE_9EF2A5
	bmi CODE_9EF29E
	lda.w $175C
	inc a
	sta.w $175C
	bra CODE_9EF2A5
CODE_9EF29E:
	lda.w $1760
	inc a
	sta.w $1760
CODE_9EF2A5:
	lda.w $1630
	asl a
	asl a
	tax
	lda.b $91
	beq CODE_9EF2B1
	inx
	inx
CODE_9EF2B1:
	lda.w $176A,x
	inc a
	sta.w $176A,x
	ldx.b $95
	lda.w $12A3,x
	sta.b $A5
	lda.b $91
	beq CODE_9EF2C6
	lda.w #$001A
CODE_9EF2C6:
	clc
	adc.b $A5
	ldx.b $91
	cmp.w $17AA,x
	beq CODE_9EF2D8
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
CODE_9EF2D8:
	ldx.b $8D
	lda.w $17AA,x
	sta.b $A5
	bmi CODE_9EF2F3
	lda.b $8D
	beq CODE_9EF2E8
	lda.w #$001A
CODE_9EF2E8:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
CODE_9EF2F3:
	plx
	pla
	sta.b $A7
	pla
	sta.b $A5
	pla
	sta.b $97
	pla
	sta.b $95
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $8F
	pla
	sta.b $8D
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EF318
	sta.w $19BE
CODE_9EF318:
	rtl
CODE_9EF319:
	lda.w $15D6
	beq CODE_9EF328
	stz.w $0E01
	stz.w $0EDF
	stz.w $0EFF
	rtl
CODE_9EF328:
	lda.w $163A
	beq CODE_9EF357
	lda.w $0DD3
	bpl CODE_9EF33C
	lda.w $15D4
	bit.w #$0002
	beq CODE_9EF352
	bra CODE_9EF346
CODE_9EF33C:
	lda.w $15D4
	bit.w #$0002
	beq CODE_9EF346
	bra CODE_9EF352
CODE_9EF346:
	lda.w $1E91
	beq CODE_9EF357
CODE_9EF34B:
	jsl.l CODE_9EC791
	jmp.w $F5D9
CODE_9EF352:
	lda.w $1E91
	beq CODE_9EF34B
CODE_9EF357:
	jsl.l CODE_9EF213
	jsl.l CODE_9FBA97
	lda.w #$001E
	sta.w $0CA9
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w $0DD3
	bpl CODE_9EF378
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9EF378:
	lda.w $15D4
	bit.w #$0002
	beq CODE_9EF389
	lda.b $8D
	sta.b $91
	eor.w #$0002
	sta.b $8D
CODE_9EF389:
	ldy.b $91
	lda.w $178E,y
	inc a
	sta.w $178E,y
	lda.w $17A6
	sec
	sbc.w $17A8
	beq CODE_9EF3AE
	bmi CODE_9EF3A3
	ldy.b $91
	beq CODE_9EF3AE
	bra CODE_9EF3A7
CODE_9EF3A3:
	ldy.b $91
	bne CODE_9EF3AE
CODE_9EF3A7:
	lda.w $1762,y
	inc a
	sta.w $1762,y
CODE_9EF3AE:
	lda.w $1E9B
	bne CODE_9EF3C3
	lda.w $1E8B
	beq CODE_9EF3CC
	ldy.b $91
	lda.w $17C6,y
	inc a
	sta.w $17C6,y
	bra CODE_9EF3CC
CODE_9EF3C3:
	ldy.b $91
	lda.w $17CE,y
	inc a
	sta.w $17CE,y
CODE_9EF3CC:
	lda.w $1E89
	beq CODE_9EF3DA
	ldy.b $91
	lda.w $17DA,y
	inc a
	sta.w $17DA,y
CODE_9EF3DA:
	jsl.l MusicStop
	lda.w #$0002
	jsl.l CODE_9C9A7F
	stz.w $0C23
	ldy.b $91
	beq CODE_9EF406
	lda.w #$0004
	jsl.l CODE_9C9FD5
	lda.l $7E35E0
	sec
	sbc.w #$0300
	bpl CODE_9EF400
	lda.w #$0000
CODE_9EF400:
	sta.l $7E35E0
	bra CODE_9EF424
CODE_9EF406:
	inc a
	inc a
	jsl.l CODE_9C9FD5
	lda.l $7E35E0
	clc
	adc.w #$01F4
	sta.l $7E35E0
	lda.w #$0078
	sta.b $81
	lda.w #$0003
	jsl.l CODE_9C9B5F
CODE_9EF424:
	lda.b $83
	sta.w $0D2B
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
	phx
	lda.w $1630
	asl a
	asl a
	tax
	lda.w $19BE
	clc
	adc.w #$001E
	bmi CODE_9EF446
	sta.w $19BE
CODE_9EF446:
	lda.b $91
	beq CODE_9EF458
	inx
	inx
	lda.w $19BE
	clc
	adc.w #$FFCE
	bmi CODE_9EF458
	sta.w $19BE
CODE_9EF458:
	lda.w $177E,x
	inc a
	sta.w $177E,x
	plx
	lda.l $7E313A
	cmp.w #$0258
	bne CODE_9EF471
	sec
	sbc.w #$0006
	sta.l $7E313A
CODE_9EF471:
	lda.w #$007E
	sta.b $8B
	lda.w #$313C
	clc
	adc.l $7E313A
	sta.b $89
	lda.l $7E313A
	adc.w #$0006
	sta.l $7E313A
	jsl.l GetPeriodTimeRemaining
	lda.b $A5
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$0002
	clc
	ldy.b $91
	adc.w $17A6,y
	ldy.b $8D
	sec
	sbc.w $17A6,y
	ldy.b $91
	beq CODE_9EF4AD
	ora.w #$0080
CODE_9EF4AD:
	sta.b [$89]
	inc.b $89
	lda.w $179A,y
	sta.b $A5
	sta.b [$89]
	inc.b $89
	lda.w #$FFFF
	sta.b [$89]
	ldx.b $91
	lda.w $17AA,x
	cmp.b $A5
	beq CODE_9EF4DA
	lda.b $91
	beq CODE_9EF4CF
	lda.w #$001A
CODE_9EF4CF:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $18EE,x
	rep #$20
CODE_9EF4DA:
	ldy.b $91
	lda.w $179E,y
	sta.b $A5
	bmi CODE_9EF51C
	sep #$20
	sta.b [$89]
	rep #$20
	lda.b $91
	beq CODE_9EF4F0
	lda.w #$001A
CODE_9EF4F0:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
	inc.b $89
	lda.w $17A2,y
	sta.b $A5
	bmi CODE_9EF51C
	sep #$20
	sta.b [$89]
	rep #$20
	lda.b $91
	beq CODE_9EF511
	lda.w #$001A
CODE_9EF511:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
CODE_9EF51C:
	ldy.b $8D
	lda.w $17AA,y
	sta.b $A5
	bmi CODE_9EF533
	lda.b $8D
	beq CODE_9EF52C
	lda.w #$001A
CODE_9EF52C:
	clc
	adc.b $A5
	tax
	inc.w $18EE,x
CODE_9EF533:
	jsl.l CODE_9EB94C
	jsl.l CODE_9F9B36
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9EF5B8
	lda.b $91
	bne CODE_9EF556
	lda.w $1790
	sec
	sbc.w $178E
	bmi CODE_9EF556
	cmp.w #$0003
	bcs CODE_9EF556
CODE_9EF556:
	stz.w $0CDB
	stz.w $0EDF
	stz.w $0EFF
	ldy.w #$0006
	lda.w $0D71
	bpl CODE_9EF56A
	ldy.w #$FFFA
CODE_9EF56A:
	sty.w $0D71
	ldy.w #$0110
	lda.w $0DD3
	bpl CODE_9EF578
	ldy.w #$FEF0
CODE_9EF578:
	sty.w $0DD3
	lda.w #$0600
	sta.w $0E01
	stz.w $0DF9
	lda.w #$FFFF
	sta.w $0D19
	sta.w $0D1D
	sta.w $157F
	lda.w #$001A
	sta.b $A5
	jsl.l CODE_9E8C18
	inx
	inx
	lda.w #$F644
	jsl.l CODE_9EA3F1
	ldy.b $91
	ldx.w $1766,y
	stx.b $95
	lda.w #$000E
	sta.b $A5
	jsl.l CODE_9EB88A
	ldx.w #$001C
	stx.b $95
	rtl
CODE_9EF5B8:
	phx
	ldy.b $91
	lda.w $1766,y
	tax
	lda.w #$0005
	sta.b $B1
CODE_9EF5C4:
	lda.w $0F43,x
	bmi CODE_9EF5D2
	beq CODE_9EF5D2
	stz.w $1563,x
	jsl.l CODE_9E8C0E
CODE_9EF5D2:
	inx
	inx
	dec.b $B1
	bpl CODE_9EF5C4
	plx
CODE_9EF5D9:
	rtl
CODE_9EF5DA:
	ldy.b $91
	lda.w $0F43,y
	bne CODE_9EF5EA
	lda.w $15D4
	bit.w #$0010
	beq CODE_9EF5EA
CODE_9EF5E9:
	rtl
CODE_9EF5EA:
	lda.w $1283,y
	and.w #$FFFE
	sta.w $1283,y
	ldy.w $0AD9
	bpl CODE_9EF5FB
	jmp.w $F69A
CODE_9EF5FB:
	lda.w $1503,y
	ldy.b $91
	cmp.w $1503,y
	beq CODE_9EF5E9
	lda.b $A5
	cmp.w #$0025
	bcs CODE_9EF5E9
	lda.w $0F43,y
	beq CODE_9EF64C
	ldy.b $89
	lda.w $0F43,y
	beq CODE_9EF5E9
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	pha
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	lda.w $1403,y
	sta.b $A5
	jsl.l CODE_9FDCEB
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	pla
	sec
	sbc.b $A5
	clc
	adc.w #$0024
	jsl.l CODE_9BB370
	cmp.w #$0003
	bcs CODE_9EF5E9
CODE_9EF64C:
	ldy.b $89
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	adc.w #$0014
	ldy.b $89
	sta.w $1203,y
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	lda.w $1403,y
	jsl.l CODE_9FDCEB
	lda.b $A5
	adc.w #$0014
	ldy.b $89
	sta.w $1203,y
	lda.b $89
	ldy.b $91
	sty.b $89
	sta.b $91
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w $15D8
CODE_9EF68B:
	lda.w #$0003
	jsl.l CODE_9C9ABC
	jsl.l a2touchpuck
	jmp.w $F722
CODE_9EF699:
	rtl
CODE_9EF69A:
	lda.b $A5
	sta.b $AD
	lda.w $0EDF
	phx
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $A7
	lda.b $08
	sta.b $A5
	lda.w $0EFF
	tax
	jsl.l Mul16S
	plx
	lda.b $08
	clc
	adc.b $A5
	sta.b $A5
	lda.b $0A
	adc.b $A7
	sta.b $A7
	stz.b $A9
	lda.w $15D8
	bit.w #$1000
	bne CODE_9EF6E1
	ldy.b $91
	lda.w $1403,y
	phx
	ldx.w #$02BC
	jsl.l CODE_808F98
	lda.b $08
	sta.b $A9
	plx
CODE_9EF6E1:
	lda.b $A9
	clc
	adc.w #$2710
	ldy.w $0F43,x
	beq CODE_9EF6F1
	cpx.w $0D07
	bne CODE_9EF6F4
CODE_9EF6F1:
	adc.w #$0BB8
CODE_9EF6F4:
	phx
	tax
	jsl.l Mul16U
	plx
	lda.b $08
	cmp.b $A5
	lda.b $0A
	sbc.b $A7
	bcs CODE_9EF71F
	lda.w $0F43,x
	beq CODE_9EF714
	lda.b $AD
	cmp.w #$0025
	bcc CODE_9EF714
	jmp.w $F699
CODE_9EF714:
	ldy.b $91
	lda.w #$0008
	sta.w $1203,y
	jmp.w $F68B
CODE_9EF71F:
	jmp.w $9A49
CODE_9EF722:
	lda.w #$FFFF
	sta.w $0AD9
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w $0EFF
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w $0EDF
	jsl.l RandomWord
	and.w #$0FFF
	sta.w $0E01
	jmp.w $DE5E
CODE_9EF751:
	lda.w $0CF1
	bit.w #$0004
	beq CODE_9EF779
	bit.w #$0001
	bne CODE_9EF779
	lda.w $0AD9
	bpl CODE_9EF779
	lda.w #$0108
	sta.b $A5
	lda.w $0CF1
	bit.w #$0002
	bne CODE_9EF77A
	lda.w #$FEF8
	sec
	sbc.w $0DD3
	bpl CODE_9EF783
CODE_9EF779:
	rtl
CODE_9EF77A:
	lda.w #$0108
	sec
	sbc.w $0DD3
	bpl CODE_9EF779
CODE_9EF783:
	lda.w #$0001
	tsb.w $0CF1
	rtl
CODE_9EF78A:
	stz.b $8D
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9EF8C4
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_9EF8C4
	lda.w #$0054
	sta.b $A5
	lda.w $0DD3
	bpl CODE_9EF7AD
	jmp.w $F833
CODE_9EF7AD:
	lda.b $A5
	sec
	sbc.w $0DD3
	bmi CODE_9EF7BF
	lda.b $A5
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF7C7
CODE_9EF7BF:
	lda.b $A5
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF7C7:
	jsl.l CODE_9EC6E7
	lda.w $15D4
	bit.w #$0020
	bne CODE_9EF7D6
	jmp.w $F829
CODE_9EF7D6:
	lda.w #$005E
	sta.b $A5
	lda.w $15D4
	bit.w #$0002
	beq CODE_9EF7EB
	lda.b $91
	ldy.b $8D
	sty.b $91
	sta.b $8D
CODE_9EF7EB:
	lda.w $0AD9
	bpl CODE_9EF7F4
	lda.w $0CF3
	asl a
CODE_9EF7F4:
	cmp.w #$000C
	bpl CODE_9EF7FF
	lda.b $91
	beq CODE_9EF803
	bra CODE_9EF829
CODE_9EF7FF:
	lda.b $91
	beq CODE_9EF829
CODE_9EF803:
	lda.w #$0005
	sta.b $AD
	ldy.b $91
	lda.w $1766,y
	sta.b $89
CODE_9EF80F:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9EF82A
	lda.b $A5
	sec
	sbc.w $0DB7,y
	bpl CODE_9EF82A
	ldy.b $91
	lda.w $17DE,y
	ora.w #$0010
	sta.w $17DE,y
CODE_9EF829:
	rtl
CODE_9EF82A:
	inc.b $89
	inc.b $89
	dec.b $AD
	bpl CODE_9EF80F
	rtl
CODE_9EF833:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.b $A5
	sec
	sbc.w $0DD3
	bmi CODE_9EF84D
	lda.b $A5
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF855
CODE_9EF84D:
	lda.b $A5
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF855:
	jsl.l CODE_9EC6E7
	lda.w $15D4
	bit.w #$0020
	bne CODE_9EF864
	jmp.w $F829
CODE_9EF864:
	lda.b $A5
	sec
	sbc.w #$000A
	sta.b $A5
	lda.w $15D4
	bit.w #$0002
	bne CODE_9EF87C
	lda.b $91
	ldy.b $8D
	sty.b $91
	sta.b $8D
CODE_9EF87C:
	lda.w $0AD9
	bpl CODE_9EF885
	lda.w $0CF3
	asl a
CODE_9EF885:
	cmp.w #$000C
	bpl CODE_9EF890
	lda.b $91
	beq CODE_9EF894
	bra CODE_9EF829
CODE_9EF890:
	lda.b $91
	beq CODE_9EF829
CODE_9EF894:
	lda.w #$0005
	sta.b $AD
	ldy.b $91
	lda.w $1766,y
	sta.b $89
CODE_9EF8A0:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9EF8BB
	lda.b $A5
	sec
	sbc.w $0DB7,y
	bmi CODE_9EF8BB
	ldy.b $91
	lda.w $17DE,y
	ora.w #$0010
	sta.w $17DE,y
	rtl
CODE_9EF8BB:
	inc.b $89
	inc.b $89
	dec.b $AD
	bpl CODE_9EF8A0
	rtl
CODE_9EF8C4:
	ldy.b $91
	lda.w $17DE,y
	bit.w #$0010
	bne CODE_9EF8D1
	jmp.w $F829
CODE_9EF8D1:
	lda.w $1766,y
	sta.b $89
	lda.w #$0005
	sta.b $A9
CODE_9EF8DB:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9EF8F4
	lda.w $0DB7,y
	sta.b $A5
	lda.w $14C3,y
	bne CODE_9EF8F4
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EF8F4:
	inc.b $89
	inc.b $89
	lda.b $A5
	sec
	sbc.w #$0058
	bmi CODE_9EF903
	jmp.w $F829
CODE_9EF903:
	dec.b $A9
	bpl CODE_9EF8DB
	ldy.b $91
	lda.w $17DE,y
	and.w #$FFEF
	sta.w $17DE,y
	rtl
UpdatePA:
	lda.w $162A
	bmi CODE_9EF968
	sec
	sbc.b $C1
	sta.w $162A
	bpl CODE_9EF924
	jsl.l CODE_9EF991
CODE_9EF924:
	lda.w $1628
	sec
	sbc.b $C1
	sta.w $1628
	bpl CODE_9EF968
	lda.w #$7FFF
	sta.w $1628
	jsl.l CODE_9EC913
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7A0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC3F8
	lda.b [$8D]
	lsr a
	sta.b $A5
	lda.w $0D0F
	sec
	sbc.b $A5
	sta.w $0D0F
	jmp.w $C7BE
CODE_9EF968:
	rtl
SetPA:
	lda.b $A5
	sta.w $162E
	stz.w $162C
	jsl.l CODE_9EC160
	lda.b $A5
	cmp.w #$000E
	bne CODE_9EF980
	jsl.l CODE_9FA697
CODE_9EF980:
	lda.w #$7FFF
	sta.w $1628
	lda.w $15DA
	beq CODE_9EF991
	lda.w #$003C
	sta.w $1628
CODE_9EF991:
	phx
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w $162C
	bpl CODE_9EF9C5
	lda.w $1D81
	beq CODE_9EF9C0
	lda.w #$0001
	sta.w $1D83
CODE_9EF9C0:
	lda.w $162C
	bra CODE_9EFA0F
CODE_9EF9C5:
	sta.b $A5
	inc.w $162C
	inc.w $162C
	lda.w $162E
	sta.b $A9
	tax
	lda.l DATA8_80D3EB,x
	inc a
	inc a
	tax
	clc
	adc.l DATA8_80D3EB,x
	adc.b $A5
	tax
	lda.l DATA8_80D3EB,x
	sta.b $A5
	bpl CODE_9EF9F6
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w #$FFFF
	sta.w $162C
CODE_9EF9F6:
	lda.b $A5
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $A9
	sta.w $162A
	lda.b $A5
	xba
	and.w #$00FF
	sta.b $A5
	jsl.l CODE_9EFA36
CODE_9EFA0F:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	plx
	rtl
CODE_9EFA2F:
	lda.w #$0200
	trb.w $15D8
	rtl
CODE_9EFA36:
	phx
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $A5
	cmp.w #$0040
	bne CODE_9EFA5F
	jmp.w $FAF7
CODE_9EFA5F:
	cmp.w #$0006
	beq CODE_9EFA6B
	lda.w #$0001
	sta.l $7E344A
CODE_9EFA6B:
	lda.b $A5
	ldx.w #$0070
	jsl.l CODE_808F4C
	sta.b $A5
	lda.w #$0096
	sta.b $8B
	lda.w #DATA8_96F15D
	sta.b $89
	lda.w #$0084
	sta.b $C7
	lda.l $7E35CA
	ora.w #$2000
	sta.b $C5
	lda.w $15DA
	beq CODE_9EFAA8
	lda.l $7E35C8
	sta.b $C5
	lda.w #$03DA
	sta.b $C7
	lda.w #$0095
	sta.b $8B
	lda.w #$DB94
	sta.b $89
CODE_9EFAA8:
	lda.b $89
	clc
	adc.b $A5
	sta.b $89
	lda.w #$0008
	sta.b $C9
CODE_9EFAB4:
	ldy.w #$0007
CODE_9EFAB7:
	lda.b [$89]
	clc
	adc.b $C5
	adc.l $7E35AA
	ldx.b $C7
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9EFAD0
	sta.w $0CD5
CODE_9EFAD0:
	cmp.w $0CD7
	bcc CODE_9EFAD8
	sta.w $0CD7
CODE_9EFAD8:
	inc.b $89
	inc.b $89
	inc.b $C7
	inc.b $C7
	dey
	bne CODE_9EFAB7
	lda.b $C7
	clc
	adc.w #$0032
	sta.b $C7
	dec.b $C9
	bne CODE_9EFAB4
	lda.w #$0200
	tsb.w $15D8
	bra CODE_9EFB3B
CODE_9EFAF7:
	lda.w #$0007
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.w #$0002
	sta.w $0D0F
	sta.w $0D11
	lda.w $15DA
	beq CODE_9EFB21
	lda.w #$000D
	sta.w $0D0F
	lda.w #$000F
	sta.w $0D11
CODE_9EFB21:
	jsl.l eraser
	lda.w #$0200
	tsb.w $15D8
	lda.w #$FFFF
	sta.b $A5
	jsl.l CODE_9EC160
	lda.w #$0000
	sta.l $7E344A
CODE_9EFB3B:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	plx
	rtl
	padbyte $FF
	pad $9F8000
