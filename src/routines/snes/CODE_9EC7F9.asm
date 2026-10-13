; Unidentified routine.
CODE_9EC7F9:
	phx
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	adc.b $14
	plx
CODE_9EC803:
	cmp.l $7E37F4,x
	beq CODE_9EC81F
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9EC817
	sta.w $0CD5
CODE_9EC817:
	cmp.w $0CD7
	bcc CODE_9EC81F
	sta.w $0CD7
CODE_9EC81F:
	inc.w printx
	inx
	inx
	iny
	bra CODE_9EC7DF
