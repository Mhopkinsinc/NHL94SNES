; Unidentified routine.
CODE_9E8BE6:
	lda.w assnum,x
	inc a
	and.w #$0007
	sta.w assnum,x
	phx
	phy
	txa
	asl a
	asl a
	adc.w assnum,x
	tay
	lda.w asslist,y
	and.w #$00FF
	ply
	plx
	sta.w $0B7D,x
	lda.w pflags,x
	ora.w #$0002
	sta.w pflags,x
	rtl
