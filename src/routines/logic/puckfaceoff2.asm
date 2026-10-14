; Assignment: the face off and the setup for play
puckfaceoff2:
	lda.w pflags,x
	bit.w #$0002
	bne .t2
	jmp.w CODE_9FAEB1

.t2:
	and.w #$FFFD
	sta.w pflags,x
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0020
	bne .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.loop2:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$001C
	bne .loop2
	ldx.b xsave
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
	bcc .1
	lda.w #$0258
	sta.l $7E35E0
.1:
	lda.w $0AD3
	beq .2
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	stz.w $0AD3
.2:
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
	lda.w MusicOn
	bne CODE_9FA90C
	lda.w PBnum
	beq .t3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $14
	lda.w PBnum
	and.w #$000F
	cmp.b $14
	beq .t3
	bcs .t1
.3:
	lda.w #$0004
	jsl.l CODE_9C9B5F
	bra CODE_9FA90C

.t1:
	lda.w #$0001
	jsl.l CODE_9C9B5F
	bra CODE_9FA90C

.t3:
	ldy.w $0CC1
	bne .1x
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9FA90C
	jsl.l RandomWord
	and.w #$0003
	bne CODE_9FA90C
.1x:
	lda.w #$0000
	ldy.w $0CC1
	bne .3x
.2x:
	lda.w #$0002
.3x:
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
	sta.w shotPlIdx
	lda.w #$8200
	trb.w sflags
	lda.w #$0000
	sta.l $7E344A
	sta.l $7E344C
	lda.w #$0500
	tsb.w sflags
	jsl.l CODE_9FB9A4
	stz.w Vpos
	stz.w Hpos
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
	sta.b d4
.loop:
	jsl.l checkwindow
	dec.b d4
	bpl .loop
	lda.w #$003C
	sta.w $0D4F
	jsl.l ResetBench
	stz.b a2
	jsl.l setpersonel
	jsl.l forcepldata
	inc.b a2
	inc.b a2
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
	lda.b a3
	pha
	stz.b a3
	lda.w #$000B
	sta.b d2
	lda.b d2
	pha
CODE_9FA9EF:
	ldx.b a3
	cpx.w #$0018
	bcs .1
	lda.w pfteam,x
	lsr a
	eor.w gmode
	and.w #$0002
	lsr a
	eor.w #$0001
	sta.w pfgoal,x
.1:
	lda.w pnum,x
	asl a
	cpx.w #$000C
	bcc .2
	clc
	adc.w #$0034
.2:
	tax
	lda.w tmpdst,x
	bmi .t2
	bit.w #$1000
	bne .t2
	jmp.w CODE_9FABA2

.t2:
	ldx.b a3
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w $0D97,x
	lda.w position,x
	sta.b d1
	bpl .t1
	jmp.w CODE_9FABA2

.t1:
	beq .5
	lda.w $1E9B
	beq .2x
	phx
	ldx.w #$0008
	lda.w $1E91
	beq .1x
	ldx.w #$0014
.1x:
	lda.w $1E8F
	sta.w pnum,x
	sta.b d3
	plx
.2x:
	lda.w #$0016
	sta.b d0
	lda.b d1
	cmp.w #$0004
	bne .4
	stz.b a2
	lda.w pfteam,x
	beq .3
	inc.b a2
	inc.b a2
.3:
	ldy.b a2
	lda.w pnum,x
	and.w #$00FF
	sta.w tmtouch1,y
	lda.w #$0004
	sta.w tmflags,y
	lda.w #$0017
	sta.b d0
.4:
	jsl.l assinsert
.5:
	lda.w tmap
	sta.b d4
	ldx.b a3
	lda.w pfteam,x
	beq .6
	lda.w $17A8
	sta.b d4
.6:
	lda.b d4
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0006
	asl a
	asl a
	asl a
	sta.b d4
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEE2
	clc
	adc.b d4
	sta.b a1
	lda.w $1E9B
	beq .7
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEFA
	sta.b a1
.7:
	ldy.b d1
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	sta.b d4
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAF02
	sta.b a1
	ldy.b d4
	lda.b [a1],y
	sta.b d0
	iny
	iny
	lda.b [a1],y
	sta.b d1
	lda.w pfgoal,x
	bne .8
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.8:
	lda.w position,x
	beq .13
	lda.b d4
	cmp.w #$0009
	bpl .12
	lda.l $7E3136
	eor.b d0
	bpl .10
	lda.l $7E3138
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .9
	ora.w #$E000
.9:
	eor.w #$FFFF
	inc a
	clc
	adc.b d1
	sta.b d1
.10:
	lda.l $7E3136
	lsr a
	lsr a
	bit.w #$2000
	beq .11
	ora.w #$C000
.11:
	sta.b d3
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
.12:
	lda.b d0
	clc
	adc.l $7E3136
	sta.b d0
	lda.b d1
	clc
	adc.l $7E3138
	sta.b d1
.13:
	lda.b d0
	sta.w Xpos,x
	sec
	sbc.w $0D71
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	sta.w Ypos,x
	sec
	sbc.w pucky
	eor.w #$FFFF
	inc a
	sta.b d1
	stz.w $0EC3,x
	stz.w $0EE3,x
	jsl.l vtoa
	lda.b d0
	sta.w facedir,x
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w pfalock,x
	stz.w SPA,x
	lda.w position,x
	bne .t3
	lda.w #$E0FE
	bra CODE_9FAB9A

.t3:
	lda.w #$EA1A
CODE_9FAB9A:
	jsl.l SetSPAFromA
	jsl.l CODE_9EA419
CODE_9FABA2:
	inc.b a3
	inc.b a3
	pla
	sta.b d2
	dec.b d2
	lda.b d2
	pha
	bmi .t1
	jmp.w CODE_9FA9EF

.t1:
	pla
	sta.b d2
	jsl.l SprSort
	pla
	sta.b a3
	pla
	sta.b $97
	lda.w $1E9B
	beq .6
	ldx.w #$0008
.loop:
	lda.w $19F6,x
	cmp.w $1E91
	bne .2
	cpx.w $1E93
	beq .2
.1:
	ora.w #$8000
	sta.w $19F6,x
	stz.w $1C84,x
.2:
	dex
	dex
	bpl .loop
	lda.w $1E91
	eor.w #$0002
	sta.b d0
	tax
	lda.w $19D0,x
	beq .6
	ldy.w $0AFD,x
.loop2:
	iny
	iny
	cpy.w #$000A
	bne .3
	ldy.w #$0000
.3:
	lda.w $19F6,y
	cmp.b d0
	bne .loop2
	sty.b d1
	tya
	sta.w $0AFD,x
	ldx.w #$0008
.loop3:
	lda.w $19F6,x
	cmp.b d0
	bne .5
	cpx.b d1
	beq .5
.4:
	ora.w #$8000
	sta.w $19F6,x
	stz.w $1C84,x
.5:
	dex
	dex
	bpl .loop3
.6:
	ldx.b a3
	jsl.l CODE_9FC988
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8AE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0036
	sta.b d0
	lda.l $7E3136
	bpl .7
	lda.w #$00BE
	sta.b d0
.7:
	lda.b d0
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
	jsl.l marktextlo
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
	jsl.l marktexthi
	jsl.l CODE_9EBF11
	lda.w #$D6AC
	sta.l $7E3120
	sta.b tmp0
	lda.w #$009A
	sta.b tmp1
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
	bne .t2
.loop4:
	lda.l DATA8_9AD6A6
	sta.b $CA
.loop5:
	lda.b [tmp0],y
	clc
	adc.l $7E35BA
	adc.l $7E35AA
	sta.l textmap,x
	iny
	iny
	inx
	inx
	dec.b $CA
	bne .loop5
	txa
	clc
	adc.w #$0040
	sec
	sbc.l DATA8_9AD6A6
	sbc.l DATA8_9AD6A6
	tax
	dec.b $C8
	bne .loop4
	jmp.w CODE_9FADB5

.t2:
	lda.w #$0001
	sta.w printy
	lda.w #$0006
	sta.w printx
	lda.w #$0014
	sta.b d0
	lda.w #$0008
	sta.b d1
	jsl.l CODE_9D8000
	lda.w $1E91
	sta.b a2
	lda.w #$0005
	sta.w printy
	lda.w $1E8F
	sta.b d0
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [a1]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l print
	inc.w printy
	lda.w #$000F
	sta.w printx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #VersusText
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	inc.w printy
	lda.w $1E91
	eor.w #$0002
	sta.b a2
	tay
	lda.w tmgoalie,y
	sta.b d0
	jsl.l CODE_9FC427
	lda.w #$0014
	sec
	sbc.b [a1]
	lsr a
	clc
	adc.w #$0007
	sta.w printx
	jsl.l print
	lda.w #$0007
	sta.w printx
	lda.w #$0002
	sta.w printy
	lda.w $1D81
	beq .t1x
	lda.w #$009C
	sta.b $8F
	lda.w #ShootoutPenShot
	sta.b a1
	jsl.l CODE_9ECE15
	bra CODE_9FADB5

.t1x:
	lda.w #$009C
	sta.b $8F
	lda.w #$F8C2
	sta.b a1
	jsl.l CODE_9ECE15
CODE_9FADB5:
	ldx.b a3
	lda.l $7E34C6
	beq .3
.1:
	lda.w $1E9B
	ora.w $1E9D
	bne .3
	lda.w printy
	clc
	adc.w #$000A
	sta.w printy
	lda.w #$000C
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D8000
	lda.w tmline
	sta.b d0
	lda.w $1798
	sta.b d1
	lda.w gmode
	bit.w #$0002
	bne .2
	lda.w tmline
	sta.b d1
	lda.w $1798
	sta.b d0
.2:
	inc.w printx
	dec.w printy
	dec.w printy
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b a1
	jsl.l CODE_9ECFC6
	inc.w printx
	inc.w printx
	inc.w printx
	inc.w printx
	lda.b d1
	sta.b d0
	lda.w #$0080
	sta.b $8F
	lda.w #$D6BE
	sta.b a1
	jsl.l CODE_9ECFC6
.3:
	jsl.l RandomWord
	and.w #$007F
	adc.w #$00B4
	sta.b d0
	ldx.b a3
	sta.w $1003,x
	lda.w $1E9B
	beq .4
	lda.w #$00B4
	sta.w $1003,x
.4:
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
	bne .5
	lda.w #$8800
	sta.l $7E312C
	lda.w #$A000
	sta.l $7E3130
.5:
	lda.w #$FFFF
	sta.l $7E3122
	sta.l $7E3124
	stx.b xsave
	ldx.w #$001A
.loop:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$001E
.loop2:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop2
	ldx.b xsave
	ldx.b a3
	rtl
