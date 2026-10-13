; Unidentified routine.
CODE_9BC074:
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
	bcc CODE_9BC0A1
	ora.w #$FF00
CODE_9BC0A1:
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0B1
	ora.w #$FF00
CODE_9BC0B1:
	sta.b $A9
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0C1
	ora.w #$FF00
CODE_9BC0C1:
	sec
	sbc.b $A5
	sta.b $A5
	iny
	lda.b [$0C],y
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BC0D4
	ora.w #$FF00
CODE_9BC0D4:
	sec
	eor.w #$FFFF
	adc.b $A9
	sta.b $A9
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9BC0EC
CODE_9BC0E4:
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9BC0EC:
	lda.w attribute,x
	bit.w #$1000
	bne CODE_9BC0FC
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9BC0FC:
	lda.w sfhormode
	beq CODE_9BC10D
	lda.b $A5
	ldy.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A9
	sty.b $A5
CODE_9BC10D:
	plx
	rtl
