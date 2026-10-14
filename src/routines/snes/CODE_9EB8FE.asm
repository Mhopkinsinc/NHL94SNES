; Unidentified routine.
CODE_9EB8FE:
	dec.b a1
	dec.b a1
	txa
	lsr a
	xba
	and.w #$FF00
	ora.b d0
	sta.b [a1]
	lda.w #$0080
	sta.b $8B
	lda.w #DATA8_80D3EB
	sta.b a0
	ldy.b d0
	clc
	adc.b [a0],y
	sta.b a0
	lda.b [a0]
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
	sta.b [a1]
CODE_9EB939:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
CODE_9EB94B:
	rtl
