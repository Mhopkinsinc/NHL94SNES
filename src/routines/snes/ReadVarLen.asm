; Read a variable length number (7 bits a byte, top bit = more) from the track at [$56]
ReadVarLen:
	lda.b [$56]
	inc.b $56
	tax
	and.w #$007F
	txy
	bpl .rts
.loop:
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
	bmi .loop
.rts:
	rts
