; Bank $9F, sixth 4 KB: more game flow code, with auto labels for now. DATA8_9FD404 holds the letters Y, B and A, one of
; which is printed with a message; DATA8_9FD820, DATA8_9FDB34 and DATA8_9FDBBE are small tables its code reads.

org $9FD000
	sec
	sbc.w $1790
	sta.b $C5
	beq CODE_9FD019
	lda.w pfteam,x
	beq CODE_9FD015
	lda.w #$0000
	sec
	sbc.b $C5
	sta.b $C5
CODE_9FD015:
	lda.b $C5
	bpl CODE_9FD01F
CODE_9FD019:
	lda.w #$0002
	sta.w $0CE5
CODE_9FD01F:
	pla
	sta.b $8B
	pla
	sta.b $89
	ldy.w #$0000
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
CODE_9FD02F:
	lda.b [$89]
	clc
	adc.b $89
	adc.w #$0008
	sta.b $89
	dec.b $B1
	bpl CODE_9FD02F
	lda.b $89
	sec
	sbc.w #$0008
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	sta.w $13C3,x
	ldy.w #$0001
	lda.b [$89],y
	and.w #$00F0
	lsr a
	sta.w $12C3,x
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0000
	jsl.l CODE_9FD22B
	sta.w $12E3,x
	ldy.w #$0002
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0001
	jsl.l CODE_9FD22B
	sta.w $1303,x
	ldy.w #$0002
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	clc
	adc.w $0CE5
	ldy.w #$0002
	jsl.l CODE_9FD22B
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w $1323,x
	ldy.w #$0003
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w HmAwBonus
	ldy.w #$0003
	jsl.l CODE_9FD22B
	pha
	lda.w position,x
	beq CODE_9FD0EE
	pla
	eor.w #$000F
	clc
	adc.w #$0007
	sta.w $1343,x
	bra CODE_9FD0FA
CODE_9FD0EE:
	pla
	eor.w #$000F
	clc
	adc.w #$000F
	lsr a
	sta.w $1343,x
CODE_9FD0FA:
	ldy.w #$0003
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0004
	jsl.l CODE_9FD22B
	sta.w $1363,x
	ldy.w #$0004
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	ldy.w #$0005
	jsl.l CODE_9FD22B
	sta.w $1483,x
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	ldy.w #$0004
	lda.b [$89],y
	and.w #$0001
	eor.w #$0001
	sta.w $14A3,x
	bne CODE_9FD156
	lda.w attribute,x
	ora.w #$0800
	sta.w attribute,x
CODE_9FD156:
	lda.b [$89],y
	and.w #$000E
	sta.w $1463,x
	ldy.w #$0005
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0006
	jsl.l CODE_9FD22B
	sta.w $1403,x
	ldy.w #$0005
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w PKBonus
	clc
	adc.w HmAwBonus
	ldy.w #$0007
	jsl.l CODE_9FD22B
	sta.w $1383,x
	ldy.w #$0006
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$0008
	jsl.l CODE_9FD22B
	sta.w $1423,x
	ldy.w #$0006
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w $0CE5
	clc
	adc.w $0CE5
	ldy.w #$0009
	jsl.l CODE_9FD22B
	sta.w $13E3,x
	ldy.w #$0007
	lda.b [$89],y
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	clc
	adc.w PPBonus
	clc
	adc.w HmAwBonus
	ldy.w #$000A
	jsl.l CODE_9FD22B
	sta.w $13A3,x
	ldy.w #$0007
	lda.b [$89],y
	and.w #$0007
	sta.b $00
	asl a
	asl a
	adc.b $00
	lsr a
	ldy.w #$000B
	jsl.l CODE_9FD22B
	sta.w $1443,x
	ply
	plx
	rtl
CODE_9FD22B:
	sta.b $16
	tya
	clc
	adc.b $14
	tay
	sep #$20
	lda.w $1A12,y
	lsr a
	lsr a
	bit.b #$00
	beq CODE_9FD23F
	ora.b #$00
CODE_9FD23F:
	clc
	adc.b $16
	bpl CODE_9FD246
	lda.b #$00
CODE_9FD246:
	cmp.b #$0F
	bcc CODE_9FD24C
	lda.b #$0F
CODE_9FD24C:
	rep #$20
	and.w #$00FF
	rtl
CODE_9FD252:
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
CODE_9FD269:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FD269
	ldx.b $87
	stz.b $91
	jsl.l CODE_9FD2A7
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9FD2A7
	stx.b $87
	ldx.w #$000E
CODE_9FD289:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FD289
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
CODE_9FD2A7:
	ldy.b $91
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	lda.w #$0005
	sta.b $AD
	ldx.w tmsort,y
	stx.b $95
CODE_9FD2BC:
	stz.w $1543,x
	lda.w pflags,x
	and.w #$2FFF
	sta.w pflags,x
	lda.w position,x
	bmi CODE_9FD2F3
	bne CODE_9FD2D4
	lda.w #$E0FE
	bra CODE_9FD2D7
CODE_9FD2D4:
	lda.w #$EA1A
CODE_9FD2D7:
	jsl.l CODE_9EA3F1
	stz.w $0F23,x
	stz.w $1203,x
	lda.w pflags,x
	and.w #$FFF6
	sta.w pflags,x
	stz.w $1563,x
	stz.w $1523,x
	stz.w $14E3,x
CODE_9FD2F3:
	inc.b $95
	inc.b $95
	ldx.b $95
	dec.b $AD
	bpl CODE_9FD2BC
	rtl
CODE_9FD2FE:
	lda.l $7E34C6
	cmp.w #$0001
	bne CODE_9FD324
	jsl.l CODE_9FC757
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0008
	bne CODE_9FD324
	ora.w #$0008
	sta.w tmflags,y
	lda.w #$000C
	trb.w sflags
	jmp.w $D325
CODE_9FD324:
	rtl
CODE_9FD325:
	jsl.l CODE_9FE089
	inc.b $A5
	inc.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.l $7E3120
	bne CODE_9FD33D
	jsl.l eraser
CODE_9FD33D:
	jsl.l CODE_9FE089
	lda.w printy
	sec
	sbc.w #$000F
	bmi CODE_9FD352
	lda.w #$0001
	tsb.w sflags3
	bra CODE_9FD35A
CODE_9FD352:
	jsl.l CODE_9FA669
	jsl.l CODE_9FE089
CODE_9FD35A:
	jsl.l CODE_9D8000
	dec.w printy
	dec.w printy
	inc.w printx
	lda.w #$0002
	sta.b $B5
	lda.w printx
	pha
CODE_9FD370:
	lda.b $01,s
	sta.w printx
	lda.b $B5
	sta.b $A5
	jsl.l getlchoice
	lda.b $A5
	bmi CODE_9FD3D8
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0008
	bne CODE_9FD397
	lda.b $B5
	cmp.w $17E6,y
	bne CODE_9FD3D5
	lda.w tmline,y
	sta.b $A5
CODE_9FD397:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0004
	sta.b [$8D]
	phx
	ldx.b $B5
	lda.l DATA8_9FD404,x
	plx
	and.w #$00FF
	ora.w #$2000
	ldy.w #$0002
	sta.b [$8D],y
	jsl.l CODE_9EC7BE
	lda.b $A5
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b $8D
	jsl.l CODE_9ECFC6
	pla
	sta.b $A5
	jsl.l CODE_9FDFA6
CODE_9FD3D5:
	dec.w printy
CODE_9FD3D8:
	dec.b $B5
	bpl CODE_9FD370
	pla
	clc
	adc.w #$0005
	sta.w printx
	ldy.b $91
	lda.w HomeTeam,y
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0004
	clc
	adc.b [$8D],y
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	jml.l CODE_9EC7BE
DATA8_9FD404:
	db "YBA"
setpersonel:
	stx.b $87
	ldx.w #$0000
CODE_9FD40C:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0018
	bne CODE_9FD40C
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FD41D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FD41D
	ldx.b $87
	ldy.b $91
	ldx.w tmsort,y
	stx.b $95
	lda.w #$0005
	sta.b $B5
CODE_9FD435:
	lda.w #$FFFF
	sta.w newpos,x
	sta.w newpnum,x
	inx
	inx
	stx.b $95
	dec.b $B5
	bpl CODE_9FD435
	jsl.l SetPlList
	lda.w #$0005
	sta.b $B5
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
CODE_9FD459:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B9
	beq CODE_9FD4BE
	dec.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.b $91
	ldx.w tmsort,y
	dex
	dex
CODE_9FD472:
	inx
	inx
	stx.b $95
	lda.w pnum,x
	and.w #$00FF
	sta.b $C5
	lda.b $B9
	and.w #$00FF
	cmp.b $C5
	beq CODE_9FD48D
	dec.b $B1
	bpl CODE_9FD472
	bra CODE_9FD4BE
CODE_9FD48D:
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4A1
	ora.w #$FF00
CODE_9FD4A1:
	sta.w newpos,x
	lda.b $B9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD4B1
	ora.w #$FF00
CODE_9FD4B1:
	sta.w newpnum,x
	ldy.b $B5
	sep #$20
	lda.b #$00
	sta.b [$99],y
	rep #$20
CODE_9FD4BE:
	dec.b $B5
	bpl CODE_9FD459
	lda.w #$0005
	sta.b $B5
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
CODE_9FD4D1:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B9
	beq CODE_9FD53A
	dec.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.b $91
	ldx.w tmsort,y
	dex
	dex
CODE_9FD4EA:
	inx
	inx
	stx.b $95
	lda.w newpnum,x
	bit.w #$0080
	bne CODE_9FD4FC
	dec.b $B1
	bpl CODE_9FD4EA
	bra CODE_9FD4FE
CODE_9FD4FC:
	stx.b $89
CODE_9FD4FE:
	lda.w position,x
	bpl CODE_9FD507
	dec.b $B1
	bpl CODE_9FD4EA
CODE_9FD507:
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD51B
	ora.w #$FF00
CODE_9FD51B:
	ldy.b $89
	sta.w newpos,y
	lda.b $B9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD52D
	ora.w #$FF00
CODE_9FD52D:
	sta.w newpnum,y
	ldy.b $B5
	sep #$20
	lda.b #$00
	sta.b [$99],y
	rep #$20
CODE_9FD53A:
	dec.b $B5
	bpl CODE_9FD4D1
	stx.b $87
	ldx.w #$0012
CODE_9FD543:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FD543
	ldx.b $87
	stx.b $87
	ldx.w #$0016
CODE_9FD551:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FD551
	ldx.b $87
	ldx.b $95
	rtl
SetPlList:
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
	lda.w #$0000
	sta.b [$99]
	ldy.w #$0002
	sta.b [$99],y
	ldy.w #$0004
	sta.b [$99],y
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	lda.w $1E9B
	beq CODE_9FD59A
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B7
	sta.b $89
	lda.b $91
	cmp.w $1E91
	bne CODE_9FD5A3
	inc.b $89
	bra CODE_9FD5A3
CODE_9FD59A:
	ldy.b $91
	lda.w tmgoalie,y
	bpl CODE_9FD5A3
	inc.b $89
CODE_9FD5A3:
	lda.b $97
	pha
	lda.b $95
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	pla
	sta.b $95
	pla
	sta.b $97
	ldy.b $91
	lda.w tmline,y
	asl a
	asl a
	asl a
	sta.b $A5
	adc.b $8D
	sta.b $8D
	lda.w tmap,y
	sta.b $B5
	bra CODE_9FD61C
CODE_9FD5D0:
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	sta.b $B9
	tay
	sep #$20
	lda.b [$8D],y
	ldy.b $B5
	sta.b [$99],y
	lda.b $B9
	beq CODE_9FD5F1
	lda.w $1E9B
	beq CODE_9FD5F1
	lda.w $1E8F
	inc a
	sta.b [$99],y
CODE_9FD5F1:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $B9
	sta.b [$99],y
	rep #$20
	lda.b $B9
	bne CODE_9FD61C
	ldy.b $91
	lda.w tmgoalie,y
	inc a
	sta.b $B1
	bne CODE_9FD612
	lda.w $1E9B
	beq CODE_9FD612
	inc.b $B1
CODE_9FD612:
	ldy.b $B5
	sep #$20
	lda.b $B1
	sta.b [$99],y
	rep #$20
CODE_9FD61C:
	dec.b $B5
	bpl CODE_9FD5D0
	lda.w #$0005
	sta.b $B5
CODE_9FD625:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B1
	bne CODE_9FD633
	jmp.w $D6B8
CODE_9FD633:
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD63E
	ora.w #$FF00
CODE_9FD63E:
	dec a
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FD649
	lda.w #$0034
CODE_9FD649:
	clc
	adc.b $B1
	tay
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FD661
	cmp.w #$FFFC
	beq CODE_9FD661
	lda.w tmpdst,y
	bmi CODE_9FD6B8
	beq CODE_9FD6B8
CODE_9FD661:
	lda.b $97
	pha
	lda.b $95
	pha
	jsl.l CODE_9B9320
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	pla
	sta.b $95
	pla
	sta.b $97
	lda.b $B5
	clc
	adc.w #$0006
	tay
	lda.b [$99],y
	and.w #$00FF
	asl a
	sta.b $A5
	lda.w #$0080
	sta.b $8B
	lda.w #$D646
	sta.b $89
	ldy.b $A5
	lda.b [$89],y
	clc
	adc.b $89
	sta.b $89
CODE_9FD69B:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9FD6C0
	ldy.b $A5
	lda.b [$8D],y
	and.w #$00FF
	sta.b $A5
	jsl.l TryAddPlayerToList
	beq CODE_9FD69B
CODE_9FD6B8:
	dec.b $B5
	bmi CODE_9FD6BF
	jmp.w $D625
CODE_9FD6BF:
	rtl
CODE_9FD6C0:
	jsl.l GetPlayerCount
	lda.b $A5
	sta.b $B1
CODE_9FD6C8:
	lda.b $B1
	sta.b $A5
	dec.b $B1
	bmi CODE_9FD6B8
	jsl.l TryAddPlayerToList
	beq CODE_9FD6C8
	bra CODE_9FD6B8
TryAddPlayerToList:
	lda.b $A5
	sta.b $A9
	dec.b $A5
	asl.b $A5
	lda.b $91
	beq CODE_9FD6E7
	lda.w #$0034
CODE_9FD6E7:
	adc.b $A5
	tay
	lda.w tmpdst,y
	sec
	sbc.w #$0000
	beq CODE_9FD6F5
	bpl CODE_9FD72D
CODE_9FD6F5:
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FD72D
	cmp.w #$FFFC
	beq CODE_9FD72D
	lda.w #$0005
	sta.b $A5
CODE_9FD707:
	ldy.b $A5
	lda.b [$99],y
	and.w #$00FF
	sta.b $C5
	lda.b $A9
	and.w #$00FF
	cmp.b $C5
	beq CODE_9FD72D
	dec.b $A5
	bpl CODE_9FD707
	ldy.b $B5
	sep #$20
	lda.b $A9
	sta.b [$99],y
	rep #$20
	lda.b $A9
	and.w #$00FF
	rtl
CODE_9FD72D:
	lda.w #$0000
	sta.b $A9
	rtl
CODE_9FD733:
	lda.b $A9
	pha
	stz.b $91
	lda.w pfteam,x
	beq CODE_9FD741
	inc.b $91
	inc.b $91
CODE_9FD741:
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0001
	beq CODE_9FD75F
	and.w #$FFFE
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FDE13
	jsl.l CODE_9FD325
CODE_9FD75F:
	pla
	sta.b $A9
	stz.b $AD
	bit.w #$4000
	bne CODE_9FD7AF
	inc.b $AD
	bit.w #$8000
	bne CODE_9FD7AF
	inc.b $AD
	bit.w #$0080
	bne CODE_9FD7AF
	bit.w #$2000
	bne CODE_9FD78E
	lda.w pflags,x
	bit.w #$0008
	beq CODE_9FD78D
	lda.w $14E3,x
	bne CODE_9FD78D
	jml.l CODE_9EA8A9
CODE_9FD78D:
	rtl
CODE_9FD78E:
	lda.w pflags,x
	ora.w #$0008
	sta.w pflags,x
	jsl.l CODE_9FC757
	ldy.b $91
	lda.w tmflags,y
	and.w #$FFF7
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w $1D55,y
	jmp.w $DE13
CODE_9FD7AF:
	jmp.w $E001
getlchoice:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $91
	eor.w #$0002
	tay
	lda.w tmap,y
	ldy.b $91
	sec
	sbc.w tmap,y
	sta.b $AD
	beq CODE_9FD7E5
	lda.b $A5
	clc
	adc.w #$0015
	sta.b $A5
	lda.b $AD
	bmi CODE_9FD7E5
	lda.b $A5
	clc
	adc.w #$0015
	sta.b $A5
CODE_9FD7E5:
	ldy.b $91
	lda.w tmline,y
	sta.b $A9
	lda.b $A5
	clc
	adc.b $A9
	clc
	adc.b $A9
	clc
	adc.b $A9
	sta.b $A5
	tay
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FD820
	sta.b $89
	lda.b [$89],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD811
	ora.w #$FF00
CODE_9FD811:
	sta.b $A5
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	rtl
DATA8_9FD820:
	db $00,$01,$02,$01,$02,$00,$02,$00,$01,$00,$01,$02,$00,$01,$02,$00
	db $01,$02,$00,$01,$02,$03,$04,$FF,$03,$04,$FF,$03,$04,$FF,$03,$04
	db $FF,$04,$03,$FF,$03,$04,$FF,$03,$04,$FF,$05,$06,$FF,$05,$06,$FF
	db $05,$06,$FF,$05,$06,$FF,$05,$06,$FF,$05,$06,$FF,$06,$05,$FF
	lda.w $1003,x
	cmp.w #$0064
	bne CODE_9FD86A
	jmp.w $D96E
CODE_9FD86A:
	jsl.l CODE_9FDC4C
	lda.w pflags,x
	bit.w #$4000
	beq CODE_9FD87A
CODE_9FD876:
	jml.l CODE_9E8BE6
CODE_9FD87A:
	bit.w #$0002
	beq CODE_9FD8AB
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$0050
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9FD89D
	lda.w #$FFB0
	sta.b $A5
CODE_9FD89D:
	lda.b $A5
	sta.w $1063,x
	lda.w #$FF70
	sta.w $1043,x
	stz.w $1003,x
CODE_9FD8AB:
	lda.w newpnum,x
	cmp.w pnum,x
	bne CODE_9FD8B6
CODE_9FD8B3:
	jmp.w $D9C2
CODE_9FD8B6:
	lda.w position,x
	bne CODE_9FD8C4
	lda.w $0B05,x
	ora.w #$0003
	sta.w $0B05,x
CODE_9FD8C4:
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bmi CODE_9FD8D2
	jmp.w $D99D
CODE_9FD8D2:
	lda.w $1003,x
	adc.w #$0008
	sta.w $1003,x
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	bit.w #$8000
	beq CODE_9FD8EB
CODE_9FD8E7:
	eor.w #$FFFF
	inc a
CODE_9FD8EB:
	cmp.w #$0029
	bcc CODE_9FD8F3
	jmp.w $D99D
CODE_9FD8F3:
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b $A5
	sec
	sbc.w #$0020
	beq CODE_9FD907
	bmi CODE_9FD907
	jmp.w $D99D
CODE_9FD907:
	lda.w #$EA1A
	ldy.w position,x
	bne CODE_9FD912
	lda.w #$E0FE
CODE_9FD912:
	jsl.l CODE_9EA3F1
	lda.w #$0001
	sta.w $1563,x
	lda.w $1163,x
	cmp.w #$0004
	beq CODE_9FD92B
	inc a
	and.w #$0007
	sta.w $1163,x
CODE_9FD92B:
	stz.w $0EE3,x
	lda.w #$F800
	sta.w $0EC3,x
	lda.b $A5
	sec
	sbc.w #$0010
	beq CODE_9FD93E
	bpl CODE_9FD96D
CODE_9FD93E:
	stz.w $0EC3,x
	lda.w $1163,x
	cmp.w #$0004
	bne CODE_9FD96D
	lda.w #$F800
	sta.w $0EC3,x
	lda.w #$0002
	sta.w $1163,x
	lda.w #$E936
	ldy.w position,x
	bne CODE_9FD960
	lda.w #$E484
CODE_9FD960:
	jsl.l CODE_9EA3F1
	lda.w #$0064
	sta.w $1003,x
	sta.w $14E3,x
CODE_9FD96D:
	rtl
CODE_9FD96E:
	lda.w pnum,x
	asl a
	sta.b $A5
	stz.b $89
	lda.w pfteam,x
	beq CODE_9FD980
	lda.w #$0002
	sta.b $89
CODE_9FD980:
	lda.b $89
	beq CODE_9FD987
	lda.w #$0034
CODE_9FD987:
	clc
	adc.b $A5
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b $B1
	jsl.l CODE_9FD9CB
	jmp.w $CEF6
CODE_9FD99D:
	lda.w $1563,x
	bne CODE_9FD96D
	lda.w pflags,x
	bit.w #$4008
	bne CODE_9FD96D
	lda.w $1043,x
	sta.b $A5
	lda.w $1063,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	jml.l CODE_9EA5A4
CODE_9FD9C2:
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
CODE_9FD9CB:
	lda.w newpos,x
	sta.b $A5
	sta.w position,x
	jsl.l Setplass
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	rtl
	lda.w $14E3,x
	bne CODE_9FDA33
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9FDA34
	and.w #$FFFD
	sta.w pflags,x
	stz.w $0EC3,x
	stz.w $0EE3,x
	stz.w $0B05,x
	txa
	lsr a
	sec
	sbc.w #$0006
	bmi CODE_9FDA06
	inc a
CODE_9FDA06:
	phx
	tax
	lda.w #$000E
	jsl.l CODE_808FC9
	plx
	lda.b $08
	sta.w Ypos,x
	lda.w #$FF78
	sta.w Xpos,x
	lda.w #$0002
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #$E8F4
	ldy.w position,x
	bne CODE_9FDA2F
CODE_9FDA2C:
	lda.w #$E452
CODE_9FDA2F:
	jml.l CODE_9EA403
CODE_9FDA33:
	rtl
CODE_9FDA34:
	lda.w #$0004
	sta.w $1163,x
	lda.w pflags,x
	and.w #$6FFF
	sta.w pflags,x
	stz.w $1563,x
	stz.w SPA,x
	lda.w #$1000
	sta.w $0EC3,x
	jml.l CODE_9E8BE6
CODE_9FDA53:
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
	lda.w #$0003
	sta.b $A5
	ldy.b $91
	lda.w tmap,y
	ldy.b $8D
	cmp.w tmap,y
	beq CODE_9FDABF
	bpl CODE_9FDA82
	inc.b $A5
	inc.b $A5
CODE_9FDA82:
	lda.b $A5
	pha
	jsl.l CODE_9FDF0C
	lda.b $A5
	sta.b $A9
	lda.b $01,s
	inc a
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A9
	sec
	sbc.b $A5
	bpl CODE_9FDAA0
	pla
	inc a
	pha
CODE_9FDAA0:
	pla
	ldy.b $91
	sta.w tmline,y
CODE_9FDAA6:
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
	rtl
CODE_9FDABF:
	ldy.b $91
	beq CODE_9FDAC6
	jmp.w $DB5E
CODE_9FDAC6:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FDAD7
	lda.w $19EC,y
	bmi CODE_9FDAD7
	jmp.w $DB5E
CODE_9FDAD7:
	lda.w #$0002
	sta.b $A9
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDB34
	sta.b $89
	lda.w gsp
	cmp.w #$0002
	bne CODE_9FDB10
	lda.w $178E,y
	ldy.b $8D
	cmp.w $178E,y
	beq CODE_9FDB10
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DB42
	sta.b $89
	plp
	bpl CODE_9FDB10
	lda.w #$009F
	sta.b $8B
	lda.w #$DB50
	sta.b $89
CODE_9FDB10:
	ldy.b $8D
	lda.w tmline,y
	asl a
	sta.b $A9
	tay
	lda.b [$89],y
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A5
	cmp.w #$0C01
	bcc CODE_9FDB5E
	ldy.b $A9
	lda.b [$89],y
	ldy.b $91
	sta.w tmline,y
	jmp.w $DAA6
DATA8_9FDB34:
	dw 0,1,2,0,1,0,1
	dw 2,0,1,2,0,2,0
	dw 0,1,0,0,1,0,1
CODE_9FDB5E:
	lda.w #$0002
	sta.b $A9
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDBBE
	sta.b $89
	lda.w gsp
	cmp.w #$0002
	bne CODE_9FDB99
	ldy.b $91
	lda.w $178E,y
	ldy.b $8D
	cmp.w $178E,y
	beq CODE_9FDB99
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DBC4
	sta.b $89
	plp
	bpl CODE_9FDB99
	lda.w #$009F
	sta.b $8B
	lda.w #$DBCA
	sta.b $89
CODE_9FDB99:
	lda.b [$89]
	inc.b $89
	inc.b $89
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A5
	cmp.w #$0F34
	bcs CODE_9FDBB0
	dec.b $A9
	bpl CODE_9FDB99
CODE_9FDBB0:
	dec.b $89
	dec.b $89
	ldy.b $91
	lda.b [$89]
	sta.w tmline,y
	jmp.w $DAA6
DATA8_9FDBBE:
	dw 0,1,2,0,2,1,0,1,0
CODE_9FDBD0:
	lda.l $7E34C6
	cmp.w #$0002
	beq CODE_9FDC4B
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,x
	bne CODE_9FDBEB
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9FDBEB:
	lda.b $A5
	bmi CODE_9FDC4B
	sec
	sbc.w #$0058
	bpl CODE_9FDC4B
	lda.w $0792
	and.w #$0003
	bne CODE_9FDC4B
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FDC09
	ldy.w #$0002
CODE_9FDC09:
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FDC4B
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w pfteam,x
	beq CODE_9FDC25
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9FDC25:
	jsl.l CODE_9FDD19
	lda.b $A5
	cmp.w #$0C01
	bcs CODE_9FDC4B
	lda.w $163A
	bne CODE_9FDC4B
	lda.l $7E34C6
	beq CODE_9FDC4B
	jsl.l CODE_9FDA53
	jsl.l setpersonel
	jsl.l CODE_9F9B36
	jml.l CODE_9EE10B
CODE_9FDC4B:
	rtl
CODE_9FDC4C:
	lda.w pflags,x
	bit.w #$4000
	bne CODE_9FDC8E
	lda.w newpos,x
	bpl CODE_9FDC5E
	lda.w newpnum,x
	bmi CODE_9FDC8E
CODE_9FDC5E:
	lda.w newpnum,x
	cmp.w pnum,x
	beq CODE_9FDC8F
	lda.w $0B7D,x
	cmp.w #$000C
	beq CODE_9FDC8E
	cpx.w $0AD9
	beq CODE_9FDC8E
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	ora.w #$1000
	sta.w pflags,x
	stz.w $1003,x
	lda.w #$000C
	sta.b $A5
	jml.l CODE_9E8C18
CODE_9FDC8E:
	rtl
CODE_9FDC8F:
	sep #$20
	pla
	rep #$30
	pla
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w $1563,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w position
	sta.b $A5
	jmp.w $CED0
CODE_9FDCB2:
	lda.w pnum,x
	and.w #$00FF
	asl a
	sta.b $A9
	lda.w pfteam,x
	beq CODE_9FDCC3
	lda.w #$0002
CODE_9FDCC3:
	sta.b $91
	beq CODE_9FDCCA
	lda.w #$0034
CODE_9FDCCA:
	adc.b $A9
	tay
	lda.w tmpde,y
	sta.b $A5
	rtl
setpde:
	lda.b $91
	beq CODE_9FDCDA
	lda.w #$0034
CODE_9FDCDA:
	clc
	adc.b $A9
	tay
	lda.b $A5
	bpl CODE_9FDCE7
	lda.w #$0000
	sta.b $A5
CODE_9FDCE7:
	sta.w tmpde,y
	rtl
CODE_9FDCEB:
	pha
	lda.b $A9
	pha
	lda.b $91
	pha
	ldx.b $89
	jsl.l CODE_9FDCB2
	pla
	sta.b $91
	pla
	sta.b $A9
	pla
	ldx.b $A5
	jsl.l Mul16S
	lda.b $0A
	asl.b $08
	rol a
	asl.b $08
	rol a
	asl.b $08
	rol a
	asl.b $08
	rol a
	sta.b $A5
	ldx.b $95
	clc
	rtl
CODE_9FDD19:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $B1
	pha
	lda.b $B3
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	stz.b $A5
	stz.b $A9
	lda.w #$0005
	sta.b $AD
	sta.b $AD
	ldy.b $91
	lda.w tmsort,y
	sta.b $89
CODE_9FDD43:
	ldy.b $89
	lda.w position,y
	beq CODE_9FDD68
	bmi CODE_9FDD68
	lda.w pnum,y
	and.w #$00FF
	asl a
	sta.b $B1
	lda.b $91
	beq CODE_9FDD5C
	lda.w #$0034
CODE_9FDD5C:
	adc.b $B1
	tay
	lda.w tmpde,y
	adc.b $A5
	sta.b $A5
	inc.b $A9
CODE_9FDD68:
	inc.b $89
	inc.b $89
	dec.b $AD
	bpl CODE_9FDD43
	lda.b $A9
	beq CODE_9FDD84
	sta.b $04
	phx
	lda.b $A5
	sta.b $08
	jsl.l Div16U
	lda.b $00
	sta.b $A5
	plx
CODE_9FDD84:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $B3
	pla
	sta.b $B1
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	rtl
reenergizeteam:
	lda.w #$0032
	sta.b $A5
CODE_9FDDA2:
	lda.b $91
	beq CODE_9FDDA9
	lda.w #$0034
CODE_9FDDA9:
	clc
	adc.b $A5
	tay
	lda.w #$1000
	sta.w tmpde,y
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne CODE_9FDDC6
	cmp.w #$FFFC
	bne CODE_9FDDC6
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9FDDC6:
	dec.b $A5
	dec.b $A5
	bpl CODE_9FDDA2
	rtl
CODE_9FDDCD:
	lda.l $7E34C6
	beq CODE_9FDE12
	stz.b $91
	jsl.l CODE_9FDDDE
	lda.w #$0002
	sta.b $91
CODE_9FDDDE:
	lda.w #$0032
	sta.b $A5
CODE_9FDDE3:
	lda.b $91
	beq CODE_9FDDEA
	lda.w #$0034
CODE_9FDDEA:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	cmp.w #$FFFE
	bne CODE_9FDE0C
	lda.w tmpde,y
	clc
	adc.w #$000A
	sta.w tmpde,y
	sec
	sbc.w #$1000
	bmi CODE_9FDE0C
	lda.w #$1000
	sta.w tmpde,y
CODE_9FDE0C:
	dec.b $A5
	dec.b $A5
	bpl CODE_9FDDE3
CODE_9FDE12:
	rtl
CODE_9FDE13:
	jsl.l CODE_9FE089
	lda.w printy
	sec
	sbc.w #$000F
	bmi CODE_9FDE26
	lda.w #$0001
	trb.w sflags3
CODE_9FDE26:
	inc.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.l $7E3120
	bne CODE_9FDE38
	jsl.l eraser
CODE_9FDE38:
	jml.l CODE_9F9B36
CODE_9FDE3C:
	stx.b $87
	ldx.w #$0000
CODE_9FDE41:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FDE41
	ldx.b $87
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$2000
	sta.w $0D0D
	lda.b $A5
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0020
	bcc CODE_9FDE6A
	lda.w #$001F
CODE_9FDE6A:
	sta.b $A5
	ldy.w #$0002
	lda.w #$0006
	sta.w $0A2A
	lda.w #$0003
	sta.b $B1
CODE_9FDE7A:
	lda.w #$FFFF
	sta.b $AD
	lda.b $A5
	bmi CODE_9FDE8F
	sta.b $AD
	cmp.w #$0008
	bcc CODE_9FDE8F
	lda.w #$0007
	sta.b $AD
CODE_9FDE8F:
	lda.b $AD
	sec
	adc.b $A9
	and.w #$00FF
	bne CODE_9FDE9C
	lda.w #$0020
CODE_9FDE9C:
	sta.w $0A2A,y
	iny
	lda.b $A5
	sec
	sbc.w #$0008
	sta.b $A5
	dec.b $B1
	bpl CODE_9FDE7A
	lda.b $A9
	beq CODE_9FDEB6
	lda.w #$0C00
	tsb.w $0D0D
CODE_9FDEB6:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	lda.w #$4000
	tsb.w $0D0D
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	sep #$20
	lda.w $0A2F
	ldy.w $0A2C
	sty.w $0A2F
	sta.w $0A2C
	rep #$30
	lda.w $0A2D
	xba
	sta.w $0A2D
	lda.w #$4000
	trb.w $0D0D
	pla
	sta.b $8F
	pla
	sta.b $8D
	stx.b $87
	ldx.w #$000E
CODE_9FDF02:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FDF02
	ldx.b $87
	rtl
CODE_9FDF0C:
	lda.b $B1
	pha
	lda.b $B3
	pha
	lda.b $B5
	pha
	lda.b $B7
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	ldy.b $91
	lda.w tmdata,y
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	ldy.w #$0006
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b $A5
	asl a
	asl a
	asl a
	adc.b $8D
	sta.b $8D
	stz.b $08
	stz.b $04
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	ldy.b $91
	lda.w tmap,y
	sta.b $B5
	bra CODE_9FDF7F
CODE_9FDF5A:
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	beq CODE_9FDF7F
	tay
	lda.b [$8D],y
	and.w #$00FF
	asl a
	sta.b $B1
	inc.b $04
	lda.b $91
	beq CODE_9FDF75
	lda.w #$0034
CODE_9FDF75:
	adc.b $B1
	tay
	lda.w $17E8,y
	adc.b $08
	sta.b $08
CODE_9FDF7F:
	dec.b $B5
	bpl CODE_9FDF5A
	phx
	jsl.l Div16U
	plx
	lda.b $00
	sta.b $A5
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $B7
	pla
	sta.b $B5
	pla
	sta.b $B3
	pla
	sta.b $B1
	rtl
CODE_9FDFA6:
	jsl.l CODE_9FDF0C
	lda.w $0D0D
	pha
	phx
	lda.w #$3000
	sta.w $0D0D
	lda.b $A5
	cmp.w #$1000
	bcc CODE_9FDFBF
	lda.w #$1000
CODE_9FDFBF:
	sta.b $A5
	tax
	lda.w #$002F
	jsl.l CODE_808F98
	lda.b $0A
	clc
	adc.w #$001D
	sta.w $0A2C
	sta.w $0A2D
	sta.w $0A2E
	sta.w $0A2F
	sta.w $0A30
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	ldx.b $A5
	lda.w #$0054
	jsl.l CODE_808F98
	plx
	lda.b $0A
	inc a
	inc a
	sta.b [$8D]
	jsl.l CODE_9EC7BE
	pla
	sta.w $0D0D
