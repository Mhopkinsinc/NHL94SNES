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
	lda.b r0+1,s
	asl a
	tax
	lda.w JoyPad,x
	bit.w #$000F
	bne .1
	lda.w cont1team,x
	beq .1
	lda.b r0+1,s
	jsl.l ReadjoyA
	lda.b d3
	bne .t2
.1:
	lda.b r0+1,s
	inc a
	sta.b r0+1,s
	cmp.w #$0005
	bcc .loop
	pla
	jmp.w .5

.t2:
	pla
	asl a
	tax
	lda.w cont1team,x
	eor.w #$FFFF
	inc a
	cmp.w pausepad
	beq .3
	stx.w pausepad
	stz.w psitem
	stz.w psfirst
	jsl.l Pmenu
	jsl.l SendTextMap
	jsr.w PulseUntilRelease
	lda.w #$003C
	sta.w pausepadidle
	lda.w #$0014
	sta.w repeatdelay
	lda.w pmenulist
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
	sta.w pausepadidle
	txa
.4:
	lsr a
	jsl.l ReadjoyA
	dec.w repeatdelay
	dec.w repeatdelay
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bne .t1xx
	lda.w pausepadidle
	beq .5
	sec
	sbc.w #$0003
	sta.w pausepadidle
	beq .1x
	bpl .5
.1x:
	stz.w pausepadidle
	ldx.w pausepad
	lda.w cont1team,x
	eor.w #$FFFF
	inc a
	sta.w pausepad
	rtl

.t1xx:
	lda.w #$003C
	sta.w pausepadidle
.5:
	lda.w demoflag
	beq .7
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	bne .7
	dec.w pausetimer
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
	lda.w cont1team
	ora.w cont2team
	ora.w cont3team
	ora.w cont4team
	ora.w cont5team
	beq .rtl
	lda.w #$EA60
	sta.w pausetimer
.rtl:
	rtl
