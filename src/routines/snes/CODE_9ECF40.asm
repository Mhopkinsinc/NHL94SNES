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
	sta.w $0D0D
	lda.b $01,s
	and.w #$0040
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.w $0D0D
	pla
	and.w #$0003
	pha
	asl a
	tax
	lda.l printfontset,x
	sta.l printfontset
	pla
	dec a
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	sta.w printm
	iny
	lda.b [a1],y
	and.w #$001F
	sta.w printx
	iny
	lda.b [a1],y
	and.w #$001F
	sta.w printy
	iny
	jmp.w CODE_80CE2B
