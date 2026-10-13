; Unidentified routine.
CODE_9EB8FE:
	dec.b $8D
	dec.b $8D
	txa
	lsr a
	xba
	and.w #$FF00
	ora.b $A5
	sta.b [$8D]
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80D3EB
	sta.b $89
	ldy.b $A5
	clc
	adc.b [$89],y
	sta.b $89
	lda.b [$89]
	and.w #$00FF
	beq CODE_9EB939
	lda.w pflags,x
	pha
	ora.w #$4000
	sta.w pflags,x
	pla
	bit.w #$4000
	beq CODE_9EB939
	lda.w #$0000
	sta.b [$8D]
CODE_9EB939:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
CODE_9EB94B:
	rtl
