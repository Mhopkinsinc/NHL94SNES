; Unidentified routine.
CODE_9D9A5C:
	phb
	phk
	plb
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	jsr.w $9B9B
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0024
	sta.b $14
	lsr a
	lsr a
	lsr a
	sta.b $16
	clc
	adc.w printx
	sta.w printx
	lda.b $16
	asl a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $14
	sta.b $14
	ldy.w #$0000
CODE_9D9A94:
	lda.b $14
	asl a
	sta.b $02
	lda.b [$0C],y
	and.w #$00FF
	bne CODE_9D9AA8
	lda.w #$FFFF
	sta.b $08
	jmp.w $9B0F
