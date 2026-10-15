; Read a variable length number (7 bits a byte, top bit = more) from the track at [$56]
ReadVarLen:
	lda.b [EventPtr]
	inc.b EventPtr
	tax
	and.w #$007F
	txy
	bpl .rts
.loop:
	sta.b VarLenAcc
	lda.b [EventPtr]
	inc.b EventPtr
	tax
	and.w #$007F
	sta.b VarLenByte
	lda.b VarLenAcc
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b VarLenByte
	txy
	bmi .loop
.rts:
	rts
