; Save the registers and go on to StartHL2
SaveRegsStartHL2:
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
StartHL2:
	lda.w sflags3
	bit.w #$0008
	beq .t1
	jmp.w .15

.t1:
	jsl.l .18
	lda.b d1
	sta.b d3
	jsl.l NewTicker3
	lda.w sflags3
	bit.w #$0008
	beq .t3
	jmp.w .14

.t3:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l Framer
	inc.w printx
	dec.w printy
	dec.w printy
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #HighlightFrom
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$00B4
	sta.b d0
	jsl.l waitxsr
	lda.b d3
	bit.w #$1000
	beq .t1x
	jmp.w .14

.t1x:
	stz.w $0AC2
	jsl.l FadeOut
	jsl.l WaitFadeOut
	jsl.l forceblack
	jsl.l FadeOutSound
	lda.w $1D68
	cmp.w #$0001
	beq .1
	jsl.l SPCGameUpload
.1:
	ldx.b a0
	lda.l $7E3528,x
	sta.w HomeTeam
	lda.l $7E3538,x
	sta.w VisTeam
	lda.b a0
	pha
	lda.b $8B
	pha
	jsl.l ClearTeamStats
	jsl.l restoreteams
	lda.w #$0000
	sta.b a2
	jsl.l LoadTeamLines
	lda.w #$0002
	sta.b a2
	jsl.l LoadTeamLines
	stz.b a2
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b a2
	jsl.l reenergizeteam
	jsl.l LoadCenterIce
	ldx.w #$0008
	lda.w #$FFFF
.loop:
	sta.w $19EC,x
	sta.w $19F6,x
	dex
	dex
	bpl .loop
	stz.w $1C84
	stz.w $1C86
	stz.w $1C88
	stz.w $1C8A
	stz.w $1C8C
	lda.w #$0078
	jsl.l randoma8
	adc.w #$0078
	sta.w gameclock
	pla
	sta.b $8B
	pla
	sta.b a0
	lda.b a0
	pha
	lda.b $8B
	pha
	ldx.b a0
	lda.l $7E3568,x
	dec a
	sta.w gsp
	lda.l $7E3578,x
	sta.w $178E
	lda.l $7E3588,x
	sta.w $1790
	lda.w #$0010
	sta.w gmode
	stz.w gmclock
	lda.w gsp
	lsr a
	bcc .2
	lda.w #$0002
	tsb.w gmode
.2:
	stz.w sflags3
	lda.w #$0400
	sta.w sflags
	stz.w sfhormode
	stz.w iflags
	lda.w #$FFFF
	sta.w RefCnt
	sta.w $0D19
	sta.w $0D1D
	jsl.l setupice_reset
	jsl.l ClrHor
	stz.w Vpos
	stz.w Hpos
	jsl.l ResetBench
	stz.b a2
	jsl.l .16
	lda.w #$0002
	sta.b a2
	jsl.l .16
	jsl.l resetplstuff
	lda.w #$0000
	sta.l $7E3448
	lda.w #$000B
	sta.b d0
	lda.w #$009F
	sta.b $8B
	lda.w #.20
	sta.b a0
	stz.b a1
.loop2:
	ldx.b a1
	lda.w position,x
	sta.b d1
	lda.w pfgoal,x
	bne .3
	lda.b d1
	clc
	adc.w #$0006
	sta.b d1
.3:
	asl.b d1
	asl.b d1
	ldy.b d1
	lda.b [a0],y
	sta.w Xpos,x
	iny
	iny
	lda.b [a0],y
	sta.w Ypos,x
	stz.w $0EC3,x
	stz.w $0EE3,x
	inc.b a1
	inc.b a1
	dec.b d0
	bpl .loop2
	lda.w puckc
	bpl .4
	lda.w #$000C
	jsl.l randoma
	asl a
	sta.w puckc
.4:
	tax
	lda.w position,x
	bne .5
	dex
	dex
	txa
	sta.w puckc
.5:
	jsl.l SprSort
org $9F9001
	lda.w #$00B4
	pha
	lda.b $83
	sta.w $0D01
.loop3:
	lda.b $83
	cmp.w $0D01
	beq .loop3
	tax
	sec
	sbc.w $0D01
	sta.b d7
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
	jsl.l ReadPads
	lda.w sflags
	bit.w #$0001
	bne .7
	lda.w gmclock
	bne .7
	ldx.b d7
.loop4:
	lda.w gameclock
	beq .6
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs .6
	dec.w gameclock
.6:
	dex
	bne .loop4
.7:
	lda.b d7
	pha
	jsl.l DoGameFrame
	pla
	sta.b d7
	sta.w $0ADB
	lda.w gmclock
	beq .8
	pla
	sec
	sbc.b d7
	pha
	bmi .9
.8:
	jsl.l ReadAnyPad
	lda.b d1
	bit.w #$9080
	beq .loop3
	lda.w $178E
	cmp.w $1790
	bne .9
	jsl.l RandomWord
	and.w #$0002
	tax
	inc.w $178E,x
.9:
	pla
	pla
	sta.b $8B
	pla
	sta.b a0
	jsl.l FadeOutSound
	ldx.b a0
	lda.w $178E
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l SetupTeamForIntermission
	ldx.w #$0000
.loop5:
	lda.w #$FF10
	sta.w Xpos,x
	stz.w Ypos,x
	lda.w #$0001
	sta.w $0D97,x
	inx
	inx
	cpx.w #$0018
	bcc .loop5
	jsl.l FadeOut
	jsl.l WaitFadeOut
	jsl.l forceblack
	jsl.l .19
	jsl.l setplayercolors
	jsl.l SetHor
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
.loop6:
	lda.w SoundFadeSpeed
	bne .loop6
	lda.w MusicOn
	bne .loop6
	jsl.l SPCMenuUpload
	lda.l $7E34BC
	beq .t2
	cmp.w #$0004
	beq .t2
	lda.l playoffRoundIdx
	cmp.w #$0002
	bcc .t2
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	bra .10

.t2:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
.10:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF809
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l Framer
	jsl.l printscores1
	jsl.l Pmenu
	jsl.l FadeIn
	jsl.l ScreenOn
	stx.b xsave
	ldx.w #$001A
.loopx:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loopx
	ldx.b xsave
	stx.b xsave
	ldx.w #$001E
.loop2x:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop2x
	ldx.b xsave
	ldx.b a3
	stx.b xsave
	ldx.w #$0000
.loop3x:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0020
	bne .loop3x
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.loop4x:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$001C
	bne .loop4x
	ldx.b xsave
	ldx.b a0
	lda.w #$0004
	sta.l $7E3568,x
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne .t1xx
	jmp.w StartHL2

.t1xx:
	lda.w #$0005
	sta.l $7E3568,x
	lda.b d1
	sta.b d3
	jsl.l NewTicker3
	lda.w #$00B4
	sta.b d0
	jsl.l waitxsr
	lda.b d1
	bit.w #$1000
	beq .12
.11:
	lda.w #$0008
	tsb.w sflags3
	bra .13
.12:
	lda.w #$0008
	trb.w sflags3
.13:
	jsl.l LoadCenterIce
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
	jsl.l DMAToVRAM
	stx.b xsave
	ldx.w #$001A
.loopxx:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loopxx
	ldx.b xsave
	stx.b xsave
	ldx.w #$001E
.loop2xx:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop2xx
	ldx.b xsave
	ldx.b a3
	rtl
.14:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.l blankchar
	sta.b d2
	jsl.l eraser
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l .19
	jsl.l .17
	jmp.w .11
.15:
	jsl.l .17
	jmp.w .12
.16:
	jsl.l reenergizeteam
	jsl.l setpersonel
	jsl.l forcepldata
	ldy.b a2
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	rtl
.17:
	ldx.b a0
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne .1x
	jsl.l RandomWord
	and.w #$0001
	ldx.b a0
	pha
	clc
	adc.l $7E3578,x
	sta.l $7E3578,x
	pla
	eor.w #$0001
	adc.l $7E3588,x
	sta.l $7E3588,x
.1x:
	lda.w #$0005
	sta.l $7E3568,x
	rtl
.18:
	ldx.w #$0000
.loopxxx:
	lda.w $15D3,x
	sta.l $7E47F4,x
	inx
	inx
	cpx.w #$0781
	bcc .loopxxx
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
.loop2xxx:
	sta.w $19D4,x
	inx
	inx
	cpx.w #$0018
	bcc .loop2xxx
	jsl.l ClearPenaltyBuffer
	rtl
.19:
	ldx.w #$0000
.loopxxxx:
	lda.l $7E47F4,x
	sta.w $15D3,x
	inx
	inx
	cpx.w #$0781
	bcc .loopxxxx
	lda.l $7E47F4,x
	inx
	inx
	sta.l $7E313A
	rtl
.20:
	dw 0,-240,-70,-140,20,-110,-100,-60,25,-40,70,-80
	dw 0,240,34,90,-55,80,100,40,-10,10,-50,0
