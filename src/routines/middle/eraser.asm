; Unidentified routine.
eraser:
	phx
	lda.b $AD
	clc
	adc.l $7E35A8
	sta.b $AD
	stz.b $AB
CODE_9FBDA8:
	lda.w printy
	clc
	adc.b $AB
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	adc.w $0CD9
	tax
	ldy.b $A5
	lda.b $AD
CODE_9FBDBF:
	sta.l $7E37F4,x
	inx
	inx
	dey
	bne CODE_9FBDBF
	inc.b $AB
	lda.b $AB
	cmp.b $A9
	bne CODE_9FBDA8
	plx
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	cmp.w $0CD5
	bcs CODE_9FBDE4
	sta.w $0CD5
CODE_9FBDE4:
	lda.w printy
	clc
	adc.b $A9
	and.w #$001F
	sta.w printy
	dec a
	and.w #$001F
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	adc.b $A5
	dec a
	cmp.w $0CD7
	bcc CODE_9FBE07
	sta.w $0CD7
CODE_9FBE07:
	rtl
