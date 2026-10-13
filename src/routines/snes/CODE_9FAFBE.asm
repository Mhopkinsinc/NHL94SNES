; Unidentified routine.
CODE_9FAFBE:
	stz.w $0D71
	stz.w pucky
	stz.w $0DF9
	stz.w puckvx
	stz.w puckvy
	stz.w $0E01
	phx
	ldx.w #$0000
	lda.w #$0002
	sta.b $B5
	lda.w $1E91
	beq CODE_9FAFE6
	ldx.w #$000C
	lda.w #$0000
	sta.b $B5
CODE_9FAFE6:
	lda.w #$0010
	sta.b $A5
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
org $9FB003
	ldx.b $B5
	lda.w $19D0,x
	beq CODE_9FB02A
	lda.w $1C90,x
	beq CODE_9FB02A
	ldy.w #$0000
CODE_9FB012:
	lda.w $19F6,y
	bmi CODE_9FB01B
	cmp.b $B5
	beq CODE_9FB024
CODE_9FB01B:
	iny
	iny
	cpy.w #$000A
	bcc CODE_9FB012
	bra CODE_9FB02A
