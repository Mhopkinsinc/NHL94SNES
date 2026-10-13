; Unidentified routine.
CODE_9E8FAB:
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9E8FB5
	ora.w #$C000
CODE_9E8FB5:
	sta.b $AD
	sec
	sbc.w #$FC00
	bpl CODE_9E8FE3
	jsl.l RandomWord
	and.w #$07FF
	eor.w #$FFFF
	inc a
	sta.w $0E01
	sta.b $A5
	jsl.l CODE_9EDE5E
	lda.w #$000A
	ldy.w $0DF9
	cpy.w #$000B
	bcs CODE_9E8FDF
	lda.w #$0004
CODE_9E8FDF:
	jsl.l CODE_9C9ABC
CODE_9E8FE3:
	lda.b $B1
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8FF3
	ora.w #$FC00
CODE_9E8FF3:
	sta.b $A5
	pha
	asl a
	pla
	ror a
	sta.b $A7
	lda.b $B1
	sec
	sbc.b $A5
org $9E9000
	sec
	sbc.b $A7
	sta.b $B1
	bra CODE_9E904D
