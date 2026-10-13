; Bank $9F, seventh 4 KB: the pause and intermission menu code, with auto labels for now. DATA8_9FEC96 holds the menu
; item names (Resume Game, Instant Replay, Game Stats ... Exit Game) and DATA8_9FE504 the handler of each item, in the
; same order; DATA8_9FEC72 is a word table its code reads, and DATA8_9FEC30 holds the goalie and on/off settings
; (Automatic Goalie, Manual Goalie, None, On, Off). The item names continue in the next file.

org $9FE000
	rtl
CODE_9FE001:
	ldx.b $95
	ldy.b $91
	lda.b $AD
	sta.b $A5
	sta.w $17E6,y
	jsl.l CODE_9FD7B2
	lda.b $A5
	bmi CODE_9FE03E
	lda.w $1283,x
	ora.w #$0008
	sta.w $1283,x
	jsl.l CODE_9FC757
	ldy.b $91
	lda.w $17DE,y
	and.w #$FFF7
	sta.w $17DE,y
	lda.b $A5
	sta.w $1796,y
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FD407
	jmp.w $DE13
CODE_9FE03E:
	rtl
CODE_9FE03F:
	jsl.l CODE_9FCDAC
	lda.w #$0001
	sta.l $7E344E
	stz.b $91
	lda.w #$0002
	sta.b $95
	jsl.l CODE_9FE05C
	stz.b $95
	lda.w #$0002
	sta.b $91
CODE_9FE05C:
	jsl.l CODE_9FDD9D
	ldx.b $95
	ldy.b $91
	stz.w $1796,x
	lda.l $7E34C6
	beq CODE_9FE088
	lda.w $17A6,x
	sec
	sbc.w $17A6,y
	sta.b $A5
	beq CODE_9FE088
	lda.w #$0003
	sta.w $1796,x
	lda.b $A5
	bpl CODE_9FE088
	lda.w #$0005
	sta.w $1796,x
CODE_9FE088:
	rtl
CODE_9FE089:
	stz.b $A5
	lda.b $91
	bne CODE_9FE091
	inc.b $A5
CODE_9FE091:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E4
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $15D4
	bit.w #$0002
	beq CODE_9FE0BA
	lda.b $A5
	eor.w #$0001
	sta.b $A5
CODE_9FE0BA:
	phx
	lda.w #$0015
	ldx.b $A5
	jsl.l CODE_808F4C
	plx
	adc.w $0D11
	sta.w $0D11
	lda.w #$0002
	sta.b $A5
	jsl.l CODE_9FD7B2
	lda.w #$0006
	sta.b $A9
	lda.b $A5
	bpl CODE_9FE0E2
	dec.b $A9
	inc.w $0D11
CODE_9FE0E2:
	lda.w #$000C
	sta.b $A5
	rtl
CODE_9FE0E8:
	ldx.w #$026F
CODE_9FE0EB:
	lda.w #$000E
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc CODE_9FE0FA
	lda.w #$000C
CODE_9FE0FA:
	sta.b $14
	lda.w $0792
	and.w #$0010
	beq CODE_9FE111
	sep #$20
	lda.b $14
	sta.w $1A12,x
CODE_9FE10B:
	rep #$20
	dex
	bpl CODE_9FE0EB
	rtl
CODE_9FE111:
	sep #$20
	lda.b #$00
	sec
	sbc.b $14
	sta.w $1A12,x
	bra CODE_9FE10B
CODE_9FE11D:
	lda.w #$FFFF
	sta.l $7E3476
	lda.w $1D81
	beq CODE_9FE130
	lda.w $1EBB
	bne CODE_9FE161
	bra CODE_9FE16F
CODE_9FE130:
	lda.w $1630
	cmp.w #$0004
	beq CODE_9FE145
	lda.w $1EBB
	bne CODE_9FE153
	bra CODE_9FE13F
CODE_9FE13F:
	jsl.l CODE_9FE4BF
	bra CODE_9FE17D
CODE_9FE145:
	lda.w #$000F
	sta.w $1EB9
	lda.w #$0001
	sta.w $1EB7
	bra CODE_9FE17D
CODE_9FE153:
	lda.w #$0009
	sta.w $1EB9
	lda.w #$0002
	sta.w $1EB7
	bra CODE_9FE17D
CODE_9FE161:
	lda.w #$0006
	sta.w $1EB9
	lda.w #$0003
	sta.w $1EB7
	bra CODE_9FE17D
CODE_9FE16F:
	lda.w #$0006
	sta.w $1EB9
	lda.w #$0004
	sta.w $1EB7
	bra CODE_9FE17D
CODE_9FE17D:
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$0002
	sta.w $0ADB
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
CODE_9FE19E:
	jsl.l CODE_9FEA24
	jsl.l CODE_9FE618
	lda.b $B1
	bit.w #$1000
	beq CODE_9FE1B0
	jmp.w DATA8_80E73D
CODE_9FE1B0:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE1FA
	bit.w #$0400
	beq CODE_9FE1DD
	inc.w $0D15
	lda.w $1EB9
	cmp.w $0D15
	beq CODE_9FE1D8
	lda.w $0D15
	sec
	sbc.w #$0005
	cmp.w $0D13
	bmi CODE_9FE19E
	inc.w $0D13
	bra CODE_9FE19E
CODE_9FE1D8:
	dec.w $0D15
	bra CODE_9FE19E
CODE_9FE1DD:
	bit.w #$0800
	beq CODE_9FE1FA
	dec.w $0D15
	lda.w $0D15
	cmp.w $0D13
	bpl CODE_9FE19E
	dec.w $0D13
	bpl CODE_9FE19E
	stz.w $0D13
	stz.w $0D15
	bra CODE_9FE19E
CODE_9FE1FA:
	lda.w $0D15
	asl a
	asl a
	sta.b $A5
	tay
	lda.w $1EB7
	beq CODE_9FE21D
	cmp.w #$0001
	beq CODE_9FE235
	cmp.w #$0002
	beq CODE_9FE241
	cmp.w #$0003
	beq CODE_9FE24D
	cmp.w #$0004
	beq CODE_9FE259
	bra CODE_9FE229
CODE_9FE21D:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FE504
	sta.b $89
	bra CODE_9FE263
CODE_9FE229:
	lda.w #$009F
	sta.b $8B
	lda.w #$E544
	sta.b $89
	bra CODE_9FE263
CODE_9FE235:
	lda.w #$009F
	sta.b $8B
	lda.w #$E588
	sta.b $89
	bra CODE_9FE263
CODE_9FE241:
	lda.w #$009F
	sta.b $8B
	lda.w #$E5C4
	sta.b $89
	bra CODE_9FE263
CODE_9FE24D:
	lda.w #$009F
	sta.b $8B
	lda.w #$E5E8
	sta.b $89
	bra CODE_9FE263
CODE_9FE259:
	lda.w #$009F
	sta.b $8B
	lda.w #$E600
	sta.b $89
CODE_9FE263:
	lda.b [$89],y
	sta.w $1D5A
	iny
	lda.b [$89],y
	sta.w $1D5B
	jml.l $001D59
CODE_9FE272:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE27C
	jmp.w $E19E
CODE_9FE27C:
	lda.w $07F3
	sta.w $0CBB
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	lda.b $C1
	pha
	lda.b $85
	dec a
	dec a
	sta.w $0D53
	jsl.l CODE_9BAA60
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	pla
	sta.b $C1
	sta.w $0ADB
CODE_9FE2AE:
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	lda.w #$0001
	rtl
CODE_9FE2BB:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE2C5
	jmp.w $E19E
CODE_9FE2C5:
	jsl.l CODE_9C8D2E
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
CODE_9FE2CF:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE2D9
	jmp.w $E19E
CODE_9FE2D9:
	lda.w #$0001
	sta.l $7E346A
	jsl.l ShootoutShooters
	lda.w #$0000
	sta.l $7E346A
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
CODE_9FE2F1:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE2FB
	jmp.w $E19E
CODE_9FE2FB:
	jsl.l CODE_9D9D26
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
CODE_9FE305:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE30F
	jmp.w $E19E
CODE_9FE30F:
	lda.w #$0001
	sta.l $7E346A
	jsl.l CODE_9B869B
	lda.w #$0000
	sta.l $7E346A
	jsl.l CODE_9FE79F
	bra CODE_9FE2AE
CODE_9FE327:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE331
	jmp.w $E19E
CODE_9FE331:
	jsl.l CODE_9C8583
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE33C:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE346
	jmp.w $E19E
CODE_9FE346:
	jsl.l CODE_9B93F3
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE351:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE35B
	jmp.w $E19E
CODE_9FE35B:
	jsl.l CODE_9B9768
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE366:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE370
	jmp.w $E19E
CODE_9FE370:
	jsl.l CODE_9DBD4F
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE37B:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE385
	jmp.w $E19E
CODE_9FE385:
	jsl.l CODE_9BC25A
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE390:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE39A
	jmp.w $E19E
CODE_9FE39A:
	jsl.l CODE_9F8000
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE3A5:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE3AF
	jmp.w $E19E
CODE_9FE3AF:
	jsl.l CODE_9BA428
	jsl.l CODE_9FE79F
	jmp.w $E2AE
CODE_9FE3BA:
	jsl.l CODE_9FC76C
	jsl.l CODE_9ED300
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.b $A9
	bit.w #$8180
	bne CODE_9FE3EB
	bit.w #$0200
	bne CODE_9FE3D7
	jmp.w $E19E
CODE_9FE3D7:
	lda.w $17AA,y
	bmi CODE_9FE3E7
CODE_9FE3DC:
	dec a
CODE_9FE3DD:
	sta.w $17AA,y
	jsl.l CODE_9FD407
	jmp.w $E19E
CODE_9FE3E7:
	lda.b $A5
	bra CODE_9FE3DC
CODE_9FE3EB:
	lda.w $17AA,y
	bmi CODE_9FE3FA
	inc a
	cmp.b $A5
	bcc CODE_9FE3DD
	lda.w #$FFFF
	bra CODE_9FE3DD
CODE_9FE3FA:
	lda.w #$0000
	bra CODE_9FE3DD
CODE_9FE3FF:
	lda.b $A9
	bit.w #$8380
	beq CODE_9FE415
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C90,y
	eor.w #$0001
	sta.w $1C90,y
CODE_9FE415:
	jmp.w $E19E
CODE_9FE418:
	lda.b $A9
	bit.w #$8380
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C94,y
	eor.w #$0001
	sta.w $1C94,y
CODE_9FE42E:
	jmp.w $E19E
CODE_9FE431:
	lda.b $A9
	bit.w #$8080
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $17E2,y
	dec a
	bmi CODE_9FE4BC
	sta.w $17E2,y
	jsl.l CODE_9FDD9D
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E9
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
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8EE
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	ldy.b $91
	lda.w $1C98,y
	jsl.l CODE_9BC5AB
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w $0D0F
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DD923
	ldx.w #$0096
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9FE4BF
CODE_9FE4BC:
	jmp.w $E19E
CODE_9FE4BF:
	ldx.w $0AC6
	bmi CODE_9FE4E8
	lda.w $15D6
	beq CODE_9FE4E8
	lda.w $1A10
	bne CODE_9FE4E8
	lda.w $1C84,x
	and.w #$0002
	tay
	lda.w $17E2,y
	beq CODE_9FE4E8
	lda.w #$0011
	sta.w $1EB9
	lda.w #$0005
	sta.w $1EB7
	bra CODE_9FE4F4
CODE_9FE4E8:
	lda.w #$0010
	sta.w $1EB9
	lda.w #$0000
	sta.w $1EB7
CODE_9FE4F4:
	lda.w $0D13
	clc
	adc.w #$0005
	cmp.w $1EB9
	bcc CODE_9FE503
	dec.w $0D13
CODE_9FE503:
	rtl
DATA8_9FE504:		; a long pointer to the handler of each menu item of DATA8_9FEC96
	dd CODE_9FE733,CODE_9FE272,CODE_9FE2BB,CODE_9FE2F1,CODE_9FE305
	dd CODE_9FE327,CODE_9FE33C,CODE_9FE351,CODE_9FE390,CODE_9FE3BA
	dd CODE_9FE3FF,CODE_9FE418,CODE_9FE366,CODE_9FE37B,CODE_9FE3A5
	dd CODE_9FE741,CODE_9FE733,CODE_9FE272,CODE_9FE2BB,CODE_9FE2F1
	dd CODE_9FE305,CODE_9FE431,CODE_9FE327,CODE_9FE33C,CODE_9FE351
	dd CODE_9FE390,CODE_9FE3BA,CODE_9FE3FF,CODE_9FE418,CODE_9FE366
	dd CODE_9FE37B,CODE_9FE3A5,CODE_9FE741,CODE_9FE733,CODE_9FE272
	dd CODE_9FE2BB,CODE_9FE2F1,CODE_9FE305,CODE_9FE327,CODE_9FE33C
	dd CODE_9FE351,CODE_9FE390,CODE_9FE3BA,CODE_9FE3FF,CODE_9FE418
	dd CODE_9FE366,CODE_9FE37B,CODE_9FE3A5,CODE_9FE733,CODE_9FE2F1
	dd CODE_9FE305,CODE_9FE3BA,CODE_9FE3FF,CODE_9FE418,CODE_9FE366
	dd CODE_9FE37B,CODE_9FE741,CODE_9FE733,CODE_9FE2CF,CODE_9FE2F1
	dd CODE_9FE3FF,CODE_9FE366,CODE_9FE741,CODE_9FE733,CODE_9FE272
	dd CODE_9FE2F1,CODE_9FE3FF,CODE_9FE366,CODE_9FE741
CODE_9FE618:
	jsl.l CODE_9FF1D1
	jsr.w $E75E
	jsl.l CODE_9FA393
	beq CODE_9FE628
	jmp.w $E70D
CODE_9FE628:
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jsl.l CODE_9B8017
	lda.w $0AC6
	bpl CODE_9FE6B8
	lda.w #$0000
	pha
CODE_9FE645:
	lda.b $01,s
	asl a
	tax
	lda.w $0776,x
	bit.w #$000F
	bne CODE_9FE660
	lda.w $1C84,x
	beq CODE_9FE660
	lda.b $01,s
	jsl.l CODE_9B84DC
	lda.b $B1
	bne CODE_9FE66E
CODE_9FE660:
	lda.b $01,s
	inc a
	sta.b $01,s
	cmp.w #$0005
	bcc CODE_9FE645
	pla
	jmp.w $E6F2
CODE_9FE66E:
	pla
	asl a
	tax
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	cmp.w $0AC6
	beq CODE_9FE6AE
	stx.w $0AC6
	stz.w $0D15
	stz.w $0D13
	jsl.l CODE_9FEA24
	jsl.l CODE_9DD923
	jsr.w $E9FD
	lda.w #$003C
	sta.w $0AC8
	lda.w #$0014
	sta.w $0AC4
	lda.w $1EB7
	beq CODE_9FE6A9
	cmp.w #$0005
	beq CODE_9FE6A9
	bra CODE_9FE6AD
CODE_9FE6A9:
	jsl.l CODE_9FE4BF
CODE_9FE6AD:
	rtl
CODE_9FE6AE:
	stx.w $0AC6
	lda.w #$003C
	sta.w $0AC8
	txa
CODE_9FE6B8:
	lsr a
	jsl.l CODE_9B84DC
	dec.w $0AC4
	dec.w $0AC4
	jsl.l CODE_9B852C
	lda.b $B1
	bne CODE_9FE6EC
	lda.w $0AC8
	beq CODE_9FE6F2
	sec
	sbc.w #$0003
	sta.w $0AC8
	beq CODE_9FE6DB
	bpl CODE_9FE6F2
CODE_9FE6DB:
	stz.w $0AC8
	ldx.w $0AC6
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	sta.w $0AC6
	rtl
CODE_9FE6EC:
	lda.w #$003C
	sta.w $0AC8
CODE_9FE6F2:
	lda.w $0D2F
	beq CODE_9FE712
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9FE712
	dec.w $0CE3
	bne CODE_9FE712
CODE_9FE70D:
	lda.w #$1000
	tsb.b $B1
CODE_9FE712:
	lda.b $A9
	ora.b $B1
	bne CODE_9FE71B
	jmp.w $E618
CODE_9FE71B:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9FE732
	lda.w #$EA60
	sta.w $0CE3
CODE_9FE732:
	rtl
CODE_9FE733:
	lda.b $A9
	bit.w #$9080
	bne CODE_9FE73D
	jmp.w $E19E
CODE_9FE73D:
	lda.w #$0000
	rtl
CODE_9FE741:
	lda.b $A9
	bit.w #$8080
	bne CODE_9FE74B
	jmp.w $E19E
CODE_9FE74B:
	jsl.l CODE_9FF00B
	cmp.w #$0000
	bne CODE_9FE757
	jmp.w $E19E
CODE_9FE757:
	stz.w $07C6
	jml.l CODE_9F82D2
CODE_9FE75E:
	lda.l $7E34CC
	beq CODE_9FE793
	ldx.w $0AC6
	bmi CODE_9FE793
	lda.w $1C84,x
	beq CODE_9FE793
	dec a
	beq CODE_9FE780
	ldx.w #$76DE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76FE
	bra CODE_9FE78D
CODE_9FE780:
	ldx.w #$76FE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76DE
CODE_9FE78D:
	jsl.l CODE_9D96A9
	bra CODE_9FE79E
CODE_9FE793:
	lda.w #$FFFF
	sta.l $7F76DE
	sta.l $7F76FE
CODE_9FE79E:
	rts
CODE_9FE79F:
	jsl.l CODE_9F96F7
	lda.w #$FFFF
	sta.w $07C6
	jsl.l CODE_9BC1D5
	lda.w #$0081
	sta.b $0E
	lda.w #IceRinkTiles
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	phx
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	jsl.l CODE_9FB901
	sep #$20
	lda.b #$00
	sta.w BG1SC
	lda.b #$05
	sta.w BG2SC
	lda.b #$12
	sta.w BG12NBA
	lda.b #$13
	sta.w TM
	lda.b #$03
	sta.w OBSEL
	rep #$20
	lda.w #$007E
	sta.b $0E
	lda.w #$35F4
	sta.b $0C
	ldy.w #$0000
	ldx.w #$0040
	jsl.l CODE_808723
	lda.w #$FF00
	sta.l $7E35AA
	lda.w #$0000
	sta.l $7E35AC
	plx
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$1000
	jsl.l CODE_80891F
	lda.w $1C98
	asl a
	asl a
	asl a
	tax
	lda.l CenterIceTable+2,x
	sta.b $0E
	lda.l CenterIceTable,x
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $10
	stx.b $00
	lda.w #$007F
	sta.b $0E
	sta.b $12
	stz.b $0C
	jsl.l LinearToPlanar
	ldx.b $10
	stx.b $0C
	lda.l $7E35B8
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
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
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC98B
	sta.b $0C
	jsl.l Decompress
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
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
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
	sta.b $A5
	lda.l $7E35B6
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	sta.w VMADDL
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D0
	sta.b $8D
	jsl.l CODE_9B854B
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
	jsl.l CODE_9B854B
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96BABD
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
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w $0CC7
	adc.w #$003C
	sta.w $0CC7
	lda.w #$FFFF
	sta.w $0CD5
	stz.w $0CD7
	jsl.l CODE_9FBA17
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	rtl
CODE_9FE9FD:
	jsr.w $E75E
	lda.w #$007F
	sta.b $0E
	lda.w #$76C0
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l CODE_808723
	ldx.w $0AC6
	lda.w $0776,x
	bit.w #$8080
	bne CODE_9FE9FD
	rts
CODE_9FEA24:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8FD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D13
	sta.b $A5
	lda.w $1EB7
	beq CODE_9FEA5E
	cmp.w #$0001
	beq CODE_9FEA76
	cmp.w #$0002
	beq CODE_9FEA82
	cmp.w #$0003
	beq CODE_9FEA8E
	cmp.w #$0004
	beq CODE_9FEA9A
	bra CODE_9FEA6A
CODE_9FEA5E:
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FEC96
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEA6A:
	lda.w #$009F
	sta.b $8B
	lda.w #$ED68
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEA76:
	lda.w #$009F
	sta.b $8B
	lda.w #$EE43
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEA82:
	lda.w #$009F
	sta.b $8B
	lda.w #$EF08
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEA8E:
	lda.w #$009F
	sta.b $8B
	lda.w #$EF72
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEA9A:
	lda.w #$009F
	sta.b $8B
	lda.w #$EFBE
	sta.b $89
	bra CODE_9FEAA6
CODE_9FEAA6:
	lda.b $89
	ldx.b $A5
CODE_9FEAAA:
	dex
	bmi CODE_9FEAB4
	clc
	adc.b [$89]
	sta.b $89
	bra CODE_9FEAAA
CODE_9FEAB4:
	lda.w #$2400
	sta.w $0D0D
	lda.b $A5
	cmp.w $0D15
	bne CODE_9FEAC7
	lda.w #$2000
	sta.w $0D0D
CODE_9FEAC7:
	lda.w #$0006
	sta.w $0D0F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF902
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	ldy.w #$001E
CODE_9FEAF4:
	lda.b [$89],y
	sta.b [$8D],y
	dey
	dey
	bpl CODE_9FEAF4
	jsl.l CODE_9FEB32
	jsl.l CODE_9FEBA6
	jsl.l CODE_9FEBEB
	lda.b [$8D]
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0011
	sta.w $0D0F
	jsl.l CODE_9EC7BE
	inc.w $0D11
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	inc.b $A5
	lda.b $A5
	sec
	sbc.w $0D13
	cmp.w #$0005
	bne CODE_9FEAB4
	rtl
CODE_9FEB32:
	lda.w #$009F
	sta.b $97
	lda.w #DATA8_9FEC72
	sta.b $95
	lda.w $1EB7
	asl a
	clc
	adc.b $95
	sta.b $95
	lda.b [$95]
	cmp.b $A5
	beq CODE_9FEB4E
	jmp.w $EBA5
CODE_9FEB4E:
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $17AA,y
	bpl CODE_9FEB5C
	jmp.w $EC60
CODE_9FEB5C:
	sta.b $C5
	lda.w $1CDC,y
	sta.b $99
	lda.w #$009C
	sta.b $9B
	ldy.w #$0000
	lda.b [$99],y
	clc
	adc.b $99
	sta.b $99
CODE_9FEB72:
	dec.b $C5
	bmi CODE_9FEB82
	lda.b [$99]
	clc
	adc.b $99
	adc.w #$0008
	sta.b $99
	bra CODE_9FEB72
CODE_9FEB82:
	ldy.w #$0001
CODE_9FEB85:
	iny
	lda.b [$99],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FEB85
CODE_9FEB90:
	iny
	tya
	cmp.b [$99]
	beq CODE_9FEBA5
	lda.b [$99],y
	phy
	ldy.w $0A2A
	sta.w $0A2A,y
	inc.w $0A2A
	ply
	bra CODE_9FEB90
CODE_9FEBA5:
	rtl
CODE_9FEBA6:
	lda.w #$009F
	sta.b $97
	lda.w #$EC7E
	sta.b $95
	lda.w $1EB7
	asl a
	clc
	adc.b $95
	sta.b $95
	lda.b [$95]
	cmp.b $A5
	beq CODE_9FEBC2
	jmp.w $EBA5
CODE_9FEBC2:
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C90,y
	beq CODE_9FEBD9
	lda.w #$009F
	sta.b $9B
	lda.w #$EC42
	sta.b $99
	bra CODE_9FEBE3
CODE_9FEBD9:
	lda.w #$009F
	sta.b $9B
	lda.w #DATA8_9FEC30
	sta.b $99
CODE_9FEBE3:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
CODE_9FEBEB:
	lda.w #$009F
	sta.b $97
	lda.w #$EC8A
	sta.b $95
	lda.w $1EB7
	asl a
	clc
	adc.b $95
	sta.b $95
	lda.b [$95]
	cmp.b $A5
	beq CODE_9FEC07
	jmp.w $EBA5
CODE_9FEC07:
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $1C94,y
	beq CODE_9FEC1E
	lda.w #$009F
	sta.b $9B
	lda.w #$EC57
	sta.b $99
	bra CODE_9FEC28
CODE_9FEC1E:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC5B
	sta.b $99
CODE_9FEC28:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
DATA8_9FEC30:		; a word (2 + the text), then the text
	dw $0012 : db "Automatic Goalie"
	dw $000F : db "Manual Goalie"
	dw $0006 : db "None"
	dw $0004 : db "On"
	dw $0005 : db "Off"
CODE_9FEC60:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC51
	sta.b $99
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
DATA8_9FEC72:
	dw $0009,$0009,$0003,$FFFF,$FFFF,$000A,$000A,$000A,$0004
	dw $0003,$0003,$000B,$000B,$000B,$0005,$FFFF,$FFFF,$000C
DATA8_9FEC96:		; the menu item names, as DATA8_9FEC30
	dw $000D : db "Resume Game"
	dw $0010 : db "Instant Replay"
	dw $000C : db "Game Stats"
	dw $000D : db "Team Roster"
	dw $000C : db "Edit Lines"
	dw $000E : db "Player Stats"
	dw $0011 : db "Scoring Summary"
	dw $0011 : db "Penalty Summary"
	dw $000E : db "Period Stats"
	dw $000B : db "Goalie - "
	dw $0002
	dw $0011 : db "Def. Control - "
	dw $000E : db "Player Cards"
	dw $000E : db "Other Scores"
	dw $000D : db "Crowd Level"
	dw $000B : db "Exit Game"
	dw $000D : db "Resume Game"
	dw $0010 : db "Instant Replay"
	dw $000C : db "Game Stats"
	dw $000D : db "Team Roster"
	dw $000C : db "Edit Lines"
	dw $0009 : db "Timeout"
	dw $000E : db "Player Stats"
	dw $0011 : db "Scoring Summary"
	dw $0011 : db "Penalty Summary"
	dw $000E : db "Period Stats"
	dw $000B : db "Goalie - "
	dw $0002
	dw $0011 : db "Defense Ctrl - "
	dw $000E : db "Player Cards"
	dw $000E : db "Other Scores"
	dw $000D : db "Crowd Level"
	dw $000B : db "Exit Game"
	dw $000B : db "Exit Game"
	dw $0010 : db "Instant Replay"
	dw $000C : db "Game Stats"
	dw $000D : db "Team Roster"
	dw $000C : db "Edit Lines"
	dw $000E : db "Player Stats"
	dw $0011 : db "Scoring Summary"
	dw $0011 : db "Penalty Summary"
	dw $000E : db "Period Stats"
	dw $000B : db "Goalie - "
	dw $0002
	dw $0011 : db "Defense Ctrl - "
	dw $000E : db "Player Cards"
	dw $000E : db "Other Scores"
	dw $000D : db "Crowd Level"
	dw $000C : db "Start Game"
	dw $000D : db "Team Roster"
	dw $000C : db "Edit Lines"
	dw $000B : db "Goalie - "
	dw $0002
	dw $0011 : db "Defense Ctrl - "
	dw $000E : db "Player Cards"
	dw $000E : db "Other Scores"
	dw $000B : db "Exit Game"
	dw $0010 : db "Start Shootout"
	dw $0010 : db "Shootout Setup"
	dw $000D : db "Team Roster"
	dw $0002
	dw $000E : db "Player Cards"
	dw $000F : db "Exit Shootout"
	dw $0011 : db "Resume Shootout"
	dw $0010 : db "Instant Replay"
	dw $000D : db "Team Roster"
	dw $0002
	dw $000E : db "Player Cards"
	dw $000F : db "Exit Shootout"
