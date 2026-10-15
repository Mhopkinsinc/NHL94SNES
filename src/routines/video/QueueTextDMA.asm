; Queue the changed part of the text map for transfer to video memory
QueueTextDMA:
	lda.w textdirtylo
	bmi .rtl
	tay
	asl a
	adc.w #textmap
	sta.b $0C
	lda.w #textmap>>16
	sta.b $0E
	lda.w textdirtyhi
	beq .rtl
	sec
	sbc.w textdirtylo
	inc a
	asl a
	tax
	jsl.l DMAToVRAM
	lda.w #$FFFF
	sta.w textdirtylo
	stz.w textdirtyhi
.rtl:
	rtl
