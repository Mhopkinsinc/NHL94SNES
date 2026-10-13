; Unidentified routine.
CODE_80A3D8:
	php
	sep #$30
	stx.b $52
	tya
	tax
	asl a
	tay
	rep #$20
	lda.w #$0000
CODE_80A3E6:
	sta.w $086A,y
	sta.w $0848,y
	iny
	iny
	inx
	cpx.b $52
	bne CODE_80A3E6
	plp
	rts
