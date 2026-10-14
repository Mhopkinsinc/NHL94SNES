; Unidentified routine.
CODE_9BACC1:
	lda.w Hpos
	sta.w $0CBD
	lda.w Vpos
	sta.w $0CBF
CODE_9BACCD:
	lda.b d7
	sta.w $0ADB
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0CB9
CODE_9BACE5:
	ldx.b d7
	bne .2
.1:
	inx
.2:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.w #$0001
	sta.b d7
	lda.b d0
	bit.w #$0008
	beq .t2
	jmp.w CODE_80AE77

.t2:
	sta.b d5
	lda.w #$FFFF
	sta.b d4
	sta.b $B7
	sta.w $0CAB
	lda.w #$0016
	sta.b a0
.loop:
	ldy.b a0
	lda.w position,y
	bmi .4
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
	beq .4
	sec
	sbc.b d5
	beq .1x
	cmp.w #$0001
	beq .1x
	cmp.w #$0007
	bne .4
.1x:
	lda.b d2
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2x
	ora.w #$E000
.2x:
	tax
	jsl.l CODE_808F7D
	sta.b d0
	lda.b d3
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .3
	ora.w #$E000
.3:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d0
	cmp.b $B7
	bcs .4
	sta.b $B7
	lda.b a0
	sta.b d4
.4:
	dec.b a0
	dec.b a0
	bpl .loop
	lda.b d4
	bmi .t1
	lda.b $B7
	cmp.w #$0002
	bcs .t1
	lda.b d4
	sta.w $0CAB
	lda.w #$001E
	sta.b d7
	lda.w #$0020
	trb.w sflags
	jmp.w CODE_9BABAB

.t1:
	phk
	plb
	jsl.l CODE_9B851F
	lda.w #$FFFE
	sta.w $0CAB
	lda.w #$0020
	tsb.w sflags
	asl.b d0
	asl.b d0
	ldy.b d0
	lda.w DATA8_9BAE57,y
	adc.w $0D75
	sta.b d2
	ldx.w #$0020
	lda.w DATA8_9BAE57,y
	xba
	and.w #$FF00
	sta.w Xvel,x
	lda.w $AE59,y
	clc
	adc.w $0DD7
	sta.b d3
	lda.w $AE59,y
	xba
	and.w #$FF00
	sta.w Yvel,x
	lda.b d2
	pha
	lda.b d3
	pha
	stx.b a3
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l checkwallcoll
	pla
	sta.b d3
	pla
	sta.b d2
	lda.w $1123,x
	ora.w $1103,x
	beq .4x
.1xx:
	lda.w $1123,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .2xx
	ora.w #$FF00
.2xx:
	clc
	adc.w $0D75
	sta.b d2
	lda.w $1103,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .3x
	ora.w #$FF00
.3x:
	eor.w #$FFFF
	inc a
	clc
	adc.w $0DD7
	sta.b d3
.4x:
	lda.b d2
	sta.w $0D75
	sta.w Hpos
	lda.b d3
	sta.w $0DD7
	sta.w Vpos
	lda.w #$0010
	sta.w $0AF3
	jmp.w CODE_9BABAB
