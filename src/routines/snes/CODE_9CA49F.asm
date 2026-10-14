; Unidentified routine.
CODE_9CA49F:
	lda.l passbits
	and.w #$3FFF
	sta.b d0
	phx
	ldx.w #$0000
CODE_9CA4AC:
	lda.l $7E3509,x
	asl a
	asl a
	xba
	sep #$20
	sta.l passbits,x
	rep #$20
	inx
	cpx.w #$000E
	bcc CODE_9CA4AC
	lda.w #$0000
	sta.l $7E3517
	sta.l $7E3516
	plx
	clc
	rtl
