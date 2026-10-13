; Unidentified routine.
CODE_9BC002:
	phx
	tay
	lda.w frame,y
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
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC03F
	ora.w #$FF00
CODE_9BC03F:
	sta.b $A9
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9BC051
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9BC051:
	lda.w attribute,x
	bit.w #$1000
	bne CODE_9BC061
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9BC061:
	lda.w sfhormode
	beq CODE_9BC072
	lda.b $A5
	ldy.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A9
	sty.b $A5
CODE_9BC072:
	plx
	rtl
