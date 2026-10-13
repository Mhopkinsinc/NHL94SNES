; Unidentified routine.
CODE_9E8BE6:
	lda.w $0F63,x
	inc a
	and.w #$0007
	sta.w $0F63,x
	phx
	phy
	txa
	asl a
	asl a
	adc.w $0F63,x
	tay
	lda.w $0F83,y
	and.w #$00FF
	ply
	plx
	sta.w $0B7D,x
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	rtl
