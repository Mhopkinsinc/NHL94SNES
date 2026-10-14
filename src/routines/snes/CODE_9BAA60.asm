; Unidentified routine.
CODE_9BAA60:
	lda.w SoundFadeSpeed
	bne CODE_9BAA60
	jsl.l CODE_9C98DF
	lda.w #$0000
	sta.l $7E35E0
	lda.w #$0800
	tsb.w sflags
	jsl.l ClrHor
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0400
	ldy.w #$0000
	jsl.l CODE_808862
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
	jsl.l CODE_808A11
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
	stz.w $0AD3
	lda.w #$000A
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	jsl.l CODE_8086BD
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w CODE_9BACE5
