; Main game loop: wait for a frame, the clock, the music, one frame of game logic, the pause
Gameloop:
	lda.b $83
	sec
	sbc.w oldvcount
	beq Gameloop
	inc.w $1D6D
	lda.w #$003C
	ldx.w $1D6D
	jsl.l Mul16x8U
	lda.w $0764
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $0A98
	lda.w gsp
	cmp.w #$0002
	bne .1
	lda.w MusicOn
	bne .1
	jsl.l RandomWord
	and.w #$0FFF
	bne .1
	lda.w #$0005
	jsl.l PlayTeamSong
.1:
	jsl.l RandomWord
	lda.b $83
	tax
	sec
	sbc.w oldvcount
	sta.b d7
	sta.w $0ADB
	asl a
	sta.w impactstep
	asl a
	asl a
	asl a
	sta.w velstep
	asl a
	sta.w gravstep
	asl a
	adc.w gravstep
	sta.w gravstep
	stx.w lastframevc
	stx.w oldvcount
	jsl.l ReadPads
	lda.w sflags
	bit.w #$0001
	bne .4
	lda.w gmclock
	bne .4
	lda.w $1D81
	bne .t1
	lda.w $163A
	beq .t1
	ldx.b d7
	lda.w $1E9F
	sec
	sbc.b d7
	sta.w $1E9F
	bne .2
	jsl.l EndPenaltyShot
.2:
	bra .4

.t1:
	ldx.b d7
.loop:
	lda.w gameclock
	beq .2x
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs .2x
	dec.w gameclock
	lda.w CwdExciteLvl
	clc
	adc.w #$FFFD
	bmi .1x
	sta.w CwdExciteLvl
.1x:
	jsl.l CheckCrowdMeter
.2x:
	dex
	bne .loop
.4:
	lda.w cheercnt
	beq .1xx
	lda.b $83
	sec
	sbc.w cheervc
	cmp.w #$0096
	bcc .1xx
	dec.w cheercnt
	lda.w cheervc
	clc
	adc.w #$0096
	sta.w cheervc
.1xx:
	jsl.l DoGameFrame
	jsl.l demoread
	lda.w sflags
	bit.w #$0001
	bne .2xx
	lda.w $1A0E
	beq .3
	lda.w gmode
	bit.w #$0010
	bne .3
	lda.w #sfpz
	tsb.w sflags
.2xx:
	jsl.l Pausemode
.3:
	lda.w $1D81
	beq .t1x
	lda.w $1D87
	beq .t1x
	rtl

.t1x:
	jmp.w Gameloop
