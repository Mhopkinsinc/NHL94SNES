; Unidentified routine.
CODE_80AC8B:
	pha
	lda.w $08FA,y
	cmp.b #$10
	bcc CODE_80AC96
	jsr.w CODE_80A51C
CODE_80AC96:
	rep #$20
	lda.w $092A,x
	sta.b $4E
	lda.w $094A,x
	sta.b $60
	lda.w $093A,x
	sta.b $5A
	lda.w $096A,x
	inc a
	sta.w $096A,x
	ldy.b #$1A
	cmp.b ($4E),y
	bcs CODE_80ACBF
	ldy.b #$18
	cmp.b ($4E),y
	bcc CODE_80ACBF
	dec.w $097A,x
	bmi CODE_80ACC2
CODE_80ACBF:
	jmp.w CODE_80AD55
