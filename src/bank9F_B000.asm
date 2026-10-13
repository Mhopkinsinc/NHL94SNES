; Bank $9F, fourth 4 KB: more game flow code, with auto labels for now (it calls the rink loader in bank $9B). DATA8_9FBC01
; holds four words per entry, read field by field; DATA8_9FBD51 and DATA8_9FBD5F are small tables.

org $9FB003
	ldx.b $B5
	lda.w $19D0,x
	beq CODE_9FB02A
	lda.w $1C90,x
	beq CODE_9FB02A
	ldy.w #$0000
CODE_9FB012:
	lda.w $19F6,y
	bmi CODE_9FB01B
	cmp.b $B5
	beq CODE_9FB024
CODE_9FB01B:
	iny
	iny
	cpy.w #$000A
	bcc CODE_9FB012
	bra CODE_9FB02A
CODE_9FB024:
	sty.b $B5
	jsl.l CODE_9FCD2A
CODE_9FB02A:
	plx
	ldy.w $1E91
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9FB046
	sta.w $19BE
CODE_9FB046:
	lda.w $1E8D
	sta.w $0AD9
	tay
	lda.w $1E93
	bmi CODE_9FB055
	sta.w $19D4,y
CODE_9FB055:
	stz.w $163A
	inc.w $163A
	lda.w #$0001
	sta.w $1E9D
	lda.w #$03E8
	sta.w $1E9F
	jsl.l ClearPenaltyBuffer
	rtl
CODE_9FB06C:
	stx.w $0AD9
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	jsl.l assinsert
	inx
	inx
	rtl
CODE_9FB092:
	lda.w #$2400
	sta.b $0C
	stz.b $0E
	lda.w #$0007
	jsl.l CODE_9C9AD0
	lda.w #$0100
	trb.w sflags
	lda.w #$0000
	sta.l $7E3120
	lda.w #$0400
	trb.w sflags
	stz.w $0CA9
	stz.w $15D6
	lda.w #$0010
	tsb.w sflags3
	lda.l $7E3122
	sta.b $B1
	lda.w #$0800
	sta.b $B5
	stz.b $8D
	lda.w #$0010
	sta.b $AD
	lda.l $7E312A
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FB0E5
CODE_9FB0E2:
	ora.w #$FF00
CODE_9FB0E5:
	eor.w #$FFFF
	inc a
	clc
	adc.b $AD
	sta.b $AD
	lda.l $7E312E
	tax
	lda.l DATA8_9FB1F7-1,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FB102
CODE_9FB0FF:
	ora.w #$FF00
CODE_9FB102:
	clc
	adc.b $AD
	sta.b $AD
	jsl.l RandomWord
	and.w #$001F
	inc a
	cmp.b $AD
	bcs CODE_9FB118
	lda.w #$0004
	sta.b $8D
CODE_9FB118:
	ldx.b $8D
	lda.l $7E312C,x
	bit.w #$0800
	beq CODE_9FB12E
	lda.l $7E3124
	sta.b $B1
	lda.w #$F800
	sta.b $B5
CODE_9FB12E:
	lda.b $B1
	bit.w #$0008
	bne CODE_9FB142
	and.w #$0007
	sta.b $A5
	lda.w $0792
	and.w #$0003
	bne CODE_9FB15B
CODE_9FB142:
	lda.w #$0005
	jsl.l CODE_9BB385
	dec a
	dec a
	and.w #$0007
	sta.b $A5
	lda.b $B5
	bmi CODE_9FB15B
	lda.b $A5
	eor.w #$0004
	sta.b $A5
CODE_9FB15B:
	asl.b $A5
	asl.b $A5
	ldx.b $A5
	lda.l DATA8_80DA06,x
	asl a
	asl a
	asl a
	asl a
	asl a
	ldx.b $95
	sta.w $0EC3,x
	ldx.b $A5
	lda.l DATA8_80DA06+2,x
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b $B5
	ldx.b $95
	sta.w $0EE3,x
	lda.w #$0004
	ldy.w #$0000
	jsr.w $B1DE
	bmi CODE_9FB1B1
	lda.w puckvy
	bpl CODE_9FB1A4
	lda.w pfgoal,y
	bne CODE_9FB1A9
CODE_9FB197:
	lda.w #$0004
	ldy.w #$000C
	jsr.w $B1DE
	bmi CODE_9FB1B1
	bra CODE_9FB1A9
CODE_9FB1A4:
	lda.w pfgoal,y
	bne CODE_9FB197
CODE_9FB1A9:
	sty.b $91
	ldx.b $95
	jsl.l a2touchpuck
CODE_9FB1B1:
	lda.w tmflags
	and.w #$FFFB
	sta.w tmflags
	lda.w $17E0
	and.w #$FFFB
	sta.w $17E0
	ldx.b $95
	jsl.l RandomWord
	and.w #$07FF
	sta.w $0E01
	stz.w $0DF9
	stz.w $1563,x
	lda.w #$0018
	sta.b $A5
	jml.l CODE_9E8C18
CODE_9FB1DE:
	pha
	lda.w #$0006
	sta.b $A5
	pla
CODE_9FB1E5:
	cmp.w position,y
	beq CODE_9FB1F3
	iny
	iny
	dec.b $A5
	bne CODE_9FB1E5
	ldy.w #$FFFF
CODE_9FB1F3:
	cpy.w #$0000
	rts
DATA8_9FB1F7:
	db $00,$08,$10,$00,$08,$10
CODE_9FB1FD:
	lda.w sfhormode
	bne CODE_9FB269
	lda.w $1E9B
	bne CODE_9FB269
	lda.w sflags
	bit.w #$0100
	beq CODE_9FB269
	bit.w #$0800
	bne CODE_9FB269
	stz.w $0CD3
	lda.w #$3000
	sta.w $0CCB
	ldx.w #$0000
CODE_9FB220:
	lda.l $7E3126
	sta.w $0CCF
	lda.l $7E3128
	sta.w $0CD1
	lda.l $7E312A,x
	clc
	adc.w #$01A6
	sta.w $0CCD
	lda.l $7E312C,x
	and.w #$0800
	sta.w $0CC5
	lda.w #$0000
	cpx.w #$0004
	bne CODE_9FB24E
	lda.w #$0200
CODE_9FB24E:
	ora.w $0CCB
	sta.w $0CC9
	phx
	jsl.l CODE_9BBFB9
	plx
	inx
	inx
	inx
	inx
	cpx.w #$000C
	bne CODE_9FB220
	lda.w #$2000
	sta.w $0CCB
CODE_9FB269:
	rtl
	lda.w $14E3,x
	bne CODE_9FB27B
	lda.w sflags
	bit.w #$0100
	bne CODE_9FB27B
	jml.l CODE_9E8BE6
CODE_9FB27B:
	rtl
	lda.w $14E3,x
	beq CODE_9FB284
CODE_9FB281:
	jmp.w $B304
CODE_9FB284:
	lda.w sflags
	bit.w #$0100
	beq CODE_9FB305
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9FB29D
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
CODE_9FB29D:
	lda.w #$007E
	sta.b $8B
	lda.w #$312A
	sta.b $89
	lda.w pfteam,x
	beq CODE_9FB2B1
	lda.w #$312E
	sta.b $89
CODE_9FB2B1:
	lda.w SPAnum,x
	lsr a
	lsr a
	inc a
	sta.b $A5
	lda.w $14A3,x
	bne CODE_9FB2C4
	inc.b $A5
	inc.b $A5
	inc.b $A5
CODE_9FB2C4:
	lda.b $A5
	sta.b [$89]
	lda.w $19D4,x
	bpl CODE_9FB304
	lda.w $1543,x
	pha
	lda.w #$0001
	sta.w $1543,x
	pla
	cmp.w #$0000
	bne CODE_9FB304
	lda.w #$F600
	sta.b $A9
	lda.w $101F
	cmp.w #$0011
	bcc CODE_9FB2FA
	jsl.l RandomWord
	and.w #$0007
	sta.b $A5
	beq CODE_9FB2FA
	lda.w #$F62A
	sta.b $A9
CODE_9FB2FA:
	lda.w #$0001
	sta.w $1543,x
	jml.l SetSPA
CODE_9FB304:
	rtl
CODE_9FB305:
	lda.w #$0014
	sta.w $1203,x
	jml.l CODE_9E8BE6
CODE_9FB30F:
	lda.w $0B7D,x
	cmp.w #$0017
	bne CODE_9FB354
	lda.w #$007E
	sta.b $8B
	lda.w #$3122
	sta.b $89
	lda.w pfgoal,x
	beq CODE_9FB330
	lda.w #$007E
	sta.b $8B
	lda.w #$3124
	sta.b $89
CODE_9FB330:
	lda.b $A5
	sta.b [$89]
	lda.w $1543,x
	bne CODE_9FB354
	lda.b $A9
	bit.w #$8000
	beq CODE_9FB34D
	lda.w #$0001
	sta.w $1543,x
	lda.w #$F600
	jml.l CODE_9EA3F1
CODE_9FB34D:
	lda.w #$F62A
	jml.l CODE_9EA3F1
CODE_9FB354:
	rtl
	stz.w $19C0
	lda.w $1D81
	beq CODE_9FB366
	lda.w $1D83
	beq CODE_9FB366
	inc.w $1D87
	rtl
CODE_9FB366:
	lda.w #$FFFF
	sta.w $0AD9
	jsl.l CODE_9EDCC3
	lda.w pflags,x
	bit.w #$0002
	bne CODE_9FB37B
CODE_9FB378:
	jmp.w $B518
CODE_9FB37B:
	and.w #$FFFD
	sta.w pflags,x
	lda.w $1632
	bne CODE_9FB38A
CODE_9FB386:
	jml.l CODE_9F8CB1
CODE_9FB38A:
	lda.w gmode
	bit.w #$0040
	beq CODE_9FB396
CODE_9FB392:
	jml.l CODE_9F8CB1
CODE_9FB396:
	lda.w gsp
	cmp.w #$0003
	bne CODE_9FB3AA
CODE_9FB39E:
	lda.w $178E
	cmp.w $1790
	beq CODE_9FB3AA
	jml.l CODE_9F8B79
CODE_9FB3AA:
	lda.w gmode
	bit.w #$0008
	beq CODE_9FB3B6
CODE_9FB3B2:
	jml.l CODE_9EB2C9
CODE_9FB3B6:
	jsl.l CODE_9ED0FD
	lda.w #$FFFF
	sta.w $1003,x
	sta.w $1023,x
	lda.l $7E34C6
	bne CODE_9FB3CC
	jmp.w $B518
CODE_9FB3CC:
	lda.w $1E9B
	ora.w $1E9D
	beq CODE_9FB3D7
	jmp.w $B518
CODE_9FB3D7:
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	lda.w #$0008
	trb.w tmflags
	trb.w $17E0
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9FB409
	lda.w sfhormode
	beq CODE_9FB409
	lda.w #$0040
	tsb.w sflags
	jsl.l CODE_9FB9A4
CODE_9FB409:
	lda.l $7E344E
	bne CODE_9FB41F
	lda.w $19D0
	beq CODE_9FB41F
	jsl.l CODE_9FB5E5
	lsr a
	sta.b $A5
	jsl.l CODE_9FB48B
CODE_9FB41F:
	lda.l $7E344E
	bne CODE_9FB435
	lda.w $19D2
	beq CODE_9FB435
	jsl.l CODE_9FB5F3
	lsr a
	sta.b $A5
	jsl.l CODE_9FB4A2
CODE_9FB435:
	lda.w #$0000
	sta.l $7E344E
	stz.b $8D
	lda.w #$0002
	sta.b $91
	sta.b $A5
	jsl.l CODE_9FB44C
	jmp.w $B518
CODE_9FB44C:
	lda.l $7E34C6
	bne CODE_9FB455
	jmp.w $B517
CODE_9FB455:
	lda.b $A5
	cmp.w $1C84
	bne CODE_9FB45F
	jmp.w $B517
CODE_9FB45F:
	cmp.w $1C86
	bne CODE_9FB467
	jmp.w $B517
CODE_9FB467:
	cmp.w $1C88
	bne CODE_9FB46F
	jmp.w $B517
CODE_9FB46F:
	cmp.w $1C8A
	bne CODE_9FB477
	jmp.w $B517
CODE_9FB477:
	cmp.w $1C8C
	bne CODE_9FB47F
	jmp.w $B517
CODE_9FB47F:
	jsl.l CODE_9FDA53
	jsl.l setpersonel
	jml.l CODE_9F9B36
CODE_9FB48B:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FB4B6
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w #$0001
	sta.b $A5
	bra CODE_9FB47F
CODE_9FB4A2:
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9FB4B6
	stz.b $8D
	lda.w #$0002
	sta.b $91
	sta.b $A5
	bra CODE_9FB47F
CODE_9FB4B6:
	ldy.b $95
	sty.b $91
	lda.b $A5
	asl a
	sta.b $A5
	sta.b $95
	tax
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB4CE
	ldy.w #$0002
CODE_9FB4CE:
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FD2FE
	ply
	sty.b $91
	ldx.b $95
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB4E9
	ldy.w #$0002
CODE_9FB4E9:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq CODE_9FB50F
	lda.w pfteam,x
	beq CODE_9FB504
	lda.w #$0168
	sta.w $1023,y
	txa
	lsr a
	sta.w $1063,y
	bra CODE_9FB50F
CODE_9FB504:
	lda.w #$0258
	sta.w $1003,y
	txa
	lsr a
	sta.w $1043,y
CODE_9FB50F:
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
CODE_9FB517:
	rtl
CODE_9FB518:
	stz.w $1E9D
	stz.b $A5
	jsl.l CODE_9FB54F
	lda.w #$0020
	sta.b $A5
	jsl.l CODE_9FB54F
	ldx.b $95
	lda.w $1003,x
	bpl CODE_9FB517
	lda.w $1023,x
	bpl CODE_9FB517
	stz.b $91
	lda.w #$0001
	sta.b $A5
	inc a
	sta.b $8D
	jsl.l CODE_9FB44C
	lda.w #$001C
	sta.b $A5
	ldx.b $95
	jml.l CODE_9E8C18
CODE_9FB54F:
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w $1003,y
	bmi CODE_9FB517
CODE_9FB55A:
	lda.w $1043,y
	asl a
	sta.b $A9
	tay
	stz.b $89
	stz.b $91
	lda.w pfteam,y
	beq CODE_9FB56F
	lda.w #$0002
	sta.b $91
CODE_9FB56F:
	phy
	ldy.b $91
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FB58F
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w $1003,y
	ora.w #$FF00
	sta.w $1003,y
	ldx.b $95
	jmp.w $D325
CODE_9FB58F:
	lda.b $95
	clc
	adc.b $A5
	tay
	lda.w $1003,y
	sec
	sbc.b $C1
	sta.w $1003,y
	bmi CODE_9FB5A3
	jmp.w $B517
CODE_9FB5A3:
	ldx.b $95
	phx
	ldx.b $A9
	stx.b $95
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq CODE_9FB5B6
	ldy.w #$0002
CODE_9FB5B6:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq CODE_9FB5C9
	stz.b $AD
	jsl.l lcfound
	jsl.l CODE_9FD325
CODE_9FB5C9:
	plx
	stx.b $95
	rtl
CODE_9FB5CD:
	ldy.w #$0000
CODE_9FB5D0:
	lda.w $19F6,y
	cmp.b $91
	beq CODE_9FB5E3
	iny
	iny
	cpy.w #$000A
	bcc CODE_9FB5D0
	lda.w #$FFFF
	bra CODE_9FB5E4
CODE_9FB5E3:
	tya
CODE_9FB5E4:
	rtl
CODE_9FB5E5:
	lda.w #$0000
	sta.b $91
	jsl.l CODE_9FB5CD
	tay
	lda.w $19EC,y
	rtl
CODE_9FB5F3:
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9FB5CD
	tay
	lda.w $19EC,y
	rtl
CODE_9FB601:
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
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9FB623:
	lda.b [$89]
	jsl.l CODE_9FB64A
	inc.b $89
	inc.b $89
	lda.b [$89]
	bne CODE_9FB623
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
	rtl
CODE_9FB64A:
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9FB69D
	lda.b [$89]
	xba
	and.w #$007F
	asl a
	tay
	lda.w #$0058
	sta.b $A9
	lda.w pfgoal,y
	bne CODE_9FB678
	lda.w #$FFA8
	sta.b $A9
	cmp.l $7E3138
	bmi CODE_9FB69D
	lda.w #$FFBF
	sta.l $7E3138
	bra CODE_9FB687
CODE_9FB678:
	lda.b $A9
	cmp.l $7E3138
	bpl CODE_9FB69D
	lda.w #$0041
	sta.l $7E3138
CODE_9FB687:
	lda.w #$0046
	sta.b $A5
	lda.l $7E3136
	bpl CODE_9FB697
	lda.w #$FFBA
	sta.b $A5
CODE_9FB697:
	lda.b $A5
	sta.l $7E3136
CODE_9FB69D:
	rtl
CODE_9FB69E:
	lda.w $0AD3
	bne CODE_9FB69E
	jsl.l CODE_8086A9
	lda.w #$FF00
	sta.l $7E35AA
	lda.w #$0000
	sta.l $7E35AC
	sep #$20
	lda.b #$03
	sta.w OBSEL
	lda.b #$01
	sta.w BGMODE
	lda.b #$00
	sta.w BG1SC
	lda.b #$05
	sta.w BG2SC
	lda.b #$12
	sta.w BG12NBA
	lda.b #$13
	sta.w TM
	rep #$30
	ldx.w #$00FE
CODE_9FB6DA:
	lda.l $9AD0B6,x
	sta.l $7E35F4,x
	sta.l $7E36F4,x
	dex
	dex
	bpl CODE_9FB6DA
	jsl.l CODE_9C9786
CODE_9FB6EE:
	lda.w $07F9
	bne CODE_9FB6EE
	jsl.l CODE_9C98DF
	lda.w #$0081
	sta.b $0E
	lda.w #IceRinkTiles
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
	sta.l $7E35B8
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l CODE_80891F
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
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35BA
	sta.l $7E35B0
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC98B
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35B0
	sta.l $7E35C8
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$0095
	sta.b $0E
	lda.w #DATA8_95E304
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35C8
	sta.l $7E35CA
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$0095
	sta.b $0E
	lda.w #DATA8_95BA96
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35CA
	sta.l $7E35D0
	inc a
	sta.l $7E35B6
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$0000
	ldy.w #$FFFF
	ldx.w #$0020
	jsl.l CODE_8087EA
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	adc.l $7E35B6
	sta.l $7E35BC
	adc.w #$0004
	sta.l $7E35AE
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D0
	sta.b $8D
	jsl.l RemapTiles
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C8000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3E7
	sta.b $8D
	lda.w #$0004
	sta.b $A5
	jsl.l RemapTiles
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96BABD
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	adc.l $7E35AE
	sta.l $7E35CE
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC1F3
	sta.b $0C
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35CE
	sta.l $7E35C2
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
CODE_9FB8B4:
	jsl.l CODE_8086A9
	lda.w #$03E7
	sta.w $0D23
	lda.w #$0001
	trb.w sflags
	stz.w $0CEB
	stz.w $0D37
	lda.b $85
	dec a
	dec a
	sta.w $0D53
	jsl.l CODE_9CA227
	jsl.l CODE_9FBD65
	lda.w gmode
	bit.w #$0002
	beq CODE_9FB8F1
	ldx.w #$0016
CODE_9FB8E4:
	lda.w pfgoal,x
	eor.w #$0001
	sta.w pfgoal,x
	dex
	dex
	bpl CODE_9FB8E4
CODE_9FB8F1:
	jsl.l CODE_9FB901
	stz.w $0AD1
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	rtl
CODE_9FB901:
	jsl.l CODE_9FB91A
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0100
	jsl.l CODE_808723
	rtl
CODE_9FB91A:
	phx
	phy
	lda.w HomeTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$CD4E
	sta.b $0C
	lda.w #$0096
	sta.b $0E
	lda.w #$007E
	sta.b $12
	lda.w #$3774
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	lda.w #$007E
	sta.b $12
	lda.w #$3634
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	lda.w VisTeam
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$C9CE
	sta.b $0C
	lda.w #$0096
	sta.b $0E
	lda.w #$007E
	sta.b $12
	lda.w #$3794
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	lda.w #$007E
	sta.b $12
	lda.w #$3654
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACEB6
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3734
	sta.b $10
	ldx.w #$0020
	jsl.l CODE_808F2F
	ply
	plx
	rtl
CODE_9FB9A4:
	stx.b $87
	ldx.w #$0000
CODE_9FB9A9:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0038
	bne CODE_9FB9A9
	ldx.b $87
	lda.w $0AD3
	beq CODE_9FB9CC
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
CODE_9FB9CC:
	stz.w sfhormode
	lda.w #$03E7
	sta.w $0D23
	jsl.l SprSort
	lda.w sflags
	bit.w #$0001
	bne CODE_9FB9F2
	jsl.l CODE_9DD977
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	jsl.l CODE_9F9B36
CODE_9FB9F2:
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0080
	jsl.l CODE_808723
	stx.b $87
	ldx.w #$0036
CODE_9FBA0B:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBA0B
	ldx.b $87
	ldx.b $95
	rtl
SetHor:
	stx.b $87
	ldx.w #$0000
CODE_9FBA1C:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FBA1C
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FBA2D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$001C
	bne CODE_9FBA2D
	ldx.b $87
	lda.w puckvx
	pha
	asl a
	pla
	ror a
	sta.w puckvx
	lda.w puckvy
	pha
	asl a
	pla
	ror a
	sta.w puckvy
	lda.w #$0001
	sta.l $7E3460
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w sfhormode
	stz.w Hscroll
	lda.w #$FFFF
	sta.w Vscroll
	lda.w #$002E
	sta.w $0D23
	stz.w $0D25
	jsl.l SprSort
	jsl.l CODE_9FC896
	stx.b $87
	ldx.w #$001A
CODE_9FBA7D:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBA7D
	ldx.b $87
	stx.b $87
	ldx.w #$001A
CODE_9FBA8B:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FBA8B
	ldx.b $87
	ldx.b $95
	rtl
CODE_9FBA97:
	lda.w $0D37
	sta.w $0D4D
	lda.w $0CEB
	sta.w $0D4B
	lda.w #$0040
	tsb.w sflags
	rtl
CODE_9FBAAA:
	stx.b $87
	ldx.w #$0000
CODE_9FBAAF:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0038
	bne CODE_9FBAAF
	ldx.b $87
	jsl.l show_rink
	jsl.l CODE_9FB1FD
	jsl.l CODE_9FBB01
	jsl.l CODE_9CA054
	jsl.l CODE_9FBC5F
	jsl.l CODE_9FA078
	jsl.l CODE_9FA5AD
	jsl.l CODE_9B9FAF
	jsl.l CODE_9EFA2F
	jsl.l CODE_9FBFA0
	lda.w sfhormode
	beq CODE_9FBAEC
	jsl.l CODE_9F9E24
CODE_9FBAEC:
	jsl.l CODE_9FBF75
	stx.b $87
	ldx.w #$0036
CODE_9FBAF5:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9FBAF5
	ldx.b $87
	ldx.b $95
	rtl
CODE_9FBB01:
	lda.w $1EBB
	bne CODE_9FBB4F
	lda.w sflags
	and.w #$0800
	bne CODE_9FBB4F
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
	lda.w #$0175
	sta.b $00
	jsr.w $BB50
	ldy.w #$0002
	lda.w #$0178
	sta.b $00
	jsr.w $BB50
	ldy.w #$0004
	lda.w #$017B
	sta.b $00
	jsr.w $BB50
	ldy.w #$0006
	lda.w #$017E
	sta.b $00
	jsr.w $BB50
	ldy.w #$0008
	lda.w #$0181
	sta.b $00
	jsr.w $BB50
CODE_9FBB4F:
	rtl
CODE_9FBB50:
	lda.w $19EC,y
	bpl CODE_9FBB56
	rts
CODE_9FBB56:
	tay
	lda.w Xpos,y
	sta.b $A5
	lda.w Ypos,y
	sta.b $A9
	lda.w sfhormode
	beq CODE_9FBB79
	lda.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.w Xpos,y
	sec
	sbc.w #$00C5
	sta.b $A9
	bra CODE_9FBB89
CODE_9FBB79:
	lda.b $A5
	sec
	sbc.w $0CEB
	sta.b $A5
	lda.b $A9
	sec
	sbc.w $0D37
	sta.b $A9
CODE_9FBB89:
	stz.b $AD
	lda.b $A5
	cmp.w #$0074
	bmi CODE_9FBB97
	lda.w #$0008
	sta.b $AD
CODE_9FBB97:
	lda.b $A5
	cmp.w #$FF8D
	bpl CODE_9FBBA3
	lda.w #$0004
	tsb.b $AD
CODE_9FBBA3:
	lda.b $A9
	cmp.w #$0064
	bmi CODE_9FBBAC
	inc.b $AD
CODE_9FBBAC:
	lda.b $A9
	cmp.w #$FF9D
	bpl CODE_9FBBB7
	inc.b $AD
	inc.b $AD
CODE_9FBBB7:
	ldx.b $AD
	beq CODE_9FBC00
	lda.l DATA8_80DA46,x
	and.w #$00FF
	asl a
	asl a
	asl a
	tax
	lda.l DATA8_9FBC01,x
	beq CODE_9FBBCE
	sta.b $A5
CODE_9FBBCE:
	lda.l DATA8_9FBC01+2,x
	beq CODE_9FBBD6
	sta.b $A9
CODE_9FBBD6:
	lda.b $00
	clc
	adc.l DATA8_9FBC01+4,x
	sta.b $00
	lda.l DATA8_9FBC01+6,x
	sta.b $14
	lda.b $A5
	clc
	adc.w #$0080
	tax
	lda.b $A9
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0070
	tay
	lda.w #$2000
	ora.b $14
	jsl.l DrawSprite
CODE_9FBC00:
	rts
DATA8_9FBC01:
	dw $0000,$0064,$0000,$0000
	dw $0074,$0064,$0001,$0000
	dw $0074,$0000,$0002,$0000
	dw $0074,$FF9C,$0001,$8000
	dw $0000,$FF9C,$0000,$8000
	dw $FF8C,$FF9C,$0001,$C000
	dw $FF8C,$0000,$0002,$4000
	dw $FF8C,$0064,$0001,$4000
show_rink:
	lda.w sfhormode
	bne CODE_9FBC5E
	lda.w $0CEB
	sec
	sbc.w #$0080
	sta.w Hscroll
	lda.w $0D37
	eor.w #$FFFF
	inc a
	sec
	sbc.w #$0070
	sta.w Vscroll
CODE_9FBC5E:
	rtl
CODE_9FBC5F:
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w #$000C
	sta.b $91
CODE_9FBC6E:
	ldy.b $91
	lda.w $0AE7,y
	cmp.w #$000F
	bne CODE_9FBC7B
CODE_9FBC78:
	jmp.w $BD47
CODE_9FBC7B:
	tyx
	lda.l DATA8_9FBD51,x
	sta.b $00
	lda.w $0AE7,y
	asl a
	tax
	lda.w Xpos,x
	sta.b $A5
	lda.w Ypos,x
	sta.b $A9
	stz.b $AD
	jsl.l CODE_9BC10F
	cmp.w #$4E20
	beq CODE_9FBC78
	ldy.w position,x
	bmi CODE_9FBC78
	phx
	tay
	clc
	adc.w #$000A
	sta.b $A9
	ldx.b $A5
	lda.w #$2000
	jsl.l DrawSprite
	plx
	cpx.w #$0020
	beq CODE_9FBC78
	ldy.w #$0000
	lda.w $13C3,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	beq CODE_9FBCD3
	sta.w $0A2C,y
	iny
	lda.b $A5
	sec
	sbc.w #$0004
	sta.b $A5
CODE_9FBCD3:
	lda.w $13C3,x
	and.w #$000F
	sta.w $0A2C,y
	iny
	lda.b $A5
	sec
	sbc.w #$0004
	sta.b $A5
	lda.w $1D81
	bne CODE_9FBD0A
	lda.w position,x
	and.w #$0007
	beq CODE_9FBD0A
	tax
	lda.w #$FFFF
	sta.w $0A2C,y
	iny
	lda.l DATA8_9FBD5F-1,x
	sta.w $0A2C,y
	iny
	lda.b $A5
	sec
	sbc.w #$0006
	sta.b $A5
CODE_9FBD0A:
	sty.w $0A2A
	ldy.w #$0000
CODE_9FBD10:
	sty.b $AD
	lda.w $0A2C,y
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9FBD37
	adc.w #$01B0
	sta.b $00
	ldx.b $A5
	ldy.b $A9
	lda.w #$2000
	jsl.l DrawSprite
	lda.b $A5
	clc
	adc.w #$0008
	sta.b $A5
	bra CODE_9FBD3F
CODE_9FBD37:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $A5
CODE_9FBD3F:
	ldy.b $AD
	iny
	cpy.w $0A2A
	bne CODE_9FBD10
CODE_9FBD47:
	dec.b $91
	dec.b $91
	bmi CODE_9FBD50
	jmp.w $BC6E
CODE_9FBD50:
	rtl
DATA8_9FBD51:
	dw $0184,$0185,$0186,$0187,$0188,$0189,$018A
DATA8_9FBD5F:
	db $0B,$0B,$0C,$0A,$0D,$0E
CODE_9FBD65:
	rtl
CODE_9FBD66:
	lda.w printx
	pha
	lda.w tmdata
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	lda.b $B1
	beq CODE_9FBD7D
	lda.w $1CDE
	sta.b $8D
CODE_9FBD7D:
	ldy.w #$0004
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	adc.b $8D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.w printx
	inc.w printy
	inc.w printy
	rtl
eraser:
	phx
	lda.b $AD
	clc
	adc.l $7E35A8
	sta.b $AD
	stz.b $AB
CODE_9FBDA8:
	lda.w printy
	clc
	adc.b $AB
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	tax
	ldy.b $A5
	lda.b $AD
CODE_9FBDBF:
	sta.l $7E37F4,x
	inx
	inx
	dey
	bne CODE_9FBDBF
	inc.b $AB
	lda.b $AB
	cmp.b $A9
	bne CODE_9FBDA8
	plx
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	cmp.w $0CD5
	bcs CODE_9FBDE4
	sta.w $0CD5
CODE_9FBDE4:
	lda.w printy
	clc
	adc.b $A9
	and.w #$001F
	sta.w printy
	dec a
	and.w #$001F
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	adc.b $A5
	dec a
	cmp.w $0CD7
	bcc CODE_9FBE07
	sta.w $0CD7
CODE_9FBE07:
	rtl
CODE_9FBE08:
	lda.b $91
	pha
	phx
	lda.w printx
	asl a
	asl a
	asl a
	clc
	adc.w #$0024
	tax
	lda.l $7E3464
	beq CODE_9FBE23
	txa
	sec
	sbc.w #$0008
	tax
CODE_9FBE23:
	lda.w printy
	asl a
	asl a
	asl a
	inc a
	inc a
	inc a
	tay
	lda.l $7E346A
	bne CODE_9FBE3B
	lda.l $7E3464
	bne CODE_9FBE3B
	bra CODE_9FBE43
CODE_9FBE3B:
	inx
	inx
	inx
	inx
	iny
	iny
	iny
	iny
CODE_9FBE43:
	jsl.l CODE_9C943E
	lda.l $7E3462
	beq CODE_9FBE56
	lda.l $7E3460
	bne CODE_9FBE56
	jmp.w $BEF8
CODE_9FBE56:
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b $A9
	cmp.w HomeTeam
	bne CODE_9FBE6D
	ldx.w #$1C00
	stx.b $14
	ldy.w #$0070
CODE_9FBE6D:
	asl a
	asl a
	tax
	lda.l DATA8_9C850F+2,x
	sta.b $0E
	lda.l DATA8_9C850F,x
	sta.b $0C
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w HomeTeam
	cmp.w VisTeam
	bne CODE_9FBE9E
	lda.b $14
	cmp.w #$1800
	beq CODE_9FBE9E
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b $A9
	bra CODE_9FBE6D
CODE_9FBE9E:
	ldy.w #$0000
	lda.w #$009A
	sta.b $93
	lda.w #$E9A3
	sta.b $91
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	tax
	lda.w #$0009
	sta.b $C5
	sta.b $C7
CODE_9FBEC2:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E37F4,x
	iny
	iny
	inx
	inx
	dec.b $C5
	bne CODE_9FBEC2
CODE_9FBEDD:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E3822,x
	iny
	iny
	inx
	inx
	dec.b $C7
	bne CODE_9FBEDD
CODE_9FBEF8:
	plx
	pla
	sta.b $91
	rtl
CODE_9FBEFD:
	lda.w sflags
	bit.w #$2000
	bne CODE_9FBF74
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8D2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AEA3A
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0019
	lda.w #$2000
	clc
	adc.l $7E35B0
	adc.l $7E35AA
	jsl.l CODE_808E2D
	lda.w #$0321
	cmp.w $0CD5
	bcs CODE_9FBF59
	sta.w $0CD5
CODE_9FBF59:
	lda.l DATA8_9AEA3A+2
	clc
	adc.w #$0019
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.l DATA8_9AEA3A
	cmp.w $0CD7
	bcc CODE_9FBF74
	sta.w $0CD7
CODE_9FBF74:
	rtl
CODE_9FBF75:
	lda.w $0CD5
	bmi CODE_9FBF9F
	tay
	asl a
	adc.w #$37F4
	sta.b $0C
	lda.w #$007E
	sta.b $0E
	lda.w $0CD7
	beq CODE_9FBF9F
	sec
	sbc.w $0CD5
	inc a
	asl a
	tax
	jsl.l CODE_80891F
	lda.w #$FFFF
	sta.w $0CD5
	stz.w $0CD7
CODE_9FBF9F:
	rtl
CODE_9FBFA0:
	lda.w sfhormode
	beq CODE_9FBFA6
	rtl
CODE_9FBFA6:
	lda.w Vscroll
	clc
	adc.w #$0170
	lsr a
	lsr a
	lsr a
	tax
	sec
	sbc.w $0D23
	bne CODE_9FBFBA
	jmp.w $C072
CODE_9FBFBA:
	bpl CODE_9FBFE6
	stx.w $0D23
	eor.w #$FFFF
	inc a
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b $C7
	lda.w $0D25
	sec
	sbc.b $C7
	and.w #$001F
	sta.w $0D25
	sta.b $C9
	bra CODE_9FC00D
CODE_9FBFDA:
	lda.w #$001D
	sta.b $C7
	stz.w $0D25
	stz.b $C9
	bra CODE_9FC00D
CODE_9FBFE6:
	stx.w $0D23
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b $C7
	adc.w $0D25
	and.w #$001F
	sta.w $0D25
	adc.w #$001D
	sec
	sbc.b $C7
	and.w #$001F
