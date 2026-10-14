; Unidentified routine.
CODE_9EC7F9:
	phx
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	adc.b $14
	plx
CODE_9EC803:
	cmp.l textmap,x
	beq CODE_9EC81F
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs CODE_9EC817
	sta.w textdirtylo
CODE_9EC817:
	cmp.w textdirtyhi
	bcc CODE_9EC81F
	sta.w textdirtyhi
CODE_9EC81F:
	inc.w printx
	inx
	inx
	iny
	bra CODE_9EC7DF
