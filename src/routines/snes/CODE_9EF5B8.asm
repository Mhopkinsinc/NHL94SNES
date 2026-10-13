; Unidentified routine.
CODE_9EF5B8:
	phx
	ldy.b $91
	lda.w tmsort,y
	tax
	lda.w #$0005
	sta.b $B1
CODE_9EF5C4:
	lda.w position,x
	bmi CODE_9EF5D2
	beq CODE_9EF5D2
	stz.w $1563,x
	jsl.l assinsert
CODE_9EF5D2:
	inx
	inx
	dec.b $B1
	bpl CODE_9EF5C4
	plx
CODE_9EF5D9:
	rtl
