; Unidentified routine.
CODE_9DBF33:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2B0
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$000D
	sta.w printy
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DC374
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B8
	sta.b $8D
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E79
	sta.b $A5
	bpl CODE_9DBF83
CODE_9DBF80:
	jmp.w $C0BB
