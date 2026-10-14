; Unidentified routine.
CODE_9BC002:
	phx
	tay
	lda.w $0D97,y
	dec a
	asl a
	asl a
	tax
	lda.l SpriteFrames,x
	clc
	adc.w #$8000
	sta.b $0C
	lda.l SpriteFrames+2,x
	adc.w #$0082
	sta.b $0E
	tyx
	ldy.w #$0012
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC02F
	ora.w #$FF00
CODE_9BC02F:
	sta.b d0
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC03F
	ora.w #$FF00
CODE_9BC03F:
	sta.b d1
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9BC051
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9BC051:
	lda.w attribute,x
	bit.w #$1000
	bne CODE_9BC061
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9BC061:
	lda.w sfhormode
	beq CODE_9BC072
	lda.b d0
	ldy.b d1
	eor.w #$FFFF
	inc a
	sta.b d1
	sty.b d0
CODE_9BC072:
	plx
	rtl
