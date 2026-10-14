; Unidentified routine.
CODE_9FB3D7:
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	lda.w #$0008
	trb.w tmflags
	trb.w $17E0
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9FB409
	lda.w sfhormode
	beq CODE_9FB409
	lda.w #$0040
	tsb.w sflags
	jsl.l CODE_9FB9A4
CODE_9FB409:
	lda.l $7E344E
	bne CODE_9FB41F
	lda.w $19D0
	beq CODE_9FB41F
	jsl.l CODE_9FB5E5
	lsr a
	sta.b d0
	jsl.l CODE_9FB48B
CODE_9FB41F:
	lda.l $7E344E
	bne CODE_9FB435
	lda.w $19D2
	beq CODE_9FB435
	jsl.l CODE_9FB5F3
	lsr a
	sta.b d0
	jsl.l CODE_9FB4A2
CODE_9FB435:
	lda.w #$0000
	sta.l $7E344E
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	jsl.l CODE_9FB44C
	jmp.w CODE_9FB518
