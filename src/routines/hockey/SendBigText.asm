; Send the RenderBigText map ($7EA676, the BigLetterSelect map) and the letter tiles ($7E4EF4, $7E3466 letters) to VRAM
SendBigText:
	lda.w #$0020
	sta.l $7EA676
	sta.l $7EA678
	lda.w #$007E
	sta.b $0E
	lda.w #$A676
	sta.b $0C
	lda.w #$0800
	sta.w $079C
	lda.w #$0000
	sta.b $24
	lda.w #$0020
	sta.b $18
	lda.w #$0002
	sta.b $1A
	ldy.w printy
	sty.b $26
	ldx.w #$0000
	jsl.l MapPartToVRAM
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	ldy.w #$4000
	lda.l $7E3466
	inc a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l DMAToVRAM
	rts
