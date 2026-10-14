; Unidentified routine.
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
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9B9334
	stz.b a2
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b a2
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
	bcc CODE_9F8F55
	lda.w #$0002
	tsb.w gmode
CODE_9F8F55:
	stz.w sflags3
	lda.w #DMA_OAM
	sta.w sflags
	stz.w sfhormode
	stz.w iflags
	lda.w #$FFFF
	sta.w RefCnt
	sta.w $0D19
	sta.w $0D1D
	jsl.l CODE_9FB8B4
	jsl.l CODE_9FB9A4
	stz.w Vpos
	stz.w Hpos
	jsl.l ResetBench
	stz.b a2
	jsl.l CODE_9F927D
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9F927D
	jsl.l CODE_9FD252
	lda.w #$0000
	sta.l $7E3448
	lda.w #$000B
	sta.b d0
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9F9323
	sta.b a0
	stz.b a1
CODE_9F8FAD:
	ldx.b a1
	lda.w position,x
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9F8FC1
	lda.b d1
	clc
	adc.w #$0006
	sta.b d1
CODE_9F8FC1:
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
	jsl.l CODE_9B8017
	lda.w sflags
	bit.w #$0001
	bne CODE_9F9060
	lda.w gmclock
	bne CODE_9F9060
	ldx.b d7
CODE_9F9049:
	lda.w gameclock
	beq CODE_9F905D
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs CODE_9F905D
	dec.w gameclock
CODE_9F905D:
	dex
	bne CODE_9F9049
CODE_9F9060:
	lda.b d7
	pha
	jsl.l CODE_9F8625
	pla
	sta.b d7
	sta.w $0ADB
	lda.w gmclock
	beq CODE_9F9079
	pla
	sec
	sbc.b d7
	pha
	bmi CODE_9F9097
CODE_9F9079:
	jsl.l CODE_9B8526
	lda.b d1
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
	sta.b a0
	jsl.l CODE_9C9786
	ldx.b a0
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
	lda.w SoundFadeSpeed
	bne CODE_9F90F3
	lda.w MusicOn
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
