; Blank the 6 x 6 picture area at x, y of the text map (under a logo sprite)
ClearPictureBox:
	lda.w #$007E
	sta.b $12
	lda.w #textmap
	sta.b $10
	stx.b $14
	tya
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $14
	asl a
	adc.b $10
	sta.b $10
	lda.w #$0006
	sta.b $14
.loop:
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$000C
	jsl.l MemFill
	lda.b $10
	clc
	adc.w #$0040
	sta.b $10
	dec.b $14
	bne .loop
	rtl
