; Unidentified routine.
CODE_80A568:
	lda.b [$56]
	inc.b $56
	tax
	and.w #$007F
	txy
	bpl CODE_80A58D
CODE_80A573:
	sta.b $52
	lda.b [$56]
	inc.b $56
	tax
	and.w #$007F
	sta.b $54
	lda.b $52
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $54
	txy
	bmi CODE_80A573
CODE_80A58D:
	rts
