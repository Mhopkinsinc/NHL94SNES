; Show the power play box: the time left and the team on the power play
updatepwrplay:
	lda.l $7E34BC
	cmp.w #$0004
	beq .off
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w tmap
	sec
	sbc.w tmap+2
	sta.b d0
	bne .ne
	jmp.w updatepwrplay_clr
.ne:
	bpl .t0
	lda.w sflags
	bit.w #sf2pwrtm
	bne .upp
	jsl.l updatepwrplay_clr
	lda.w #sf2pwrtm
	tsb.w sflags
	bra .upp
.off:
	rtl
.t0:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w sflags
	bit.w #sf2pwrtm
	beq .upp
	jsl.l updatepwrplay_clr
	lda.w #sf2pwrtm
	trb.w sflags
.upp:
	lda.w #sf2pwrplay
	tsb.w sflags
	bne .uppt
	ldx.b a3
	inc.w $1746,x
.uppt:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #DATA8_9CF718>>16
	sta.b a1+2
	lda.w #DATA8_9CF718
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l GetLowestPen
	lda.w gmclock
	bne .time
	lda.b d0
	cmp.w #$0005
	bcs .time
	cmp.w #$0001
	beq .one
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l QueueSound
	bra .time
.one:
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l QueueSound
	phx
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .wide
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w #$0659
	sta.w $094A,y
	sta.w $0CAF
.wide:
	rep #$20
	plx
.time:
	jsl.l PushTime
	jsl.l print
	ldx.b a3
	lda.w tmdata,x
	sta.b a0
	lda.w #TeamList>>16
	sta.b a0+2
	lda.w #$0000
	sta.b a3+2
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	lda.w #DATA8_9CF72A>>16
	sta.b a1+2
	lda.w #DATA8_9CF72A
	sta.b a1
	jsl.l appstring
	lda.b a0
	ldy.w #$0004
	clc
	adc.b [a0],y
	sta.b a0
	adc.b [a0]
	sta.b a0
	sta.b a1
	lda.b a0+2
	sta.b a1+2
	jsl.l appstring
	lda.b a3+2
	sta.b a1+2
	lda.b a3
	sta.b a1
	jsl.l print
	rtl
