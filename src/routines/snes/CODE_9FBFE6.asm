; Unidentified routine.
CODE_9FBFE6:
	stx.w $0D23
	cmp.w #$0019
	bcs CODE_9FBFDA
	sta.b $C7
	adc.w $0D25
	and.w #$001F
	sta.w $0D25
	adc.w #$001D
	sec
	sbc.b $C7
	and.w #$001F
org $9FC002
	sta.b $C9
	txa
	clc
	adc.w #$001D
	sec
	sbc.b $C7
	tax
CODE_9FC00D:
	txa
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $C5
	asl a
	adc.b $C5
	adc.w #$C800
	adc.w #$0006
	sta.b $C5
	lda.b $C9
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w #$0400
	sta.b $C9
	lda.b $C7
	sta.b $04
CODE_9FC030:
	lda.w #$007F
	sta.b $0E
	lda.b $C5
	sta.b $0C
	ldy.b $C9
	ldx.w #$0040
	jsl.l CODE_80891F
	lda.b $C5
	clc
	adc.w #$0040
	sta.b $0C
	lda.b $C9
	clc
	adc.w #$0400
	tay
	ldx.w #$0020
	jsl.l CODE_80891F
	lda.b $C5
	clc
	adc.w #$0060
	sta.b $C5
	lda.b $C9
	clc
	adc.w #$0020
	and.w #$03FF
	ora.w #$0400
	sta.b $C9
	dec.b $04
	bne CODE_9FC030
CODE_9FC072:
	lda.w Hscroll
	clc
	adc.w #$00C0
	sta.w $07DA
	lda.w Vscroll
	and.w #$0007
	sta.b $14
	lda.w $0D25
	asl a
	asl a
	asl a
	ora.b $14
	sta.w $07DC
	rtl
