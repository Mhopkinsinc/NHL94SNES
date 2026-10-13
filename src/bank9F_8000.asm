; Bank $9F, first 4 KB: game flow code, with auto labels for now (it calls the screen code of banks $9B to $9E and the
; sound streamer of bank $9C). DATA8_9F8B6F is a byte table read with an index from 1.

org $9F8000
CODE_9F8000:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	stz.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	stz.w $1DB9
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	jsl.l CODE_9F8064
CODE_9F8032:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9F8054
	bit.w #$4000
	bne CODE_9F8055
	bra CODE_9F8032
CODE_9F8054:
	rtl
CODE_9F8055:
	lda.w $1DB9
	eor.w #$0001
	sta.w $1DB9
	jsl.l CODE_9F8064
	bra CODE_9F8032
CODE_9F8064:
	jsl.l SpriteFrameStart
	jsl.l CODE_9DDDB3
	jsl.l WaitDMAQueue
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7A5
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35B6
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w VisTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7BD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.w #$000A
	sta.w printx
	ldx.w #$0000
	jsl.l CODE_9F813E
	lda.w #$000E
	sta.w printx
	ldx.w #$0001
	jsl.l CODE_9F813E
	lda.w #$0012
	sta.w printx
	ldx.w #$0002
	jsl.l CODE_9F813E
	lda.w #$0016
	sta.w printx
	ldx.w #$0003
	jsl.l CODE_9F813E
	lda.w #$001A
	sta.w printx
	ldx.w #$0004
	jsl.l CODE_9F813E
	jsl.l SpriteFrameEnd
	rtl
CODE_9F813E:
	lda.w printx
	sta.b $B5
	lda.w #$2400
	sta.w $0D0D
	lda.w #$000C
	sta.w printy
	inc.w printx
	cpx.w #$0004
	bne CODE_9F8179
	dec.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7C2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	inc.w printy
	bra CODE_9F8197
CODE_9F8179:
	cpx.w $1EAD
	beq CODE_9F8183
	bmi CODE_9F8183
	jmp.w CODE_808281
CODE_9F8183:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	stx.b $A5
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
CODE_9F8197:
	txa
	asl a
	asl a
	tax
	lda.w #$2000
	sta.w $0D0D
	lda.w $1DB9
	beq CODE_9F8219
CODE_9F81A6:
	lda.b $B5
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $176C,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $B5
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $176A,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$2400
	sta.w $0D0D
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #$F7C9
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F7D0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9F8281
CODE_9F8219:
	lda.b $B5
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $1780,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $B5
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $177E,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7DE
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7E5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9F8281:
	rtl
CODE_9F8282:
	rtl
CODE_9F8283:
	rep #$30
	jsl.l Multi5Init
	jsl.l CODE_9FF436
	jsl.l CODE_8086A9
	lda.w #$0000
	tax
CODE_9F8295:
	sta.l $7F0000,x
	dex
	dex
	bne CODE_9F8295
	lda.w #$005C
	sta.w $1D59
	jsl.l CODE_9B8000
	jsl.l CODE_9BCDE2
	jsl.l CODE_9D9C97
	jsl.l CODE_9B8526
	lda.w #$0000
	sta.w $0AD3
	jsl.l CODE_9B8526
	stz.w $1D68
	jsl.l CODE_9DB118
	jsl.l CODE_9C9786
CODE_9F82C8:
	lda.w $0AD3
	bne CODE_9F82C8
	lda.w $07F3
	bne CODE_9F82C8
CODE_9F82D2:
	lda.w #$0000
	sta.l $7E35D4
	rep #$30
	lda.w #$1FFF
	tcs
	phk
	plb
	jsl.l CODE_9C978E
	lda.w $07F3
	beq CODE_9F82FB
	lda.w $07ED
	cmp.w #$C20C
	beq CODE_9F8309
	jsl.l CODE_9C9786
CODE_9F82F6:
	lda.w $07F3
	bne CODE_9F82F6
CODE_9F82FB:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9F8309:
	stz.w sfhormode
	lda.w #$005C
	sta.w $1D59
	jsl.l CODE_9B8000
	jsl.l CODE_9DA5CA
	stz.w $1D81
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9F8330
	jsl.l CODE_80C81C
	stz.w $07C6
	jmp.w $82D2
CODE_9F8330:
	jsl.l CODE_9D8BBF
CODE_9F8334:
	jsl.l CODE_9FE0E8
	jsl.l CODE_9D8129
CODE_9F833C:
	lda.w #$FFFF
	sta.w $07C6
	jsl.l CODE_9F96F7
	ldx.w #$0AD7
	lda.w #$0000
CODE_9F834C:
	sta.b $00,x
	inx
	cpx.w #$1A11
	bne CODE_9F834C
	ldx.w #$30F4
CODE_9F8357:
	sta.l $7E0000,x
	inx
	cpx.w #$3479
	bne CODE_9F8357
	lda.l $7E347A
	inc a
	sta.l $7E347A
	stz.w gmode
	lda.l $7E34C4
	cmp.w #$0001
	bne CODE_9F837C
	lda.w #$0020
	tsb.w gmode
CODE_9F837C:
	jsl.l ClearTeamStats
	jsl.l restoreteams
	jsl.l CODE_9FC833
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	lda.w #$0010
	trb.w sflags
	lda.b $91
	pha
	lda.w #$0000
	sta.b $91
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9B9334
	pla
	sta.b $91
	lda.l $7E34C8
	sta.w $1C90
	sta.w $1C92
	lda.w #$0001
	sta.w $17E2
	sta.w $17E4
	stz.w $1E9B
	stz.w $1E9D
	stz.w $1EAD
	lda.w #$0001
	sta.l $7E344E
	stz.w $19D0
	stz.w $19D2
	ldx.w #$0008
CODE_9F83DE:
	lda.w $1C84,x
	cmp.w #$0001
	bne CODE_9F83EB
	inc.w $19D0
	bra CODE_9F83F3
CODE_9F83EB:
	cmp.w #$0002
	bne CODE_9F83F3
	inc.w $19D2
CODE_9F83F3:
	dex
	dex
	bpl CODE_9F83DE
	jsl.l CODE_9FB69E
	stz.w $1EBB
	ldx.w #$0000
CODE_9F8401:
	lda.w $1C84,x
	dec a
	asl a
	sta.w $19F6,x
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F8401
	ldx.w #$0000
CODE_9F8413:
	lda.w $1C84,x
	bne CODE_9F8421
	inx
	inx
	cpx.w #$000A
	bcc CODE_9F8413
	bra CODE_9F8427
CODE_9F8421:
	lda.w #$0001
	sta.w $1EBB
CODE_9F8427:
	lda.w #$FFFF
	sta.w $1E8D
	lda.w $1D81
	beq CODE_9F8433
	rtl
CODE_9F8433:
	lda.w $1D81
	bne CODE_9F843C
	lda.w #$1FFF
	tcs
CODE_9F843C:
	stz.b $91
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b $91
	jsl.l reenergizeteam
	stz.w $0CC7
	jsl.l CODE_8086A9
	jsl.l CODE_9FB8B4
	jsl.l CODE_9FC683
	jsl.l CODE_9B9B6B
	lda.w $1EBB
	beq CODE_9F8497
	lda.w #$FFFF
	sta.w $0AC6
	ldy.w #$FFFE
CODE_9F846C:
	iny
	iny
	cpy.w #$000A
	bcs CODE_9F847F
	lda.w $1C84,y
	beq CODE_9F846C
	eor.w #$FFFF
	inc a
	sta.w $0AC6
CODE_9F847F:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9F8493
	stz.w $0AC6
CODE_9F8493:
	jsl.l CODE_9F9365
CODE_9F8497:
	ldx.w #$001C
	stx.b $95
	lda.w #$0000
	sta.l $7E3136
	sta.l $7E3138
	lda.w #$001B
	sta.b $A5
	jsl.l CODE_9E8C18
	jsl.l CODE_9DD977
	lda.w #$0400
	tsb.w sflags
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	sta.w $0CC1
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9F84E3
	lda.w #$0010
	trb.w sflags
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	bra CODE_9F84EB
CODE_9F84E3:
	lda.w $1EBB
	bne CODE_9F84EB
	stz.w $0CC1
CODE_9F84EB:
	lda.w #$FFFF
	sta.w $0CD5
	stz.w $0CD7
	stz.b $83
	stz.b $85
	stz.w $0D35
	stz.w $0D01
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	lda.w $1D81
	beq CODE_9F8511
	rtl
CODE_9F8511:
	lda.b $83
	sec
	sbc.w $0D01
	beq CODE_9F8511
	inc.w $1D6D
	lda.w #$003C
	ldx.w $1D6D
	jsl.l CODE_808F98
	lda.w $0764
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $0A98
	lda.w gsp
	cmp.w #$0002
	bne CODE_9F8551
	lda.w $07F3
	bne CODE_9F8551
	jsl.l RandomWord
	and.w #$0FFF
	bne CODE_9F8551
	lda.w #$0005
	jsl.l CODE_9C9B5F
CODE_9F8551:
	jsl.l RandomWord
	lda.b $83
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
	bne CODE_9F85D3
	lda.w $15D6
	bne CODE_9F85D3
	lda.w $1D81
	bne CODE_9F85AA
	lda.w $163A
	beq CODE_9F85AA
	ldx.b $C1
	lda.w $1E9F
	sec
	sbc.b $C1
	sta.w $1E9F
	bne CODE_9F85A8
	jsl.l CODE_9EC791
CODE_9F85A8:
	bra CODE_9F85D3
CODE_9F85AA:
	ldx.b $C1
CODE_9F85AC:
	lda.w gameclock
	beq CODE_9F85D0
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs CODE_9F85D0
	dec.w gameclock
	lda.w $19BE
	clc
	adc.w #$FFFD
	bmi CODE_9F85CC
	sta.w $19BE
CODE_9F85CC:
	jsl.l CODE_9B9BF8
CODE_9F85D0:
	dex
	bne CODE_9F85AC
CODE_9F85D3:
	lda.w $0CE7
	beq CODE_9F85F0
	lda.b $83
	sec
	sbc.w $0CE9
	cmp.w #$0096
	bcc CODE_9F85F0
	dec.w $0CE7
	lda.w $0CE9
	clc
	adc.w #$0096
	sta.w $0CE9
CODE_9F85F0:
	jsl.l CODE_9F8625
	jsl.l CODE_9F967B
	lda.w sflags
	bit.w #$0001
	bne CODE_9F8613
	lda.w $1A0E
	beq CODE_9F8617
	lda.w gmode
	bit.w #$0010
	bne CODE_9F8617
	lda.w #$0001
	tsb.w sflags
CODE_9F8613:
	jsl.l CODE_9F937B
CODE_9F8617:
	lda.w $1D81
	beq CODE_9F8622
	lda.w $1D87
	beq CODE_9F8622
	rtl
CODE_9F8622:
	jmp.w $8511
CODE_9F8625:
	jsl.l SpriteFrameStart
	jsl.l CODE_9C9FED
	jsl.l CODE_9F8646
	jsl.l CODE_9F8686
	jsl.l CODE_9FC090
	jsl.l CODE_9BA8DB
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	rtl
CODE_9F8646:
	jsl.l CODE_9EB188
	jsl.l CODE_9B9F7A
	jsl.l CODE_9C9930
	jsl.l CODE_9FA626
	lda.w sfhormode
	bne CODE_9F8685
	lda.w $0CF7
	sec
	sbc.b $C1
	sta.w $0CF7
	bpl CODE_9F8685
	clc
	adc.w #$0018
	sta.w $0CF7
	jsl.l CODE_9ED0A8
	jsl.l CODE_80D322
	jsl.l CODE_80D323
	jsl.l CODE_9FDDCD
	jsl.l CODE_9EC2C7
	jsl.l updatepwrplay
CODE_9F8685:
	rtl
CODE_9F8686:
	lda.w #$FFFF
	sta.w $0B9D
	sta.w $0B9F
	sta.w $17AE
	sta.w $17B0
	sta.w $17B2
	sta.w $17B4
	lda.w $0DF9
	sta.w $0DFF
	ldx.w #$001E
CODE_9F86A4:
	stx.b $E4
	lda.w Xpos,x
	sta.w $0E43,x
	lda.w $0D77,x
	sta.w $0E63,x
	lda.w Ypos,x
	sta.w $0E83,x
	lda.w $0DD9,x
	sta.w $0EA3,x
	cpx.w #$0018
	beq CODE_9F86C8
	cpx.w #$001A
	bne CODE_9F86CB
CODE_9F86C8:
	jmp.w $875F
CODE_9F86CB:
	lda.w position,x
	bpl CODE_9F86D3
	jmp.w $8834
CODE_9F86D3:
	bne CODE_9F86E2
	lda.w Ypos,x
	bpl CODE_9F86DF
	stx.w $0B9F
	bra CODE_9F86E2
CODE_9F86DF:
	stx.w $0B9D
CODE_9F86E2:
	jsl.l updateanim
	lda.w $1203,x
	sec
	sbc.w $0ADB
	bpl CODE_9F86F2
	lda.w #$0000
CODE_9F86F2:
	sta.w $1203,x
	lda.w $1223,x
	sec
	sbc.w $0ADB
	bpl CODE_9F8701
	lda.w #$0000
CODE_9F8701:
	sta.w $1223,x
	lda.w sflags3
	bit.w #$0020
	beq CODE_9F8727
	lda.w pnum,x
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9F871A
	ora.w #$FF00
CODE_9F871A:
	sta.b $A5
	cmp.w #$0000
	bmi CODE_9F8727
	asl.b $A5
	jsl.l CODE_9FC757
CODE_9F8727:
	lda.w $0BEB,x
	beq CODE_9F8738
	sec
	sbc.w $0ADB
	bpl CODE_9F8735
	lda.w #$0000
CODE_9F8735:
	sta.w $0BEB,x
CODE_9F8738:
	cpx.w $0D07
	bne CODE_9F8742
	lda.w $1E89
	bne CODE_9F8796
CODE_9F8742:
	lda.w SPA,x
	cmp.w #SPAinjury1
	bne CODE_9F874D
	jmp.w $8834
CODE_9F874D:
	cmp.w #DATA8_9DFC76
	bcc CODE_9F8755
	jmp.w $8834
CODE_9F8755:
	cpx.w #$001C
	bne CODE_9F875F
	lda.w $0DF9
	bne CODE_9F8796
CODE_9F875F:
	txy
	ldx.w $0ADB
	lda.l CODE_9F8B64,x
	and.w #$00FF
	sta.b $AD
	lda.w pflags,y
	bit.w #$0001
	beq CODE_9F877D
	lda.l DATA8_9F8B6F-1,x
	and.w #$00FF
	sta.b $AD
CODE_9F877D:
	ldx.w $0EC3,y
	lda.b $AD
	jsl.l Mul16x8HiXS
	sta.w $0EC3,y
	ldx.w $0EE3,y
	lda.b $AD
	jsl.l Mul16x8HiXS
	sta.w $0EE3,y
	tyx
CODE_9F8796:
	lda.w $0CDF
	sta.b $0C
	lda.w $0EC3,x
	beq CODE_9F87BA
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0D77,x
	sta.w $0D77,x
	lda.b $0A
	adc.w Xpos,x
	sta.w Xpos,x
CODE_9F87BA:
	lda.w $0EE3,x
	beq CODE_9F87D9
	tax
	lda.b $0C
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DD9,x
	sta.w $0DD9,x
	lda.b $0A
	adc.w Ypos,x
	sta.w Ypos,x
CODE_9F87D9:
	cpx.w #$001C
	bne CODE_9F8834
	lda.w $0DF9
	bmi CODE_9F8834
	bne CODE_9F87EA
	lda.w $0E01
	beq CODE_9F8834
CODE_9F87EA:
	lda.w $0E01
	sec
	sbc.w $0CE1
	sta.w $0E01
	tax
	lda.w $0CDF
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	clc
	adc.w $0DFD
	sta.w $0DFD
	lda.b $0A
	adc.w $0DF9
	sta.w $0DF9
	bpl CODE_9F8834
	stz.w $0DF9
	stz.w $0DFD
	lda.w $0E01
	eor.w #$FFFF
	inc a
	lsr a
	sta.w $0E01
	cmp.w #$0200
	bmi CODE_9F8834
	asl a
	asl a
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l CODE_9C9AD0
CODE_9F8834:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	bpl CODE_9F8843
	eor.w #$FFFF
	inc a
CODE_9F8843:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bpl CODE_9F885F
	eor.w #$FFFF
	inc a
CODE_9F885F:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	cpx.w #$0018
	bcs CODE_9F88A8
	sta.b $14
	lda.w position,x
	bmi CODE_9F88A8
	beq CODE_9F88A8
	lda.w pflags,x
	and.w #$1000
	ora.w $14E3,x
	bne CODE_9F88A8
	lda.b $14
	cpx.w #$000C
	bcs CODE_9F889D
	cmp.w $17AE
	bcs CODE_9F88A8
	sta.w $17AE
	stx.w $17B2
	bra CODE_9F88A8
CODE_9F889D:
	cmp.w $17B0
	bcs CODE_9F88A8
	sta.w $17B0
	stx.w $17B4
CODE_9F88A8:
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	cpx.w #$0018
	bcs CODE_9F88F6
	cmp.w #$001E
	bcs CODE_9F88F6
	lda.w iflags
	bit.w #$0004
	beq CODE_9F88F6
	bit.w #$0001
	bne CODE_9F88F6
	and.w #$0002
	beq CODE_9F88D6
	lda.w pfgoal,x
	bne CODE_9F88F6
	bra CODE_9F88DB
CODE_9F88D6:
	lda.w pfgoal,x
	beq CODE_9F88F6
CODE_9F88DB:
	lda.w $0DF9
	cmp.w #$000D
	bcs CODE_9F88F6
	lda.w puckvy
	cmp.w #$2400
	bcs CODE_9F88F6
	cmp.w #$DC00
	bmi CODE_9F88F6
	lda.w #$0005
	trb.w iflags
CODE_9F88F6:
	jsl.l vtoa
	sta.w $0B5D,x
	dex
	dex
	bmi CODE_9F8904
	jmp.w $86A4
CODE_9F8904:
	lda.w $0DCF
	cmp.w #$011F
	bmi CODE_9F890F
	lda.w #$011F
CODE_9F890F:
	sta.w $0DCF
	lda.w $0DD1
	cmp.w #$FED2
	bpl CODE_9F891D
	lda.w #$FED2
CODE_9F891D:
	sta.w $0DD1
	ldy.w #$000C
	lda.w #$000F
CODE_9F8926:
	sta.w $0AE7,y
	dey
	dey
	bpl CODE_9F8926
	ldx.w #$0008
	lda.w #$0000
CODE_9F8933:
	sta.w $0ADD,x
	dex
	dex
	bpl CODE_9F8933
	lda.w #$0000
	sta.b $EA
	lda.w #$0002
	sta.b $EC
	ldx.w #$0000
CODE_9F8947:
	stx.b $95
	stx.b $E4
	cpx.w #$000C
	bne CODE_9F895A
	lda.w #$0002
	sta.b $EA
	lda.w #$0000
	sta.b $EC
CODE_9F895A:
	lda.w #$FFFF
	sta.b $E6
	lda.w position,x
	bpl CODE_9F8967
	jmp.w $8ADD
CODE_9F8967:
	txa
	lsr a
	sta.b $BD
	cpx.w $0AD9
	bne CODE_9F897E
	lda.w sfhormode
	bne CODE_9F897E
	lda.w #$0000
	sta.b $B5
	jsl.l CODE_9BC174
CODE_9F897E:
	cpx.w #$0018
	bcs CODE_9F89B2
	lda.w $19D4,x
	bmi CODE_9F89B2
	tay
	lda.w $0ADD,y
	bne CODE_9F89B2
	lda.w #$0001
	sta.w $0ADD,y
	lda.w $0776,y
	sta.b $B1
	lda.w $0AAE,y
	sta.b $AD
	lda.w $0AB8,y
	sta.b $A9
	lda.w $0AA4,y
	sta.b $A5
	iny
	iny
	sty.b $B5
	jsl.l CODE_9FC1B9
	bra CODE_9F89B2
CODE_9F89B2:
	lda.w $14E3,x
	bne CODE_9F89D5
	lda.w $0B7D,x
	asl a
	asl a
	tax
	lda.l DATA8_80D324,x
	sta.w $1D5A
	lda.l DATA8_80D324+1,x
	sta.w $1D5B
	ldx.b $E4
	jsl.l CODE_9FC757
	jsl.l $001D59
CODE_9F89D5:
	lda.w position,x
	ora.w $15D6
	bne CODE_9F8A44
	cpx.w #$0018
	bcs CODE_9F8A44
	cpx.w $0AD9
	beq CODE_9F8A44
	lda.w $0B05,x
	bit.w #$0001
	bne CODE_9F8A44
	lda.w Xpos,x
	cmp.w #$FFD5
	bpl CODE_9F8A04
	cmp.w #$FFCF
	bmi CODE_9F8A14
	lda.w #$FFD5
	stz.w $0EC3,x
	bra CODE_9F8A14
CODE_9F8A04:
	cmp.w #$002C
	bmi CODE_9F8A14
	cmp.w #$0031
	bpl CODE_9F8A14
	lda.w #$002B
	stz.w $0EC3,x
CODE_9F8A14:
	sta.w Xpos,x
	lda.w Ypos,x
	bpl CODE_9F8A31
	cmp.w #$FF1C
	bmi CODE_9F8A44
	cmp.w #$FF21
	bpl CODE_9F8A44
	lda.w #$FF1B
	sta.w Ypos,x
	stz.w $0EE3,x
	bra CODE_9F8A44
CODE_9F8A31:
	cmp.w #$00E5
	bpl CODE_9F8A44
	cmp.w #$00E0
	bmi CODE_9F8A44
	lda.w #$00E5
	sta.w Ypos,x
	stz.w $0EE3,x
CODE_9F8A44:
	stz.w $1103,x
	stz.w $1123,x
	lda.w Ypos,x
	sta.b $B1
	lda.w Xpos,x
	sta.b $AD
	cmp.w $0E43,x
	bne CODE_9F8A63
	lda.b $B1
	cmp.w $0E83,x
	bne CODE_9F8A63
	jmp.w $8AD1
CODE_9F8A63:
	jsl.l CODE_9E8C35
	cpx.w #$0018
	bcs CODE_9F8AD1
	lda.w position,x
	beq CODE_9F8AD1
	lda.w pflags,x
	and.w #$8000
	ora.w sfhormode
	bne CODE_9F8AD1
	lda.w Xpos,x
	cmp.w #$FFE7
	bmi CODE_9F8AD1
	cmp.w #$0019
	bpl CODE_9F8AD1
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9F8A95
	eor.w #$FFFF
	inc a
CODE_9F8A95:
	sec
	sbc.w #$010D
	sta.b $00
	lda.w $0E83,x
	bit.w #$8000
	beq CODE_9F8AA7
	eor.w #$FFFF
	inc a
CODE_9F8AA7:
	sec
	sbc.w #$010D
	eor.b $00
	bmi CODE_9F8AC5
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9F8ABB
	eor.w #$FFFF
	inc a
CODE_9F8ABB:
	cmp.w #$0103
	bcc CODE_9F8AD1
	cmp.w #$0117
	bcs CODE_9F8AD1
CODE_9F8AC5:
	lda.w $0E43,x
	sta.w Xpos,x
	lda.w $0E83,x
	sta.w Ypos,x
CODE_9F8AD1:
	lda.w $0F23,x
	sec
	sbc.w $0CDD
	bpl CODE_9F8ADD
	lda.w #$0000
CODE_9F8ADD:
	sta.w $0F23,x
	inx
	inx
	cpx.w #$0020
	beq CODE_9F8AEA
	jmp.w $8947
CODE_9F8AEA:
	lda.w $0DF9
	cmp.w #$0018
	bcs CODE_9F8B24
	lda.w $0D71
	cmp.w #$FF78
	bpl CODE_9F8B0B
	lda.w #$FF78
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne CODE_9F8B0B
	sta.w $0D73
CODE_9F8B0B:
	lda.w $0D71
	cmp.w #$0088
	bmi CODE_9F8B24
	lda.w #$0088
	sta.w $0D71
	ldx.w $0DB3
	cpx.w #$018C
	bne CODE_9F8B24
	sta.w $0D73
CODE_9F8B24:
	lda.w $0DF9
	bne CODE_9F8B58
	lda.w pucky
	cmp.w #$FEC2
	bmi CODE_9F8B58
	cmp.w #$013E
	bpl CODE_9F8B58
	lda.w pucky
	cmp.w #$FEDB
	bpl CODE_9F8B47
	lda.w #$FEDB
	sta.w pucky
	sta.w $0DD5
CODE_9F8B47:
	lda.w pucky
	cmp.w #$012A
	bmi CODE_9F8B58
	lda.w #$012A
	sta.w pucky
	sta.w $0DD5
CODE_9F8B58:
	lda.w $0AD9
	bmi CODE_9F8B64
	lda.w pucky
	sta.l $7E30F4
CODE_9F8B64:
	rtl
DATA8_9F8B65:
	db $FD,$FA,$F7,$F4,$F1,$EE,$EB,$E8,$E6,$E3
DATA8_9F8B6F:
	db $FF,$FF,$FE,$FE,$FE,$FD,$FD,$FD,$FC,$FC
CODE_9F8B79:
	ldx.w #$001C
	stx.b $95
	lda.w #$0018
	sta.b $A5
	jsl.l assinsert
	lda.w #$0001
	jsl.l CODE_9C9A7F
	stz.b $0C
	lda.w gsp
	cmp.w #$0002
	bcs CODE_9F8B9B
	jmp.w $8C96
CODE_9F8B9B:
	lda.w #$0008
	sta.b $A5
	ldx.w #$0000
	stx.b $95
	lda.l $7E35D4
	cmp.w #$0003
	bne CODE_9F8C17
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9F8BEE
	lda.l $7E35D6
	asl a
	sta.b $89
	tax
	stz.b $B1
	lda.l $7E3598,x
	bit.w #$0001
	beq CODE_9F8BCE
	lda.w #$0010
	sta.b $B1
CODE_9F8BCE:
	lda.w $178E
	cmp.w $1790
	bpl CODE_9F8BDD
	lda.b $B1
	eor.w #$0010
	sta.b $B1
CODE_9F8BDD:
	lda.b $89
	clc
	adc.b $B1
	phx
	tax
	lda.l $7E3548,x
	plx
	cmp.w #$0003
	bne CODE_9F8C17
CODE_9F8BEE:
	lda.l $7E34BC
	cmp.w #$0000
	beq CODE_9F8C17
	inc.b $0C
	lda.w #$0009
	sta.b $A5
	lda.w #$000B
	sta.b $AD
CODE_9F8C03:
	lda.w pflags,x
	and.w #$FFF7
	sta.w pflags,x
	inx
	inx
	dec.b $AD
	bpl CODE_9F8C03
	ldx.w #$0000
	stx.b $95
CODE_9F8C17:
	lda.w #$0005
	sta.b $AD
	lda.w $178E
	cmp.w $1790
	beq CODE_9F8C96
	bpl CODE_9F8C2B
	ldx.w #$000C
	stx.b $95
CODE_9F8C2B:
	lda.w position,x
	beq CODE_9F8C3B
	bmi CODE_9F8C3B
	jsl.l assinsert
	lda.w #$0008
	sta.b $A5
CODE_9F8C3B:
	inx
	inx
	stx.b $95
	dec.b $AD
	bpl CODE_9F8C2B
CODE_9F8C43:
	jsl.l ClearPenaltyBuffer
	lda.l $7E35E0
	clc
	adc.w #$03E8
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w #$0040
	sta.w $15D6
	tsb.w gmode
	lda.w $178E
	cmp.w $1790
	bmi CODE_9F8C7F
	lda.w #$0000
	sta.l $7E35E0
	lda.w #$0003
	sta.w $0CE7
	lda.b $83
	sec
	sbc.w #$0096
	sta.w $0CE9
CODE_9F8C7F:
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9EB88A
	lda.b $0C
	beq CODE_9F8C95
	lda.w #$0032
	sta.b $A5
	jsl.l CODE_9EB88A
CODE_9F8C95:
	rtl
CODE_9F8C96:
	lda.w gsp
	cmp.w #$0003
	bne CODE_9F8CA4
	lda.l $7E34BC
	beq CODE_9F8C43
CODE_9F8CA4:
	jsl.l CODE_9EC791
	lda.w #$0002
	sta.b $A5
	jml.l ShootoutWonBy
CODE_9F8CB1:
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l WaitFrame
	jsl.l WaitFrame
CODE_9F8CC1:
	lda.w $0AD3
	bne CODE_9F8CC1
	lda.w $07F9
	bne CODE_9F8CC1
	jsl.l CODE_8086A9
	lda.w $1D81
	bne CODE_9F8D0B
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq CODE_9F8CFD
	cmp.w #$0004
	beq CODE_9F8CFD
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9F8CFD
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w $8D0B
CODE_9F8CFD:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9F8D0B:
	lda.w gmode
	eor.w #$0002
	sta.w gmode
	ldy.w #$0000
CODE_9F8D17:
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne CODE_9F8D25
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9F8D25:
	iny
	iny
	cpy.w #$0068
	bcc CODE_9F8D17
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
	inc.w gsp
	lda.w gsp
	cmp.w #$0003
	beq CODE_9F8D70
	bcc CODE_9F8D7E
	lda.w #$0003
	sta.w gsp
	lda.l $7E34BC
	bne CODE_9F8D70
	lda.w #$0004
	sta.w gsp
CODE_9F8D70:
	lda.w $178E
	cmp.w $1790
	beq CODE_9F8D7E
	lda.w #$0004
	sta.w gsp
CODE_9F8D7E:
	jsl.l CODE_9FC683
	jsl.l CODE_9F9712
	jsl.l CODE_9FA2A6
	lda.w gsp
	cmp.w #$0004
	bne CODE_9F8D96
CODE_9F8D92:
	jml.l CODE_9F8DB6
CODE_9F8D96:
	lda.w gsp
	sta.w $1EAD
	jsl.l CODE_9C9786
	jsl.l CODE_9F96F7
CODE_9F8DA4:
	lda.w $07F9
	bne CODE_9F8DA4
	jsl.l CODE_9C98DF
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w $8433
CODE_9F8DB6:
	stz.w $07C6
	jsl.l CODE_9BC75E
	jsl.l CODE_9D8BBF
	lda.l $7E34BC
	cmp.w #$0001
	beq CODE_9F8DCE
	jml.l CODE_9F82D2
CODE_9F8DCE:
	lda.l $7E35D6
	bpl CODE_9F8DD8
	jml.l CODE_9F82D2
CODE_9F8DD8:
	lda.l $7E34F4
	and.w #$7F7F
	sta.l $7E34F4
	jsl.l CODE_9BCD28
	jsl.l CODE_9D9783
	lda.w #$0004
	trb.w sflags3
	beq CODE_9F8DF6
	jmp.w $8330
CODE_9F8DF6:
	jml.l CODE_9F8334
CODE_9F8DFA:
	stx.b $87
	ldx.w #$0000
CODE_9F8DFF:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0020
	bne CODE_9F8DFF
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9F8E10:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9F8E10
	ldx.b $87
CODE_9F8E1C:
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E27
	jmp.w $9276
CODE_9F8E27:
	jsl.l CODE_9F92CB
	lda.b $A9
	sta.b $B1
	jsl.l CODE_9FA476
	lda.w sflags3
	bit.w #$0008
	beq CODE_9F8E3E
	jmp.w $9243
CODE_9F8E3E:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	inc.w printx
	dec.w printy
	dec.w printy
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7F3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$00B4
	sta.b $A5
	jsl.l CODE_9FA5EA
	lda.b $B1
	bit.w #$1000
	beq CODE_9F8E8E
	jmp.w $9243
CODE_9F8E8E:
	stz.w $0AC2
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l CODE_9C9786
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9F8EAD
	jsl.l CODE_9C98DF
CODE_9F8EAD:
	ldx.b $89
	lda.l $7E3528,x
	sta.w HomeTeam
	lda.l $7E3538,x
	sta.w VisTeam
	lda.b $89
	pha
	lda.b $8B
	pha
	jsl.l ClearTeamStats
	jsl.l restoreteams
	lda.w #$0000
	sta.b $91
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9B9334
	stz.b $91
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b $91
	jsl.l reenergizeteam
	jsl.l CODE_9BC17C
	ldx.w #$0008
	lda.w #$FFFF
CODE_9F8EF6:
	sta.w $19EC,x
	sta.w $19F6,x
	dex
	dex
	bpl CODE_9F8EF6
	stz.w $1C84
	stz.w $1C86
	stz.w $1C88
	stz.w $1C8A
	stz.w $1C8C
	lda.w #$0078
	jsl.l CODE_9BB385
	adc.w #$0078
	sta.w gameclock
	pla
	sta.b $8B
	pla
	sta.b $89
	lda.b $89
	pha
	lda.b $8B
	pha
	ldx.b $89
	lda.l $7E3568,x
	dec a
	sta.w gsp
	lda.l $7E3578,x
	sta.w $178E
	lda.l $7E3588,x
	sta.w $1790
	lda.w #$0010
	sta.w gmode
	stz.w $15D6
	lda.w gsp
	lsr a
	bcc CODE_9F8F55
	lda.w #$0002
	tsb.w gmode
CODE_9F8F55:
	stz.w sflags3
	lda.w #$0400
	sta.w sflags
	stz.w sfhormode
	stz.w iflags
	lda.w #$FFFF
	sta.w RefCnt
	sta.w $0D19
	sta.w $0D1D
	jsl.l CODE_9FB8B4
	jsl.l CODE_9FB9A4
	stz.w $0D37
	stz.w $0CEB
	jsl.l ResetBench
	stz.b $91
	jsl.l CODE_9F927D
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9F927D
	jsl.l CODE_9FD252
	lda.w #$0000
	sta.l $7E3448
	lda.w #$000B
	sta.b $A5
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9F9323
	sta.b $89
	stz.b $8D
CODE_9F8FAD:
	ldx.b $8D
	lda.w position,x
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9F8FC1
	lda.b $A9
	clc
	adc.w #$0006
	sta.b $A9
CODE_9F8FC1:
	asl.b $A9
	asl.b $A9
	ldy.b $A9
	lda.b [$89],y
	sta.w Xpos,x
	iny
	iny
	lda.b [$89],y
	sta.w Ypos,x
	stz.w $0EC3,x
	stz.w $0EE3,x
	inc.b $8D
	inc.b $8D
	dec.b $A5
	bpl CODE_9F8FAD
	lda.w $0AD9
	bpl CODE_9F8FF1
	lda.w #$000C
	jsl.l CODE_9BB370
	asl a
	sta.w $0AD9
CODE_9F8FF1:
	tax
	lda.w position,x
	bne CODE_9F8FFD
	dex
	dex
	txa
	sta.w $0AD9
CODE_9F8FFD:
	jsl.l SprSort
