; Bank $9F, third 4 KB: more game flow code, with auto labels for now: among it the GOAL! and HAT TRICK! messages
; (GoalBoxText, text records with position codes), the word table DATA8_9FA038 and the byte tables DATA8_9FAEE2,
; DATA8_9FAEFA and DATA8_9FAF02.

org $9FA001
	lda.w #$009F
	sta.b $8F
	lda.b [$8D]
	adc.w $0CF9
	sta.w $0CF9
	ldy.w #$0002
	lda.b [$8D],y
	adc.w $0CFB
	sta.w $0CFB
	ldy.w #$0004
	lda.b [$8D],y
	adc.w $0CFD
	sta.w $0CFD
	ldy.w #$0006
	lda.b [$8D],y
	adc.w $0CFF
	sta.w $0CFF
	lda.w #$0004
	sta.b $A5
	jml.l WeightedRandomSelect
DATA8_9FA038:
	dw $002B,$001E,$0017,$0004,$0027,$0020,$0018,$0005
	dw $0023,$0021,$001A,$0006,$001E,$0022,$001E,$0006
	dw $001A,$0024,$001E,$0008,$0016,$0025,$001F,$000A
	dw $0013,$0026,$001F,$000C,$000F,$0026,$0020,$000F
CODE_9FA078:
	lda.w sflags
	bit.w #$0800
	beq CODE_9FA083
	jmp.w $A12F
CODE_9FA083:
	lda.w #$0007
	sta.w $0A2A
	lda.w #$0020
	sta.w $0A2C
	lda.w #$003A
	sta.w $0A2E
	lda.w gameclock
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A30
	rep #$20
	lda.b $00
	sta.b $08
	lda.w #$0006
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A2F
	rep #$20
	lda.b $00
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A2D
	rep #$20
	lda.b $00
	beq CODE_9FA0F6
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A2C
	rep #$20
CODE_9FA0F6:
	lda.w #$2000
	sta.w $0D0D
	lda.w #$0003
	sta.w printx
	lda.w #$0018
	sta.w printy
	lda.w sfhormode
	beq CODE_9FA121
	lda.w #$000D
	sta.w printx
	lda.w #$000B
	sta.w printy
	lda.w gsp
	cmp.w #$0004
	beq CODE_9FA12F
CODE_9FA121:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	jml.l CODE_9EC7BE
CODE_9FA12F:
	rtl
ShowInjuryBox:
	stx.b $87
	ldx.w #$0000
CODE_9FA135:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9FA135
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FA146:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FA146
	ldx.b $87
	jsl.l CODE_9F9B36
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF858
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	stz.b $91
	jsl.l CODE_9FA1B8
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF85D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9FA1B8
	stx.b $87
	ldx.w #$000E
CODE_9FA19E:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FA19E
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9FA1AC:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FA1AC
	ldx.b $87
	ldx.b $95
CODE_9FA1B7:
	rtl
CODE_9FA1B8:
	lda.b $91
	beq CODE_9FA1BF
	lda.w #$001A
CODE_9FA1BF:
	sta.b $89
CODE_9FA1C1:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA1EB
	lda.b $91
	beq CODE_9FA1D9
	lda.w #$0034
CODE_9FA1D9:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9FA1C1
	jsl.l pplpen
	bra CODE_9FA1C1
CODE_9FA1EB:
	lda.b $91
	beq CODE_9FA1F2
	lda.w #$001A
CODE_9FA1F2:
	sta.b $89
CODE_9FA1F4:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA1B7
	lda.b $91
	beq CODE_9FA20C
	lda.w #$0034
CODE_9FA20C:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	beq CODE_9FA1F4
	jsl.l pplpen
	bra CODE_9FA1F4
pplpen:
	lda.w printy
	cmp.w #$000B
	bcs CODE_9FA1B7
	lda.b $91
	beq CODE_9FA22D
	lda.w #$0034
CODE_9FA22D:
	adc.b $A5
	tay
	lda.w tmpdst,y
	and.w #$07FF
	sta.b $AD
	lda.w #$009C
	sta.b $8F
	ldy.b $91
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0000
	adc.b [$8D],y
	sta.b $8D
	lsr.b $A5
CODE_9FA24D:
	lda.b [$8D]
	clc
	adc.b $8D
	adc.w #$0008
	sta.b $8D
	dec.b $A5
	bpl CODE_9FA24D
	lda.b $8D
	sec
	sbc.w #$0008
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	sta.b $A5
	lda.w printx
	pha
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2C
	sta.b $8D
	jsl.l PutDigits2
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0004
	sta.b [$8D]
	jsl.l CODE_9EC7BE
	lda.b $AD
	sta.b $A5
	jsl.l PushTime
	inc.w printx
	jsl.l CODE_9EC7BE
	pla
	sta.w printx
	inc.w printy
	rtl
CODE_9FA2A6:
	jsl.l SetupTeamForIntermission
	lda.w #$0000
	ldy.w #$001E
CODE_9FA2B0:
	sta.w Xpos,y
	dey
	dey
	bpl CODE_9FA2B0
	lda.b $83
	ldy.b $85
	sta.w $0D51
	sty.w $0D53
	lda.w #$0001
	trb.w sflags
	lda.w gsp
	cmp.w #$0004
	beq CODE_9FA2D1
	bra CODE_9FA2D1
CODE_9FA2D1:
	lda.w #$0708
	sta.w $0CE3
	lda.w #$0001
	sta.w $0D2F
	lda.b $83
	sec
	sbc.w #$0150
	sta.w $0D33
	jsl.l CODE_9FA37A
	lda.w $0D31
	sta.l $7E35DC
	stz.w $0D13
	stz.w $0D15
	lda.w #$FFFF
	sta.w $0AC6
	ldy.w #$FFFE
CODE_9FA300:
	iny
	iny
	cpy.w #$000A
	bcs CODE_9FA313
	lda.w $1C84,y
	beq CODE_9FA300
	eor.w #$FFFF
	inc a
	sta.w $0AC6
CODE_9FA313:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9FA327
	stz.w $0AC6
CODE_9FA327:
	lda.w #$0001
	sta.w $1A10
CODE_9FA32D:
	lda.w #$0000
	ldy.w #$001E
CODE_9FA333:
	sta.w Xpos,y
	dey
	dey
	bpl CODE_9FA333
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F862
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
	bne CODE_9FA32D
	lda.w #$0000
	sta.l $7E3476
	stz.w $1A10
	stz.w $0D2F
CODE_9FA379:
	rtl
CODE_9FA37A:
	lda.w $0D31
	bmi CODE_9FA385
	ora.l $7E35D6
	bne CODE_9FA390
CODE_9FA385:
	jsl.l GetShifter
	lda.b $A9
	sta.w $0D31
	bmi CODE_9FA379
CODE_9FA390:
	jmp.w $A461
CODE_9FA393:
	lda.w $0D2F
	beq CODE_9FA3BA
	lda.b $83
	sec
	sbc.w $0D33
	cmp.w #$0150
	bcc CODE_9FA3BA
	jsl.l CODE_9FA3BE
	lda.l $7E35DC
	cmp.w $0D31
	bne CODE_9FA393
	jsl.l CODE_9FA636
	lda.w #$0008
	trb.w sflags3
CODE_9FA3BA:
	lda.w #$0000
	rtl
CODE_9FA3BE:
	lda.w $0D31
	bmi CODE_9FA3C9
	ora.l $7E35D6
	bne CODE_9FA3D4
CODE_9FA3C9:
	jsl.l GetShifter
	lda.b $A9
	sta.w $0D31
	bmi CODE_9FA3BA
CODE_9FA3D4:
	jmp.w $A461
PushTime:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A48
	sta.b $8D
	lda.b $A5
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$0006
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$20
	dec.b $8D
	sep #$20
	lda.b #$3A
	sta.b [$8D]
	rep #$30
	lda.b $00
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	dec.b $8D
	sep #$20
	lda.w RDMPYL
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
	lda.b $00
	beq CODE_9FA44B
	dec.b $8D
	sep #$20
	clc
	adc.b #$30
	sta.b [$8D]
	rep #$30
CODE_9FA44B:
	dec.b $8D
	dec.b $8D
	lda.w #$0A48
	sec
	sbc.b $8D
	sta.b [$8D]
	rtl
CODE_9FA458:
	lda.w gameclock
	cmp.w #$01E1
	bcc CODE_9FA461
	rtl
CODE_9FA461:
	lda.w $0D31
	sta.b $B1
	bmi CODE_9FA475
	dec.w $0D31
	lda.b $B1
	cmp.l $7E35D6
	beq CODE_9FA461
	bra CODE_9FA476
CODE_9FA475:
	rtl
CODE_9FA476:
	lda.b $B1
	asl a
	sta.b $89
	tax
	lda.l $7E3598,x
	bit.w #$0006
	bne CODE_9FA461
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF867
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w sflags
	bit.w #$0001
	bne CODE_9FA4C1
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF86C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9FA4C1:
	lda.w sfhormode
	bne CODE_9FA4D0
	lda.w printy
	sec
	sbc.w #$0005
	sta.w printy
CODE_9FA4D0:
	lda.w #$001C
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $83
	sta.w $0D33
	inc.w printx
	lda.w printy
	sec
	sbc.w #$0004
	sta.w printy
	lda.w printx
	pha
	jsl.l GetShifter
	lda.w #$2400
	sta.w $0D0D
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF871
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $01,s
	sta.w printx
	lda.l $7E35D4
	inc a
	sta.b $A5
	lda.l $7E34BC
	bne CODE_9FA52C
	stz.b $A5
CODE_9FA52C:
	lda.w #$0080
	sta.b $8F
	lda.w #GameLabels
	sta.b $8D
	jsl.l CODE_9ECFC6
	lda.b $01,s
	clc
	adc.w #$0015
	sta.w printx
	ldx.b $89
	lda.l $7E3568,x
	dec a
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l CODE_9ECFC6
	lda.w #$2000
	sta.w $0D0D
	ldx.b $89
	lda.l $7E3528,x
	sta.b $A5
	lda.l $7E3578,x
	sta.b $A9
	jsl.l CODE_9FA586
	ldx.b $89
	lda.l $7E3538,x
	sta.b $A5
	lda.l $7E3588,x
	sta.b $A9
	jsl.l CODE_9FA586
	pla
	rtl
CODE_9FA586:
	lda.b $04,s
	sta.w printx
	inc.w printy
	lda.b $A5
	jsl.l CODE_9BC5AB
	jsl.l CODE_9EC7BE
	lda.b $04,s
	clc
	adc.w #$0017
	sta.w printx
	lda.b $A9
	sta.b $A5
	jsl.l PushNumber
	jml.l CODE_9EC7BE
CODE_9FA5AD:
	lda.b $83
	ldy.b $85
	sbc.w $0D51
	sta.b $C5
	tya
	sbc.w $0D53
	bne CODE_9FA5E9
	lda.w sfhormode
	beq CODE_9FA5E9
	lda.w $1A10
	beq CODE_9FA5E9
	stz.w $0CC5
	stz.w $0CD3
	lda.w #$2000
	sta.w $0CC9
	lda.b $C5
	lsr a
	lsr a
	sta.w $0CCF
	lda.w #$00C8
	sta.w $0CD1
	lda.w #$01C0
	sta.w $0CCD
	jsl.l CODE_9BBFB9
CODE_9FA5E9:
	rtl
CODE_9FA5EA:
	phx
	lda.b $A5
	pha
CODE_9FA5EE:
	ldx.w #$0000
CODE_9FA5F1:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq CODE_9FA602
	txa
	jsl.l CODE_9B84DC
	lda.b $B1
	bne CODE_9FA623
CODE_9FA602:
	inx
	cpx.w #$0005
	bcc CODE_9FA5F1
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	lda.b $83
CODE_9FA616:
	cmp.b $83
	beq CODE_9FA616
	jsl.l CODE_9B8017
	pla
	dec a
	pha
	bpl CODE_9FA5EE
CODE_9FA623:
	pla
	plx
	rtl
CODE_9FA626:
	lda.w $15D6
	ora.w gameclock
	bne CODE_9FA635
	jsl.l CODE_9FBA97
	jmp.w $8B79
CODE_9FA635:
	rtl
CODE_9FA636:
	lda.l $7E34BC
	beq CODE_9FA668
	jsl.l GetShifter
	lda.b $A9
	asl a
	sta.b $89
CODE_9FA645:
	ldx.b $89
	lda.l $7E3598,x
	bit.w #$0004
	bne CODE_9FA660
	bit.w #$0002
	beq CODE_9FA660
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9F8DFA
CODE_9FA660:
	dec.b $89
	dec.b $89
	dec.b $A9
	bpl CODE_9FA645
CODE_9FA668:
	rtl
CODE_9FA669:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF88D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0013
	sta.b $A5
	lda.w #$0009
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jml.l eraser
CODE_9FA697:
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
CODE_9FA6AE:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FA6AE
	ldx.b $87
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	stz.b $91
	jsl.l CODE_9FDE13
	inc.b $91
	inc.b $91
	jsl.l CODE_9FDE13
	lda.w #$007E
	sta.b $9B
	lda.w #$3136
	clc
	adc.l $7E313A
	sta.b $99
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF892
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0013
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	ldy.w #$0004
	lda.b [$99],y
	bit.w #$0080
	bne CODE_9FA718
	inc.b $A9
	inc.b $A9
	lda.b [$99],y
	bmi CODE_9FA718
	inc.b $A9
CODE_9FA718:
	jsl.l CODE_9D8000
	stz.b $91
	ldy.w #$0002
	lda.b [$99],y
	bit.w #$0080
	beq CODE_9FA72C
	inc.b $91
	inc.b $91
CODE_9FA72C:
	lda.w #$009F
	sta.b $8F
	lda.w #GoalBoxText
	sta.b $8D
	ldy.w #$0003
	lda.b [$99],y
	and.w #$00FF
	ldy.b $91
	beq CODE_9FA746
	clc
	adc.w #$001A
CODE_9FA746:
	tay
	lda.w $18EE,y
	and.w #$00FF
	cmp.w #$0003
	bne CODE_9FA77B
	jsl.l GoalieCount
	ldy.w #$0003
	lda.b [$99],y
	and.w #$00FF
	cmp.b $A5
	bmi CODE_9FA77B
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	ldy.b $91
	bne CODE_9FA77B
	jsl.l CODE_9BA189
	lda.w Pencntdwn
	clc
	adc.w #$000A
	sta.w Pencntdwn
CODE_9FA77B:
	jsl.l CODE_9ECE15
	ldy.w #$0003
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
	ldy.w #$0004
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF897
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
	ldy.w #$0005
	lda.b [$99],y
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FA7F3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8A9
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC4D0
	jsl.l CODE_9EC7BE
CODE_9FA7F3:
	stx.b $87
	ldx.w #$0012
CODE_9FA7F8:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FA7F8
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
incsrc "data/text/GoalBoxText.asm"
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9FA840
	jmp.w $AEB1
CODE_9FA840:
	and.w #$FFFD
	sta.w pflags,x
	stx.b $87
	ldx.w #$0000
CODE_9FA84B:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9FA84B
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FA85C:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FA85C
	ldx.b $87
	lda.w #$7000
	sta.b $64
	lda.w #$0012
	jsl.l CODE_80A17D
	lda.w #$0013
	jsl.l CODE_80A17D
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	lda.w #$0000
	sta.l $7E3448
	lda.l $7E35E0
	cmp.w #$0258
	bcc CODE_9FA89B
	lda.w #$0258
	sta.l $7E35E0
CODE_9FA89B:
	lda.w $0AD3
	beq CODE_9FA8AB
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	stz.w $0AD3
CODE_9FA8AB:
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
	lda.w $07F3
	bne CODE_9FA90C
	lda.w PBnum
	beq CODE_9FA8E3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $14
	lda.w PBnum
	and.w #$000F
	cmp.b $14
	beq CODE_9FA8E3
	bcs CODE_9FA8DA
CODE_9FA8D1:
	lda.w #$0004
	jsl.l CODE_9C9B5F
	bra CODE_9FA90C
CODE_9FA8DA:
	lda.w #$0001
	jsl.l CODE_9C9B5F
	bra CODE_9FA90C
CODE_9FA8E3:
	ldy.w $0CC1
	bne CODE_9FA8FA
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9FA90C
	jsl.l RandomWord
	and.w #$0003
	bne CODE_9FA90C
CODE_9FA8FA:
	lda.w #$0000
	ldy.w $0CC1
	bne CODE_9FA905
CODE_9FA902:
	lda.w #$0002
CODE_9FA905:
	jsl.l CODE_9C9B5F
	stz.w $0CC1
CODE_9FA90C:
	lda.w #$000D
	trb.w sflags
	lda.w #$0001
	trb.w sflags3
	stz.w iflags
	stz.w $0CA9
	lda.w #$FFFF
	sta.w RefCnt
	sta.w $0D19
	sta.w $0D1D
	sta.w $0DF9
	sta.w $0D07
	asl a
	sta.w $0AD9
	lda.w #$8200
	trb.w sflags
	lda.w #$0000
	sta.l $7E344A
	sta.l $7E344C
	lda.w #$0500
	tsb.w sflags
	jsl.l CODE_9FB9A4
	stz.w $0D37
	stz.w $0CEB
	lda.l $7E3136
	sta.w $0D71
	lda.l $7E3138
	sta.w pucky
	stz.w puckvx
	stz.w puckvy
	stz.w $0E01
	stz.w $0EDB
	stz.w $0EFB
	stz.w $0D6D
	lda.w #$010C
	sta.w $0DCF
	stz.w $0EDD
	stz.w $0EFD
	stz.w $0D6F
	lda.w #$FEF4
	sta.w $0DD1
	lda.w #$018C
	sta.w $0DB5
	stz.w $11C1
	stz.w $0E21
	stz.w $0E1F
	lda.w #$0040
	trb.w sflags
	lda.w #$0064
	sta.b $B5
CODE_9FA9A4:
	jsl.l CODE_9FC090
	dec.b $B5
	bpl CODE_9FA9A4
	lda.w #$003C
	sta.w $0D4F
	jsl.l ResetBench
	stz.b $91
	jsl.l setpersonel
	jsl.l forcepldata
	inc.b $91
	inc.b $91
	jsl.l setpersonel
	jsl.l forcepldata
	jsl.l CODE_9FD252
	lda.w #$FFFF
	sta.w tmtouch2
	sta.w tmtouch3
	sta.w $17A0
	sta.w $17A4
	lda.b $97
	pha
	lda.b $95
	pha
	stz.b $95
	lda.w #$000B
	sta.b $AD
	lda.b $AD
	pha
CODE_9FA9EF:
	ldx.b $95
	cpx.w #$0018
	bcs CODE_9FAA07
	lda.w pfteam,x
	lsr a
	eor.w gmode
	and.w #$0002
	lsr a
	eor.w #$0001
	sta.w pfgoal,x
CODE_9FAA07:
	lda.w pnum,x
	asl a
	cpx.w #$000C
	bcc CODE_9FAA14
	clc
	adc.w #$0034
CODE_9FAA14:
	tax
	lda.w tmpdst,x
	bmi CODE_9FAA22
	bit.w #$1000
	bne CODE_9FAA22
	jmp.w $ABA2
CODE_9FAA22:
	ldx.b $95
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w $0D97,x
	lda.w position,x
	sta.b $A9
	bpl CODE_9FAA3D
	jmp.w $ABA2
CODE_9FAA3D:
	beq CODE_9FAA8A
	lda.w $1E9B
	beq CODE_9FAA59
	phx
	ldx.w #$0008
	lda.w $1E91
	beq CODE_9FAA50
	ldx.w #$0014
CODE_9FAA50:
	lda.w $1E8F
	sta.w pnum,x
	sta.b $B1
	plx
CODE_9FAA59:
	lda.w #$0016
	sta.b $A5
	lda.b $A9
	cmp.w #$0004
	bne CODE_9FAA86
	stz.b $91
	lda.w pfteam,x
	beq CODE_9FAA70
	inc.b $91
	inc.b $91
CODE_9FAA70:
	ldy.b $91
	lda.w pnum,x
	and.w #$00FF
	sta.w tmtouch1,y
	lda.w #$0004
	sta.w tmflags,y
	lda.w #$0017
	sta.b $A5
CODE_9FAA86:
	jsl.l assinsert
CODE_9FAA8A:
	lda.w tmap
	sta.b $B5
	ldx.b $95
	lda.w pfteam,x
	beq CODE_9FAA9B
	lda.w $17A8
	sta.b $B5
CODE_9FAA9B:
	lda.b $B5
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0006
	asl a
	asl a
	asl a
	sta.b $B5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEE2
	clc
	adc.b $B5
	sta.b $8D
	lda.w $1E9B
	beq CODE_9FAAC6
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEFA
	sta.b $8D
CODE_9FAAC6:
	ldy.b $A9
	lda.b [$8D],y
	and.w #$00FF
	asl a
	asl a
	sta.b $B5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAF02
	sta.b $8D
	ldy.b $B5
	lda.b [$8D],y
	sta.b $A5
	iny
	iny
	lda.b [$8D],y
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9FAAFC
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9FAAFC:
	lda.w position,x
	beq CODE_9FAB51
	lda.b $B5
	cmp.w #$0009
	bpl CODE_9FAB3F
	lda.l $7E3136
	eor.b $A5
	bpl CODE_9FAB28
	lda.l $7E3138
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAB1F
	ora.w #$E000
CODE_9FAB1F:
	eor.w #$FFFF
	inc a
	clc
	adc.b $A9
	sta.b $A9
CODE_9FAB28:
	lda.l $7E3136
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9FAB36
	ora.w #$C000
CODE_9FAB36:
	sta.b $B1
	lda.b $A5
	sec
	sbc.b $B1
	sta.b $A5
CODE_9FAB3F:
	lda.b $A5
	clc
	adc.l $7E3136
	sta.b $A5
	lda.b $A9
	clc
	adc.l $7E3138
	sta.b $A9
CODE_9FAB51:
	lda.b $A5
	sta.w Xpos,x
	sec
	sbc.w $0D71
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.b $A9
	sta.w Ypos,x
	sec
	sbc.w pucky
	eor.w #$FFFF
	inc a
	sta.b $A9
	stz.w $0EC3,x
	stz.w $0EE3,x
	jsl.l vtoa
	lda.b $A5
	sta.w $1163,x
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w $14E3,x
	stz.w SPA,x
	lda.w position,x
	bne CODE_9FAB97
	lda.w #SPAgready
	bra CODE_9FAB9A
CODE_9FAB97:
	lda.w #SPAglide
CODE_9FAB9A:
	jsl.l CODE_9EA3F1
	jsl.l updateanim
CODE_9FABA2:
	inc.b $95
	inc.b $95
	pla
	sta.b $AD
	dec.b $AD
	lda.b $AD
	pha
	bmi CODE_9FABB3
	jmp.w $A9EF
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
	jmp.w $ADB5
CODE_9FACFC:
	lda.w #$0001
	sta.w printy
	lda.w #$0006
	sta.w printx
	lda.w #$0014
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	jsl.l CODE_9D8000
	lda.w $1E91
	sta.b $91
	lda.w #$0005
	sta.w printy
	lda.w $1E8F
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [$8D]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$000F
	sta.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	inc.w printy
	lda.w $1E91
	eor.w #$0002
	sta.b $91
	tay
	lda.w tmgoalie,y
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [$8D]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l CODE_9EC7BE
	lda.w #$0007
	sta.w printx
	lda.w #$0002
	sta.w printy
	lda.w $1D81
	beq CODE_9FADA7
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8B8
	sta.b $8D
	jsl.l CODE_9ECE15
	bra CODE_9FADB5
CODE_9FADA7:
	lda.w #$009C
	sta.b $8F
	lda.w #$F8C2
	sta.b $8D
	jsl.l CODE_9ECE15
CODE_9FADB5:
	ldx.b $95
	lda.l $7E34C6
	beq CODE_9FAE2E
CODE_9FADBD:
	lda.w $1E9B
	ora.w $1E9D
	bne CODE_9FAE2E
	lda.w printy
	clc
	adc.w #$000A
	sta.w printy
	lda.w #$000C
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	lda.w tmline
	sta.b $A5
	lda.w $1798
	sta.b $A9
	lda.w gmode
	bit.w #$0002
	bne CODE_9FADF9
	lda.w tmline
	sta.b $A9
	lda.w $1798
	sta.b $A5
CODE_9FADF9:
	inc.w printx
	dec.w printy
	dec.w printy
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
	inc.w printx
	inc.w printx
	inc.w printx
	inc.w printx
	lda.b $A9
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
CODE_9FAE2E:
	jsl.l RandomWord
	and.w #$007F
	adc.w #$00B4
	sta.b $A5
	ldx.b $95
	sta.w $1003,x
	lda.w $1E9B
	beq CODE_9FAE4A
	lda.w #$00B4
	sta.w $1003,x
CODE_9FAE4A:
	lda.w #$0001
	sta.l $7E312A
	lda.w #$8000
	sta.l $7E312C
	sta.l $7E3134
	lda.w #$0004
	sta.l $7E312E
	lda.w #$A800
	sta.l $7E3130
	lda.w #$0007
	sta.l $7E3132
	lda.w gmode
	bit.w #$0002
	bne CODE_9FAE87
	lda.w #$8800
	sta.l $7E312C
	lda.w #$A000
	sta.l $7E3130
CODE_9FAE87:
	lda.w #$FFFF
	sta.l $7E3122
	sta.l $7E3124
	stx.b $87
	ldx.w #$001A
CODE_9FAE97:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FAE97
	ldx.b $87
	stx.b $87
	ldx.w #$001E
CODE_9FAEA5:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FAEA5
	ldx.b $87
	ldx.b $95
	rtl
CODE_9FAEB1:
	lda.b $C1
	sta.b $C5
	cmp.w $1003,x
	bmi CODE_9FAEBF
	lda.w #$0001
	sta.b $C5
CODE_9FAEBF:
	lda.w $1003,x
	sec
	sbc.b $C5
	sta.w $1003,x
	bpl CODE_9FAF1E
	lda.w $1E9B
	beq CODE_9FAED6
	jsl.l CODE_9FB092
	jmp.w $AFBE
CODE_9FAED6:
	stz.w $163A
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w $B092
DATA8_9FAEE2:
	db $00,$01,$02,$03,$04,$05,$06,$00
	db $00,$01,$05,$03,$04,$02,$00,$00
	db $00,$03,$05,$01,$04,$00,$00,$00
DATA8_9FAEFA:
	db $00,$04,$04,$04,$04,$04,$04,$00
DATA8_9FAF02:
	db $00,$00,$06,$FF,$DD,$FF,$CE,$FF,$23,$00,$CE,$FF,$CE,$FF,$F6,$FF
	db $00,$00,$F1,$FF,$32,$00,$F6,$FF,$00,$00,$C4,$FF
CODE_9FAF1E:
	lda.w $1003,x
	beq CODE_9FAF42
	clc
	adc.w #$0006
	lsr a
	lsr a
	lsr a
	sta.b $A5
	cmp.w #$0003
	bpl CODE_9FAF41
	lda.b $A5
	eor.w #$FFFF
	inc a
	clc
	adc.w #$000A
	sta.b $A5
	sta.l $7E3132
CODE_9FAF41:
	rtl
CODE_9FAF42:
	lda.w $1E9B
	bne CODE_9FAF97
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8CD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.l $7E3126
	sec
	sbc.w #$002E
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAF74
CODE_9FAF71:
	ora.w #$E000
CODE_9FAF74:
	sta.w printx
	lda.l $7E3128
	sec
	sbc.w #$0044
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAF8A
CODE_9FAF87:
	ora.w #$E000
CODE_9FAF8A:
	sta.w printy
	lda.w #$000C
	sta.b $A5
	inc a
	sta.b $A9
	bra CODE_9FAFAD
CODE_9FAF97:
	lda.w #$0001
	sta.w printy
	lda.w #$0006
	sta.w printx
	lda.w #$0014
	sta.b $A5
	lda.w #$0008
	sta.b $A9
CODE_9FAFAD:
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	stz.w $0764
	stz.w $1D6D
	rtl
CODE_9FAFBE:
	stz.w $0D71
	stz.w pucky
	stz.w $0DF9
	stz.w puckvx
	stz.w puckvy
	stz.w $0E01
	phx
	ldx.w #$0000
	lda.w #$0002
	sta.b $B5
	lda.w $1E91
	beq CODE_9FAFE6
	ldx.w #$000C
	lda.w #$0000
	sta.b $B5
CODE_9FAFE6:
	lda.w #$0010
	sta.b $A5
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
