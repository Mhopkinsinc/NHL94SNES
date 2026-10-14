; Instant replay
ReplayMode:
	lda.w SoundFadeSpeed
	bne ReplayMode
	jsl.l SPCGameUpload
	lda.w #$0000
	sta.l crowdlevel
	lda.w #$0800
	tsb.w sflags
	jsl.l ClrHor
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	lda.l blankchar
	clc
	adc.l $7E35AA
	ldx.w #$0400
	ldy.w #$0000
	jsl.l FillVRAMSplit
	lda.w #$FFFF
	sta.w $0CAB
	sta.l $7E35F0
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0020
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0008
	sta.b $18
	lda.w #$0008
	sta.b $1A
	lda.w #$0000
	sta.w $079C
	lda.w #$2000
	sta.b $14
	lda.l $7E35AA
	ldx.w #$0002
	ldy.w #$0002
	jsl.l MapPartToVRAMOffset
	lda.w ReplayBufferPtr
	pha
	lda.w $0D21
	pha
	lda.w #$0020
	trb.w sflags
	lda.w Vpos
	pha
	lda.w Hpos
	pha
	lda.w ReplayBufferPtr
	cmp.w #$577E
	lda.w $0D21
	sbc.w #$007E
	bcs .1
.loop:
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
.1:
	lda.w #$E676
	cmp.w ReplayBufferPtr
	lda.w #$007E
	sbc.w $0D21
	bcc .loop
	lda.w ReplayBufferPtr
	sec
	sbc.w #$577E
	sta.b $08
	lda.w $0D21
	sbc.w #$007E
	sta.b $0A
	lda.w #$007A
	sta.b $04
	jsl.l Div32U
	lda.b $0A
	bne .loop
	lda.w $0D21
	sta.b $9B
	lda.w ReplayBufferPtr
	sta.b a4
	lda.w #$0000
	pha
.loop2:
	jsl.l suba4
	pla
	inc a
	pha
	lda.b d7
	bne .loop2
	pla
	lsr a
	pha
.loop3:
	lda.b $01,s
	beq .t1
	jsl.l adda4
	pla
	dec a
	pha
	bra .loop3

.t1:
	pla
	lda.w Hpos
	sta.w $0CBD
	lda.w Vpos
	sta.w $0CBF
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	stz.w brightness
	lda.w #$000A
	sta.w fadestep
	ldx.w #BrightnessHook>>16
	lda.w #BrightnessHook
	jsl.l SetFrameHook
	jsl.l ScreenOn
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w .13
.10:
	lda.w $0CAB
	bpl .t2
	jmp.w .7

.t2:
	tax
	lda.w Xpos,x
	sta.w $0D75
	cmp.w $0CBD
	bpl .t1x
	lda.w $0CBD
	sec
	sbc.w #$0004
	cmp.w $0D75
	bpl .2
.1x:
	lda.w $0D75
.2:
	bra .5

.t1x:
	lda.w $0CBD
	clc
	adc.w #$0004
	cmp.w $0D75
	bmi .5
	lda.w $0D75
.5:
	cmp.w #$FFC0
	bpl .1xx
	lda.w #$FFC0
.1xx:
	cmp.w #$0040
	bmi .2x
	lda.w #$0040
.2x:
	sta.w Hpos
	sta.w $0CBD
	lda.w Ypos,x
	sta.w $0DD7
	cmp.w $0CBF
	bpl .t1xx
	lda.w $0CBF
	sec
	sbc.w #$0004
	cmp.w $0DD7
	bpl .4
.3:
	lda.w $0DD7
.4:
	bra .6

.t1xx:
	lda.w $0CBF
	clc
	adc.w #$0004
	cmp.w $0DD7
	bmi .6
	lda.w $0DD7
.6:
	cmp.w #$FF39
	bpl .2xx
.1xxx:
	lda.w #$FF39
.2xx:
	cmp.w #$0100
	bmi .4x
.3x:
	lda.w #$0100
.4x:
	sta.w Vpos
	sta.w $0CBF
	txa
	lsr a
	sta.w $0AF3
	jmp.w .12

.7:
	cmp.w #$FFFF
	beq .11
	lda.w $0D75
	cmp.w $0CBD
	bpl .t2x
	lda.w $0CBD
	sec
	sbc.w #$0002
	cmp.w $0D75
	bpl .1xxxx
	lda.w $0D75
.1xxxx:
	bra .8

.t2x:
	lda.w $0CBD
	clc
	adc.w #$0002
	cmp.w $0D75
	bmi .8
	lda.w $0D75
.8:
	cmp.w #$FFC0
	bpl .1xxxxx
	lda.w #$FFC0
.1xxxxx:
	cmp.w #$0040
	bmi .2xxx
	lda.w #$0040
.2xxx:
	sta.w Hpos
	sta.w $0CBD
	lda.w $0DD7
	cmp.w $0CBF
	bpl .t1xxx
	lda.w $0CBF
	sec
	sbc.w #$0002
	cmp.w $0DD7
	bpl .3xx
	lda.w $0DD7
.3xx:
	bra .9

.t1xxx:
	lda.w $0CBF
	clc
	adc.w #$0002
	cmp.w $0DD7
	bmi .9
	lda.w $0DD7
.9:
	cmp.w #$FF39
	bpl .2xxxx
.1xxxxxx:
	lda.w #$FF39
.2xxxx:
	cmp.w #$0100
	bmi .4xx
.3xxx:
	lda.w #$0100
.4xx:
	sta.w Vpos
	sta.w $0CBF
	bra .12
.11:
	lda.w Hpos
	sta.w $0CBD
	lda.w Vpos
	sta.w $0CBF
.12:
	lda.b d7
	sta.w $0ADB
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	stz.w $0CB9
.13:
	ldx.b d7
	bne .2xxxxx
.1xxxxxxx:
	inx
.2xxxxx:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l ReadPads
	jsl.l ReadPausePad
	lda.w #$0001
	sta.b d7
	lda.b d0
	bit.w #$0008
	beq .t2xx
	jmp.w .16

.t2xx:
	sta.b d5
	lda.w #$FFFF
	sta.b d4
	sta.b $B7
	sta.w $0CAB
	lda.w #$0016
	sta.b a0
.loopx:
	ldy.b a0
	lda.w position,y
	bmi .4xxx
	lda.w Xpos,y
	sec
	sbc.w $0D75
	sta.b d0
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w $0DD7
	sta.b d1
	sta.b d3
	jsl.l vtoa
	cmp.w #$0008
	beq .4xxx
	sec
	sbc.b d5
	beq .1xxxxxxxx
	cmp.w #$0001
	beq .1xxxxxxxx
	cmp.w #$0007
	bne .4xxx
.1xxxxxxxx:
	lda.b d2
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2xxxxxx
	ora.w #$E000
.2xxxxxx:
	tax
	jsl.l Mul8S
	sta.b d0
	lda.b d3
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .3xxxx
	ora.w #$E000
.3xxxx:
	tax
	jsl.l Mul8S
	clc
	adc.b d0
	cmp.b $B7
	bcs .4xxx
	sta.b $B7
	lda.b a0
	sta.b d4
.4xxx:
	dec.b a0
	dec.b a0
	bpl .loopx
	lda.b d4
	bmi .t1xxxx
	lda.b $B7
	cmp.w #$0002
	bcs .t1xxxx
	lda.b d4
	sta.w $0CAB
	lda.w #$001E
	sta.b d7
	lda.w #$0020
	trb.w sflags
	jmp.w .10

.t1xxxx:
	phk
	plb
	jsl.l ReadPausePad
	lda.w #$FFFE
	sta.w $0CAB
	lda.w #$0020
	tsb.w sflags
	asl.b d0
	asl.b d0
	ldy.b d0
	lda.w .14,y
	adc.w $0D75
	sta.b d2
	ldx.w #$0020
	lda.w .14,y
	xba
	and.w #$FF00
	sta.w $0EC3,x
	lda.w .14+2,y
	clc
	adc.w $0DD7
	sta.b d3
	lda.w .14+2,y
	xba
	and.w #$FF00
	sta.w $0EE3,x
	lda.b d2
	pha
	lda.b d3
	pha
	stx.b a3
	stz.w Wallcos,x
	stz.w Wallsin,x
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l checkwallcoll
	pla
	sta.b d3
	pla
	sta.b d2
	lda.w Wallsin,x
	ora.w Wallcos,x
	beq .4xxxx
.1xxxxxxxxx:
	lda.w Wallsin,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .2xxxxxxx
	ora.w #$FF00
.2xxxxxxx:
	clc
	adc.w $0D75
	sta.b d2
	lda.w Wallcos,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .3xxxxx
	ora.w #$FF00
.3xxxxx:
	eor.w #$FFFF
	inc a
	clc
	adc.w $0DD7
	sta.b d3
.4xxxx:
	lda.b d2
	sta.w $0D75
	sta.w Hpos
	lda.b d3
	sta.w $0DD7
	sta.w Vpos
	lda.w #$0010
	sta.w $0AF3
	jmp.w .10
.14:		; x and y steps (words) for eight directions
	dw $0000,$0002, $0002,$0002, $0002,$0000, $0002,$FFFE
	dw $0000,$FFFE, $FFFE,$FFFE, $FFFE,$0000, $FFFE,$0002
.16:
	lda.w $0CAB
	cmp.w #$FFFF
	bne .9x
	lda.w $0AE7
	cmp.w #$000F
	beq .t1xxxxx
	asl a
	tax
	lda.w #$000F
	sta.w $0AF3
	lda.w Xpos,x
	sta.w $0D75
	lda.w Ypos,x
	sta.w $0DD7
	bra .9x

.t1xxxxx:
	lda.w #$000F
	sta.w $0AF3
	lda.w $0D71
	cmp.w #$FF78
	bpl .2xxxxxxxx
.1xxxxxxxxxx:
	lda.w #$FF78
.2xxxxxxxx:
	cmp.w #$0088
	bmi .4xxxxx
.3xxxxxx:
	lda.w #$0088
.4xxxxx:
	sta.w $0D75
	lda.w pucky
	cmp.w #$FED4
	bpl .6x
.5x:
	lda.w #$FED4
.6x:
	cmp.w #$012C
	bmi .8x
.7x:
	lda.w #$012C
.8x:
	sta.w $0DD7
.9x:
	lda.b d1
	bit.w #$8000
	beq .2xxxxxxxxx
	lda.l $7E35F0
	beq .1xxxxxxxxxxx
	lda.l blankchar
	clc
	adc.l $7E35AA
	ldx.w #$0180
	ldy.w #$0000
	jsl.l FillVRAMSplit
	jsl.l WaitFrame
	lda.w #$0000
	sta.l $7E35F0
.1xxxxxxxxxxx:
	lda.w sflags3
	eor.w #$0002
	sta.w sflags3
.2xxxxxxxxx:
	lda.b d3
	bit.w #$0020
	bne .t1xxxxxx
	bit.w #$0050
	bne .t5
	lda.b d1
	bit.w #$2000
	bne .t3
	bit.w #$1000
	bne .t2xxx
	lda.b d3
	bit.w #$0080
	bne .t4
	bit.w #$4000
	beq .12x
	jsl.l suba4
	jsl.l suba4
	bra .11x

.t1xxxxxx:
	jsl.l suba4
	ldx.w #$0006
	bra .10x

.t2xxx:
	jmp.w .15

.t3:
	lda.w #$FFFF
	sta.w $0CAB
	lda.w #$0020
	trb.w sflags
	jmp.w .13

.t4:
	jsl.l adda4
	jsl.l adda4
	bra .11x

.t5:
	jsl.l adda4
	ldx.w #$0006
	lda.b d3
	bit.w #$0010
	bne .10x
	ldx.w #$000C
.10x:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
.11x:
	jsl.l SoundVoicesOff
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w .10
.12x:
	lda.w sflags3
	bit.w #$0002
	bne .t1xxxxxxx
	jmp.w .13

.t1xxxxxxx:
	jsl.l adda4
	lda.b d7
	beq .11x
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$00FF
	beq .13x
	cmp.w #$0016
	bcs .t2xxxx
	lda.w $0CB7
	sta.b $64
	lda.w $0CB3
	and.w #$00FF
	jsl.l QueueSound
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1xxxxxxxxxxxx
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CB5
	sta.w $094A,y
.1xxxxxxxxxxxx:
	rep #$20
	bra .13x

.t2xxxx:
	sec
	sbc.w #$0015
	jsl.l StreamSfx
.13x:
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$00FF
	beq .14x
	cmp.w #$0016
	bcs .t1xxxxxxxx
	lda.w $0CB1
	sta.b $64
	lda.w $0CAD
	and.w #$00FF
	jsl.l QueueSound
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1xxxxxxxxxxxxx
org $9BB001
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CAF
	sta.w $094A,y
.1xxxxxxxxxxxxx:
	rep #$20
	bra .14x

.t1xxxxxxxx:
	sec
	sbc.w #$0015
	jsl.l StreamSfx
.14x:
	jmp.w .10
.15:
	lda.w #$000F
	sta.w $0AF3
	jsl.l SoundVoicesOff
	pla
	sta.w Hpos
	pla
	sta.w Vpos
	pla
	sta.w $0D21
	pla
	sta.w ReplayBufferPtr
	lda.w #$0020
	trb.w sflags
	lda.w $0D21
	sta.b $9B
	lda.w ReplayBufferPtr
	sta.b a4
	jsl.l RestoreReplayFrame
	lda.w #$0800
	trb.w sflags
	jsl.l SetHor
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	jsl.l FadeOut
	jsl.l FadeOutSound
.loopxx:
	lda.w brightness
	bne .loopxx
	lda.w SoundFadeSpeed
	bne .loopxx
	jsl.l forceblack
	lda.w $1D81
	bne .1xxxxxxxxxxxxxx
	lda.w $0CBB
	beq .1xxxxxxxxxxxxxx
	jsl.l SPCMenuUpload
	lda.l $7E34BC
	beq .t1xxxxxxxxx
	cmp.w #$0004
	beq .t1xxxxxxxxx
	lda.l playoffRoundIdx
	cmp.w #$0002
	bcc .t1xxxxxxxxx
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w .1xxxxxxxxxxxxxx

.t1xxxxxxxxx:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
.1xxxxxxxxxxxxxx:
	rtl
