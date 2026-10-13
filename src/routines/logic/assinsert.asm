; Unidentified routine.
assinsert:
	lda.w $0F63,x
	dec a
	and.w #$0007
	sta.w $0F63,x
CODE_9E8C18:
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	txa
	asl a
	asl a
	adc.w $0F63,x
	tay
	sep #$20
	lda.b $A5
	sta.w $0F83,y
	rep #$30
	sta.w $0B7D,x
	rtl
