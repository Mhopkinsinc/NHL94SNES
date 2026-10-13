; Bank $9F, second 4 KB: more game flow code, with auto labels for now. DATA8_9F9848 and DATA8_9F98F1 are text records
; (Ice, Bench, Inj P, Inj G; Right, Left), GetPeriodTime_timetab the period lengths in seconds (5, 10 and 20 minutes, 30
; seconds), and DATA8_9F9323, DATA8_9F97CE, DATA8_9F9AD8 and DATA8_9F9AF8 tables its code reads.

org $9F9001
	lda.w #$00B4
	pha
	lda.b $83
	sta.w $0D01
CODE_9F900A:
	lda.b $83
	cmp.w $0D01
	beq CODE_9F900A
	tax
	sec
	sbc.w $0D01
	sta.b $C1
	sta.w $0ADB
	asl a
	sta.w $0CDD
	asl a
	asl a
	asl a
	sta.w $0CDF
	asl a
	sta.w $0CE1
	asl a
	adc.w $0CE1
	sta.w $0CE1
	stx.w $0D35
	stx.w $0D01
	jsl.l CODE_9B8017
	lda.w sflags
	bit.w #$0001
	bne CODE_9F9060
	lda.w $15D6
	bne CODE_9F9060
	ldx.b $C1
CODE_9F9049:
	lda.w $1632
	beq CODE_9F905D
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs CODE_9F905D
	dec.w $1632
CODE_9F905D:
	dex
	bne CODE_9F9049
CODE_9F9060:
	lda.b $C1
	pha
	jsl.l CODE_9F8625
	pla
	sta.b $C1
	sta.w $0ADB
	lda.w $15D6
	beq CODE_9F9079
	pla
	sec
	sbc.b $C1
	pha
	bmi CODE_9F9097
CODE_9F9079:
	jsl.l CODE_9B8526
	lda.b $A9
	bit.w #$9080
	beq CODE_9F900A
	lda.w $178E
	cmp.w $1790
	bne CODE_9F9097
	jsl.l RandomWord
	and.w #$0002
	tax
	inc.w $178E,x
CODE_9F9097:
	pla
	pla
	sta.b $8B
	pla
	sta.b $89
	jsl.l CODE_9C9786
	ldx.b $89
	lda.w $178E
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l SetupTeamForIntermission
	ldx.w #$0000
CODE_9F90B9:
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w $0D97,x
	inx
	inx
	cpx.w #$0018
	bcc CODE_9F90B9
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l CODE_9F9307
	jsl.l CODE_9FB901
	jsl.l SetHor
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
CODE_9F90F3:
	lda.w $07F9
	bne CODE_9F90F3
	lda.w $07F3
	bne CODE_9F90F3
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq CODE_9F9125
	cmp.w #$0004
	beq CODE_9F9125
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9F9125
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	bra CODE_9F9133
CODE_9F9125:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9F9133:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF809
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	jsl.l CODE_9F9B36
	jsl.l CODE_9FEA24
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	stx.b $87
	ldx.w #$001A
CODE_9F9170:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9F9170
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9F917E:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9F917E
	ldx.b $87
	ldx.b $95
	stx.b $87
	ldx.w #$0000
CODE_9F918E:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9F918E
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9F919F:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9F919F
	ldx.b $87
	ldx.b $89
	lda.w #$0004
	sta.l $7E3568,x
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F91C1
	jmp.w CODE_808E1C
CODE_9F91C1:
	lda.w #$0005
	sta.l $7E3568,x
	lda.b $A9
	sta.b $B1
	jsl.l CODE_9FA476
	lda.w #$00B4
	sta.b $A5
	jsl.l CODE_9FA5EA
	lda.b $A9
	bit.w #$1000
	beq CODE_9F91E8
CODE_9F91E0:
	lda.w #$0008
	tsb.w sflags3
	bra CODE_9F91EE
CODE_9F91E8:
	lda.w #$0008
	trb.w sflags3
CODE_9F91EE:
	jsl.l CODE_9BC17C
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96B2CF
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
	lda.l $7E35BA
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	stx.b $87
	ldx.w #$001A
CODE_9F9229:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9F9229
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9F9237:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9F9237
	ldx.b $87
	ldx.b $95
	rtl
CODE_9F9243:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9F9307
	jsl.l CODE_9F9298
	jmp.w $91E0
CODE_9F9276:
	jsl.l CODE_9F9298
	jmp.w $91E8
CODE_9F927D:
	jsl.l reenergizeteam
	jsl.l setpersonel
	jsl.l forcepldata
	ldy.b $91
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	rtl
CODE_9F9298:
	ldx.b $89
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F92C3
	jsl.l RandomWord
	and.w #$0001
	ldx.b $89
	pha
	clc
	adc.l $7E3578,x
	sta.l $7E3578,x
	pla
	eor.w #$0001
	adc.l $7E3588,x
	sta.l $7E3588,x
CODE_9F92C3:
	lda.w #$0005
	sta.l $7E3568,x
	rtl
CODE_9F92CB:
	ldx.w #$0000
CODE_9F92CE:
	lda.w $15D3,x
	sta.l $7E47F4,x
	inx
	inx
	cpx.w #$0781
	bcc CODE_9F92CE
	lda.l $7E313A
	sta.l $7E47F4,x
	inx
	inx
	stz.w tmgoalie
	stz.w $17AC
	stz.w $19D0
	stz.w $19D2
	lda.w #$FFFF
	ldx.w #$0000
CODE_9F92F8:
	sta.w $19D4,x
	inx
	inx
	cpx.w #$0018
	bcc CODE_9F92F8
	jsl.l ClearPenaltyBuffer
	rtl
CODE_9F9307:
	ldx.w #$0000
CODE_9F930A:
	lda.l $7E47F4,x
	sta.w $15D3,x
	inx
	inx
	cpx.w #$0781
	bcc CODE_9F930A
	lda.l $7E47F4,x
	inx
	inx
	sta.l $7E313A
	rtl
DATA8_9F9323:
	dw 0,-240,-70,-140,20,-110,-100,-60,25,-40,70,-80
	dw 0,240,34,90,-55,80,100,40,-10,10,-50,0
CODE_9F9353:
	cmp.w $0CD5
	bcs CODE_9F935B
CODE_9F9358:
	sta.w $0CD5
CODE_9F935B:
	rtl
CODE_9F935C:
	cmp.w $0CD7
	bcc CODE_9F9364
CODE_9F9361:
	sta.w $0CD7
CODE_9F9364:
	rtl
CODE_9F9365:
	lda.w #$0001
	tsb.w sflags
	rtl
CODE_9F936C:
	sta.w $0AC6
	jmp.w $9365
CODE_9F9372:
	stz.w $0AC6
	jmp.w $9365
CODE_9F9378:
	jmp.w $9365
CODE_9F937B:
	phx
	lda.w #$007E
	sta.b $0E
	lda.w #$37F4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4F7E
	sta.b $10
	ldx.w #$0800
	jsl.l CODE_808F2F
	plx
	jsl.l CODE_9C9786
	lda.w sfhormode
	pha
	lda.w sflags
	pha
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l SetHor
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0D13
	stz.w $0D15
CODE_9F93DB:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF80E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	jsl.l CODE_9F9B36
	jsl.l CODE_9FE11D
	bne CODE_9F93DB
	lda.w #$0000
	sta.l $7E3476
	stz.w $1EBB
	stz.w $1D60
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l SoundInit
	phx
	lda.w #$007E
	sta.b $0E
	lda.w #$4F7E
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	ldx.w #$0800
	jsl.l CODE_808F2F
	plx
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	pla
	sta.w sflags
	pla
	sta.w sfhormode
	bne CODE_9F945E
	jsl.l CODE_9FB9A4
CODE_9F945E:
	lda.w #$0001
	trb.w sflags
	jsl.l CODE_9F9B36
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	lda.w #$7000
	sta.b $64
	lda.w #$0012
	jsl.l CODE_80A17D
	lda.w #$0013
	jsl.l CODE_80A17D
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	rtl
CODE_9F94AE:
	lda.l $7E35D6
	asl a
	sta.b $A5
	stz.b $89
	tax
	lda.w $178E
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F94DA
	jmp.w $961F
CODE_9F94DA:
	ldx.b $89
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F951B
	cmp.l $7E3558,x
	beq CODE_9F951B
	stz.b $B1
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F94FB
	lda.w #$0010
	sta.b $B1
CODE_9F94FB:
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bpl CODE_9F950C
	lda.b $B1
	eor.w #$0010
	sta.b $B1
CODE_9F950C:
	lda.b $89
	clc
	adc.b $B1
	tax
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
CODE_9F951B:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F94DA
	inc.w $0ACF
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F9531
	jmp.w $95C2
CODE_9F9531:
	lda.l $7E35D6
	asl a
	sta.b $89
	tax
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F954B
	cmp.l $7E3558,x
	beq CODE_9F954B
	jmp.w $961E
CODE_9F954B:
	lda.l $7E35D4
	sec
	sbc.w #$0003
	bmi CODE_9F9559
	bvs CODE_9F955B
	bra CODE_9F95C2
CODE_9F9559:
	bvs CODE_9F95C2
CODE_9F955B:
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9F9564:
	ldx.b $89
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9F95A1
	lda.w #$0004
	cmp.l $7E3548,x
	beq CODE_9F95A1
	cmp.l $7E3558,x
	beq CODE_9F95A1
	lda.l $7E3548,x
	inc a
	sta.l $7E3548,x
	jsl.l RandomWord
	lsr a
	bcc CODE_9F9564
	lda.l $7E3548,x
	dec a
	sta.l $7E3548,x
	lda.l $7E3558,x
	inc a
	sta.l $7E3558,x
	bra CODE_9F9564
CODE_9F95A1:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F9564
	jsl.l CODE_9BC623
	ldx.w #$000E
CODE_9F95B0:
	lda.l $7E3508,x
	sta.l $7E3518,x
	dex
	dex
	bpl CODE_9F95B0
	lda.w #$0004
	tsb.w sflags3
CODE_9F95C2:
	stz.w $0ACF
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
	stz.b $B1
CODE_9F95D0:
	ldx.b $89
	lda.l $7E3548,x
	cmp.w #$0004
	beq CODE_9F95E5
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b $B1
CODE_9F95E5:
	lda.b $89
	lda.w #$0000
	sta.l $7E3548,x
	sta.l $7E3558,x
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F95D0
	lda.b $AD
	asl a
	tax
	lda.l DATA8_80DA26,x
	tax
	dec a
	and.w $0AD5
	sta.w $0AD5
	lda.b $B1
	jsl.l Mul16U
	lda.b $08
	tsb.w $0AD5
	lda.l $7E35D4
	inc a
	sta.l $7E35D4
CODE_9F961E:
	rtl
CODE_9F961F:
	stz.b $B1
CODE_9F9621:
	ldx.b $89
	lda.l $7E3588,x
	cmp.l $7E3578,x
	bcc CODE_9F9637
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	tsb.b $B1
CODE_9F9637:
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F964E
	lda.b $A9
	asl a
	tax
	lda.l DATA8_80DA26,x
	eor.b $B1
	sta.b $B1
CODE_9F964E:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F9621
	lda.b $AD
	asl a
	tax
	lda.l DATA8_80DA26,x
	tax
	dec a
	and.w $0AD5
	sta.w $0AD5
	lda.b $B1
	jsl.l Mul16U
	lda.b $08
	tsb.w $0AD5
	lda.l $7E35D4
	inc a
	sta.l $7E35D4
	rtl
CODE_9F967B:
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9F96B8
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9F96B8
	ldx.w #$0000
CODE_9F9698:
	phx
	lda.w $1C84,x
	beq CODE_9F96AF
	txa
	lsr a
	jsl.l CODE_9B84DC
	lda.b $B1
	bit.w #$1000
	beq CODE_9F96AF
	pla
	jmp.w $936C
CODE_9F96AF:
	plx
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F9698
	rtl
CODE_9F96B8:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9F96DB
	jsl.l CODE_9B84F5
	lda.b $A9
	bit.w #$1000
	beq CODE_9F96D7
	jmp.w $9372
CODE_9F96D7:
	lda.b $A9
	bne CODE_9F96DC
CODE_9F96DB:
	rtl
CODE_9F96DC:
	stz.w $0AD1
	stz.w $07C6
	jml.l CODE_9F82D2
CODE_9F96E6:
	lda.w #$0005
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	rtl
CODE_9F96F7:
	lda.w #$FFFF
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	rtl
CODE_9F9708:
	jsl.l WaitFrame
	lda.w $0AD3
	bne CODE_9F9708
	rtl
CODE_9F9712:
	jsl.l GetShifter
	lda.b $A9
	sta.w $0D31
	asl a
	sta.b $89
CODE_9F971E:
	lda.b $A9
	cmp.l $7E35D6
	beq CODE_9F973C
	ldx.b $89
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	bit.w #$0004
	bne CODE_9F973C
	jsl.l CODE_9F9EB7
CODE_9F973C:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9F971E
	rtl
CODE_9F9745:
	stx.b $87
	ldx.w #$0000
CODE_9F974A:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9F974A
	ldx.b $87
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b $08
	pha
	jsl.l CODE_9FC372
	jsl.l CODE_9EC7BE
	pla
	sta.b $08
	lda.w #$0019
	sta.w printx
	lda.l $7E346A
	bne CODE_9F977F
	inc.w printx
CODE_9F977F:
	lda.b $B5
	cmp.w #$0003
	bcs CODE_9F9789
	jmp.w $9794
CODE_9F9789:
	lda.w #$0001
	sta.l $7E35F2
	jsl.l CODE_9F992E
CODE_9F9794:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9F97CE
	sta.b $89
	ldy.b $B5
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	stx.b $87
	ldx.w #$0012
CODE_9F97C4:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9F97C4
	ldx.b $87
	rtl
DATA8_9F97CE:
	dw 12,162,267,307,218,227
	asl.b $A5
	lda.b $91
	beq CODE_9F97E3
	lda.w #$0034
CODE_9F97E3:
	adc.b $A5
	tay
	lda.w tmpdst,y
	sta.b $A5
	bpl CODE_9F9811
	eor.w #$FFFF
	sta.b $A5
	cmp.w #$0004
	bcc CODE_9F9803
CODE_9F97F7:
	lda.w #$0001
	sta.b $A5
	bra CODE_9F9803
CODE_9F97FE:
	lda.w #$0003
	sta.b $A5
CODE_9F9803:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9F9848
	sta.b $8D
	jml.l CODE_9ECFC6
CODE_9F9811:
	lda.b $A5
	bit.w #$1000
	bne CODE_9F97FE
	lda.b $A5
	sta.b $A9
	and.w #$0FFF
	sta.b $A5
	jsl.l PushTime
	jsl.l CODE_9EC7BE
	lda.w #$0004
	sta.b $A5
	lda.w #$4000
	trb.b $A9
	beq CODE_9F983A
	lda.w #$0005
	sta.b $A5
CODE_9F983A:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9F9848
	sta.b $8D
	jml.l CODE_9ECFC6
DATA8_9F9848:		; a word (2 + the text), then the text
	dw $0008 : db "Ice   "
	dw $0008 : db "Bench "
	dw $0008 : db "Inj P "
	dw $0008 : db "Inj G "
	dw $0004 : db "  "
	dw $0004 : db " C"
	asl.b $A5
	lda.b $91
	beq CODE_9F9879
	lda.w #$0034
CODE_9F9879:
	adc.b $A5
	tay
	lda.w tmpde,y
	sta.b $08
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9F988F
CODE_9F988A:
	lda.w #$1000
	sta.b $08
CODE_9F988F:
	lda.w #$0028
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	cmp.w #$0065
	bcc CODE_9F98A4
	lda.w #$0064
CODE_9F98A4:
	sta.b $A5
	bra CODE_9F98B1
CODE_9F98A8:
	lda.b $A5
	and.w #$000E
	sta.b $A5
	dec.b $A9
CODE_9F98B1:
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF813
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
	lda.b $A5
	and.w #$0001
	eor.w #$0001
	sta.b $A5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9F98F1
	sta.b $8D
	jml.l CODE_9ECFC6
DATA8_9F98F1:
	dw $0008 : db "Right "
	dw $0008 : db "Left  "
	lda.b $A5
	asl a
	asl a
	asl a
	adc.w #$008C
	sta.b $A5
	jsl.l PushNumber
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF817
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	rtl
CODE_9F992E:
	lda.b $A5
	asl a
	adc.b $A5
	asl a
	asl a
	sta.b $00
	stz.b $A7
	ldy.b $91
	beq CODE_9F9945
	lda.b $00
	clc
	adc.w #$0138
	sta.b $00
CODE_9F9945:
	lda.w #$009C
	sta.b $8B
	lda.w tmdata,y
	sta.b $89
	clc
	ldy.w #$0000
	adc.b [$89],y
	sta.b $89
	dec.b $A5
	bmi CODE_9F9969
CODE_9F995B:
	lda.b $89
	clc
	adc.b [$89]
	adc.w #$0008
	sta.b $89
	dec.b $A5
	bpl CODE_9F995B
CODE_9F9969:
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	stz.b $A5
	stz.b $A9
	phx
	lda.w #$0000
CODE_9F9978:
	sta.b $AD
	asl a
	tax
	lda.l DATA8_80DA26,x
	bit.b $B7
	bne CODE_9F9987
	jmp.w $9A5C
CODE_9F9987:
	cpx.w #$000C
	beq CODE_9F9991
	cpx.w #$001A
	bne CODE_9F9993
CODE_9F9991:
	inc.b $A7
CODE_9F9993:
	lda.w #$000F
	sec
	sbc.b $AD
	sta.b $10
	lsr a
	clc
	adc.b $89
	sta.b $0C
	lda.b $8B
	sta.b $0E
	lda.b [$0C]
	sta.b $B1
	lda.b $AD
	lsr a
	bcc CODE_9F99B6
	lda.b $B1
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $B1
CODE_9F99B6:
	lda.b $B1
	and.w #$000F
	sta.b $B1
	lda.b $10
	dec a
	dec a
	dec a
	cmp.w #$0006
	bcc CODE_9F99C8
	dec a
CODE_9F99C8:
	clc
	adc.b $00
	tax
	lda.l $7E35F2
	beq CODE_9F99D8
	lda.w $1A12,x
	and.w #$00FF
CODE_9F99D8:
	sta.b $16
	cmp.w #$0080
	bcc CODE_9F99E4
	lda.w #$0100
	sbc.b $16
CODE_9F99E4:
	sta.b $14
	asl a
	clc
	adc.b $14
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9F99F4
	ora.w #$C000
CODE_9F99F4:
	sta.b $14
	lda.b $16
	bit.w #$0080
	beq CODE_9F9A05
	lda.w #$0000
	sec
	sbc.b $14
	sta.b $14
CODE_9F9A05:
	lda.b $B7
	bmi CODE_9F9A3B
	ldx.b $10
	lda.l DATA8_9F9AF8,x
	and.w #$00FF
	beq CODE_9F9A33
	lda.w #$0012
	ldx.b $B1
	jsl.l CODE_808F4C
	clc
	adc.b $14
	bpl CODE_9F9A25
	lda.w #$0000
CODE_9F9A25:
	cmp.w #$0064
	bcc CODE_9F9A2D
	lda.w #$0064
CODE_9F9A2D:
	sta.b $A5
	plx
	jmp.w $9ABD
CODE_9F9A33:
	lda.b $B1
	sta.b $A5
	plx
	jmp.w $9ABD
CODE_9F9A3B:
	lda.b $10
	clc
	adc.b $08
	tax
	lda.l DATA8_9F9AD8,x
	ldx.b $B1
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	lda.b $14
	ldy.b $08
	beq CODE_9F9A57
	asl a
CODE_9F9A57:
	clc
	adc.b $A9
	sta.b $A9
CODE_9F9A5C:
	lda.b $AD
	inc a
	cmp.w #$000F
	bpl CODE_9F9A67
	jmp.w $9978
CODE_9F9A67:
	lda.b $A9
	bpl CODE_9F9A94
	eor.w #$FFFF
	inc a
	ldx.b $08
	bne CODE_9F9A79
	tax
	lda.w #$000A
	bra CODE_9F9A7D
CODE_9F9A79:
	tax
	lda.w #$0007
CODE_9F9A7D:
	jsl.l DivX8U
	sec
	eor.w #$FFFF
	adc.b $A5
	sta.b $A5
	lda.b $A5
	bpl CODE_9F9AB4
	stz.b $A5
	lda.w #$0000
	bra CODE_9F9AB4
CODE_9F9A94:
	ldx.b $08
	bne CODE_9F9A9E
	tax
	lda.w #$000A
	bra CODE_9F9AA2
CODE_9F9A9E:
	tax
	lda.w #$0007
CODE_9F9AA2:
	jsl.l DivX8U
	clc
	adc.b $A5
	sta.b $A5
	lda.b $A5
	bpl CODE_9F9AB4
	stz.b $A5
	lda.w #$0000
CODE_9F9AB4:
	sta.b $A5
	plx
	lda.b $08
	beq CODE_9F9ABD
	lsr.b $A5
CODE_9F9ABD:
	lda.b $A7
	bne CODE_9F9AD7
	lda.b $A5
	cmp.w #$0064
	bcc CODE_9F9ACB
	lda.w #$0064
CODE_9F9ACB:
	cmp.w #$0032
	bcs CODE_9F9AD5
	lsr a
	clc
	adc.w #$0019
CODE_9F9AD5:
	sta.b $A5
CODE_9F9AD7:
	rtl
DATA8_9F9AD8:
	db $00,$00,$01,$02,$03,$03,$02,$01,$02,$01,$03,$02,$01,$01,$01,$01
	db $00,$00,$00,$09,$02,$02,$09,$09,$02,$02,$02,$02,$02,$02,$02,$02
DATA8_9F9AF8:
	db $00,$00,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01
GetPeriodTimeRemaining:
	lda.w gsp
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.w $1C82
	sec
	sbc.w $1632
	sta.b $A5
	rtl
GetPeriodTime:
	phx
	lda.l OptPerlen
	asl a
	tax
	lda.l GetPeriodTime_timetab,x
	sta.b $A5
	plx
	rtl
GetPeriodTime_timetab:		; period lengths in seconds
	dw 300,600,1200,30
CODE_9F9B36:
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
	stx.b $87
	ldx.w #$0000
CODE_9F9B4D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9F9B4D
	ldx.b $87
	lda.w sfhormode
	beq CODE_9F9B61
	jmp.w $9CFB
CODE_9F9B61:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF81C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0009
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9F9BD3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF821
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w gsp
	sta.b $A5
	cmp.w #$0004
	bne CODE_9F9BBB
	dec.w printx
	inc.b $A5
CODE_9F9BBB:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l CODE_9ECFC6
	jsl.l CODE_9FBEFD
	jsl.l updatepwrplay
	bra CODE_9F9C05
CODE_9F9BD3:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF826
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0006
	sta.w printx
	lda.w $1D85
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
CODE_9F9C05:
	lda.w sflags3
	bit.w #$0001
	beq CODE_9F9C10
	jmp.w $9CD8
CODE_9F9C10:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF830
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0009
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF835
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	stz.b $B1
	stz.b $91
	jsl.l CODE_9F9DB0
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	inc.b $B1
	inc.b $91
	inc.b $91
	jsl.l CODE_9F9DB0
	stz.b $91
	lda.w #$0002
	sta.b $95
	lda.w gmode
	bit.w #$0002
	bne CODE_9F9C94
	stz.b $95
	lda.w #$0002
	sta.b $91
CODE_9F9C94:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF83F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
	ldx.b $91
	lda.b $95
	sta.b $91
	stx.b $95
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF844
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9F9DFA
CODE_9F9CD8:
	stx.b $87
	ldx.w #$000E
CODE_9F9CDD:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9F9CDD
	ldx.b $87
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
	ldx.b $95
	rtl
CODE_9F9CFB:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF849
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l PrintPerLabel
	lda.b $A9
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF84E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $178E
	sta.b $A5
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF853
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1790
	sta.b $A5
	jsl.l CODE_9F9E15
	jsl.l PushNumber
	jsl.l CODE_9F9DFB
	jsl.l CODE_9ECE15
	pla
	sta.b $A9
	jmp.w $9CD8
PrintPerLabel:
	lda.w gsp
	sta.b $A5
	cmp.w #$0004
	bne CODE_9F9D8F
	dec.w printx
	inc.b $A5
CODE_9F9D8F:
	lda.w #$0080
	sta.b $8B
	lda.w #$D6E1
	sta.b $89
CODE_9F9D99:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	dec.b $A5
	bpl CODE_9F9D99
	jml.l CODE_9EC7BE
CODE_9F9DB0:
	jsl.l CODE_9FBD66
	ldy.b $91
	lda.w $178E,y
	sta.b $A5
	jsl.l CODE_9F9E15
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0004
	sta.b [$8D]
	lda.w #$0020
	sta.w $0A2C
	lda.b $A5
	sta.b $08
	lda.w #$000A
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	beq CODE_9F9DED
	adc.w #$0030
	sta.w $0A2C
CODE_9F9DED:
	lda.w RDMPYL
	adc.w #$0030
	sta.w $0A2D
	jml.l CODE_9EC7BE
CODE_9F9DFA:
	rtl
CODE_9F9DFB:
	ldy.w #$0002
CODE_9F9DFE:
	dec.w printx
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0031
	beq CODE_9F9E0E
	dec.w printx
CODE_9F9E0E:
	iny
	tya
	cmp.b [$8D]
	bcc CODE_9F9DFE
	rtl
CODE_9F9E15:
	lda.b $A5
CODE_9F9E17:
	cmp.w #$0064
	bcc CODE_9F9E21
	sbc.w #$0064
	bra CODE_9F9E17
CODE_9F9E21:
	sta.b $A5
	rtl
CODE_9F9E24:
	lda.w #$0001
	sta.l $7E3462
	lda.b $91
	pha
	stz.b $91
	lda.w HomeTeam
	sta.b $A9
	lda.w #$0014
	sta.w printx
	lda.w #$0002
	sta.w printy
	jsl.l CODE_9FBE08
	lda.w #$0002
	sta.b $91
	lda.w #$0003
	sta.w printx
	lda.w VisTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	pla
	sta.b $91
	lda.w #$0000
	sta.l $7E3462
	lda.w #$0000
	sta.l $7E3460
	lda.w #$1D47
	sta.l $7F76C2
	sta.l $7F76E2
	lda.l $7E3476
	bne CODE_9F9E86
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
CODE_9F9E86:
	lda.w #$007F
	sta.b $0E
	lda.w #$75C0
	sta.b $0C
	ldy.w #$0060
	ldx.w #$0020
	jsl.l CODE_808723
	lda.w #$007F
	sta.b $0E
	lda.w #$76C0
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l CODE_808723
	jsl.l CODE_9DD923
	rtl
CODE_9F9EB7:
	phx
	ldx.b $89
	lda.l $7E3568,x
	cmp.w #$0004
	bcc CODE_9F9EC6
	jmp.w $9F8F
CODE_9F9EC6:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	ldx.b $89
	lda.l $7E3568,x
	cmp.w #$0003
	bne CODE_9F9F34
	lda.w #$0005
	sta.l $7E3568,x
	lda.l $7E3578,x
	sec
	sbc.l $7E3588,x
	bit.w #$8000
	beq CODE_9F9F02
	eor.w #$FFFF
	inc a
CODE_9F9F02:
	cmp.w #$0002
	bcs CODE_9F9F77
	lda.w gsp
	cmp.w #$0004
	bne CODE_9F9F20
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne CODE_9F9F77
	inc a
	sta.l $7E3578,x
	bra CODE_9F9F77
CODE_9F9F20:
	lda.w #$0003
	sta.l $7E3568,x
	lda.l $7E3598,x
	ora.w #$0002
	sta.l $7E3598,x
	bra CODE_9F9F77
CODE_9F9F34:
	lda.l $7E3568,x
	inc a
	sta.l $7E3568,x
	lda.l $7E3528,x
	sta.b $A5
	lda.l $7E3538,x
	sta.b $A9
	jsl.l CODE_9F9F91
	ldx.b $89
	lda.l $7E3578,x
	clc
	adc.b $A5
	sta.l $7E3578,x
	lda.l $7E3538,x
	sta.b $A5
	lda.l $7E3528,x
	sta.b $A9
	jsl.l CODE_9F9F91
	ldx.b $89
	lda.l $7E3588,x
	clc
	adc.b $A5
	sta.l $7E3588,x
CODE_9F9F77:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9F9F8F:
	plx
	rtl
CODE_9F9F91:
	asl.b $A5
	asl.b $A5
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b $8D
	ldy.b $A5
	lda.b [$8D],y
	sta.b $8D
	ldy.w #$0008
	adc.b [$8D],y
	sta.b $8D
	lda.b [$8D]
	and.w #$0070
	lsr a
	adc.w #$A038
	sta.b $8D
	lda.w #$009F
	sta.b $8F
	lda.b [$8D]
	sta.w $0CF9
	ldy.w #$0002
	lda.b [$8D],y
	sta.w $0CFB
	ldy.w #$0004
	lda.b [$8D],y
	sta.w $0CFD
	ldy.w #$0006
	lda.b [$8D],y
	sta.w $0CFF
	asl.b $A9
	asl.b $A9
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b $8D
	ldy.b $A9
	lda.b [$8D],y
	sta.b $8D
	ldy.w #$0008
	adc.b [$8D],y
	sta.b $8D
	lda.b [$8D]
	and.w #$0007
	asl a
	asl a
	asl a
	adc.w #$A038
	sta.b $8D
