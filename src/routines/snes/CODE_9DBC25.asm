; Unidentified routine.
CODE_9DBC25:
	lda.w #$0060
	sta.w $0BED
	ldx.w #$0000
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $A5
	sta.l $7FA000,x
	ldx.w #$0002
	ldy.w #$0002
	lda.b [$0C],y
	sta.b $A7
	sta.l $7FA000,x
	ldx.w #$0004
	lda.w #$0010
	sta.l $7FA000,x
	lda.b $A5
	ldx.b $A7
	jsl.l CODE_808F4C
	clc
	adc.w #$0006
	sta.b $A9
	ldx.w #$0006
	ldy.w #$0006
	sep #$20
CODE_9DBC67:
	lda.b [$0C],y
	inc a
	sta.l $7FA000,x
	iny
	cmp.b #$00
	beq CODE_9DBC7E
	lda.b [$0C],y
	bit.b #$1C
	beq CODE_9DBC7E
	lda.b #$70
	sta.w $0BED
CODE_9DBC7E:
	iny
	inx
	cpx.b $A9
	bcc CODE_9DBC67
	rep #$20
	ldx.b $A5
	ldy.b $A7
	rts
