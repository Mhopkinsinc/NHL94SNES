; Unidentified routine.
CODE_9F8433:
	lda.w $1D81
	bne CODE_9F843C
	lda.w #$1FFF
	tcs
CODE_9F843C:
	stz.b $91
	jsl.l reenergizeteam
	lda.w #$0002
	sta.b $91
	jsl.l reenergizeteam
	stz.w $0CC7
	jsl.l CODE_8086A9
	jsl.l CODE_9FB8B4
	jsl.l CODE_9FC683
	jsl.l CODE_9B9B6B
	lda.w $1EBB
	beq CODE_9F8497
	lda.w #$FFFF
	sta.w $0AC6
	ldy.w #$FFFE
CODE_9F846C:
	iny
	iny
	cpy.w #$000A
	bcs CODE_9F847F
	lda.w $1C84,y
	beq CODE_9F846C
	eor.w #$FFFF
	inc a
	sta.w $0AC6
CODE_9F847F:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9F8493
	stz.w $0AC6
CODE_9F8493:
	jsl.l CODE_9F9365
CODE_9F8497:
	ldx.w #$001C
	stx.b $95
	lda.w #$0000
	sta.l $7E3136
	sta.l $7E3138
	lda.w #$001B
	sta.b $A5
	jsl.l assreplace
	jsl.l CODE_9DD977
	lda.w #$0400
	tsb.w sflags
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	sta.w $0CC1
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9F84E3
	lda.w #$0010
	trb.w sflags
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	bra CODE_9F84EB
