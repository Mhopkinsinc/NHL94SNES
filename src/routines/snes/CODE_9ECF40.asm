; Unidentified routine.
CODE_9ECF40:
	eor.w #$FFFF
	inc a
	pha
	and.w #$0030
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.w printa
	lda.b $01,s
	and.w #$0040
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.w printa
	pla
	and.w #$0003
	pha
	asl a
	tax
	lda.l $7E35A8,x
	sta.l $7E35A8
	pla
	dec a
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	sta.w $0CD9
	iny
	lda.b [$8D],y
	and.w #$001F
	sta.w printx
	iny
	lda.b [$8D],y
	and.w #$001F
	sta.w printy
	iny
	jmp.w CODE_80CE2B
