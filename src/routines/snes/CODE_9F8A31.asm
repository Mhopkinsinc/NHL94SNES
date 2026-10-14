; Unidentified routine.
CODE_9F8A31:
	cmp.w #$00E5
	bpl CODE_9F8A44
	cmp.w #$00E0
	bmi CODE_9F8A44
	lda.w #$00E5
	sta.w Ypos,x
	stz.w $0EE3,x
CODE_9F8A44:
	stz.w $1103,x
	stz.w $1123,x
	lda.w Ypos,x
	sta.b $B1
	lda.w Xpos,x
	sta.b $AD
	cmp.w $0E43,x
	bne CODE_9F8A63
	lda.b $B1
	cmp.w $0E83,x
	bne CODE_9F8A63
	jmp.w CODE_9F8AD1
