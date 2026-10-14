; Pick the controller that owns the pause menu, and rebuild the menu when it changes.
SelectPauseController:
	jsl.l ShowMP5Warning
	jsr.w PulsePauseSide
	jsl.l IntermissionTick
	beq .t1
	jmp.w .6

.t1:
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jsl.l ReadPads
	lda.w pausepad
	bpl .4
	lda.w #$0000
	pha
.loop:
	lda.b $01,s
	asl a
	tax
	lda.w JoyPad,x
	bit.w #$000F
	bne .1
	lda.w $1C84,x
	beq .1
	lda.b $01,s
	jsl.l ReadjoyA
	lda.b d3
	bne .t2
.1:
	lda.b $01,s
	inc a
	sta.b $01,s
	cmp.w #$0005
	bcc .loop
	pla
	jmp.w .5

.t2:
	pla
	asl a
	tax
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	cmp.w pausepad
	beq .3
	stx.w pausepad
	stz.w $0D15
	stz.w $0D13
	jsl.l Pmenu
	jsl.l SendTextMap
	jsr.w PulseUntilRelease
	lda.w #$003C
	sta.w $0AC8
	lda.w #$0014
	sta.w $0AC4
	lda.w $1EB7
	beq .t1x
	cmp.w #$0005
	beq .t1x
	bra .2

.t1x:
	jsl.l ChoosePauseMenu
.2:
	rtl
.3:
	stx.w pausepad
	lda.w #$003C
	sta.w $0AC8
	txa
.4:
	lsr a
	jsl.l ReadjoyA
	dec.w $0AC4
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bne .t1xx
	lda.w $0AC8
	beq .5
	sec
	sbc.w #$0003
	sta.w $0AC8
	beq .1x
	bpl .5
.1x:
	stz.w $0AC8
	ldx.w pausepad
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	sta.w pausepad
	rtl

.t1xx:
	lda.w #$003C
	sta.w $0AC8
.5:
	lda.w $0D2F
	beq .7
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne .7
	dec.w $0CE3
	bne .7
.6:
	lda.w #$1000
	tsb.b d3
.7:
	lda.b d1
	ora.b d3
	bne .t1xxx
	jmp.w SelectPauseController

.t1xxx:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq .rtl
	lda.w #$EA60
	sta.w $0CE3
.rtl:
	rtl
