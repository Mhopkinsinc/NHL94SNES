; Unidentified routine.
CODE_9C8B69:
	lda.w $1DF9
	sta.b $A5
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF34F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C8BCE
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	ldx.w $1DBD
CODE_9C8B9D:
	txy
CODE_9C8B9E:
	iny
	jsl.l CODE_9C8C22
	lda.w $1DC9
	beq CODE_9C8BBE
CODE_9C8BA8:
	sep #$20
	lda.w $1DFB,y
	sta.w $1DC9
	lda.w $1DFB,x
	sta.w $1DFB,y
	lda.w $1DC9
	sta.w $1DFB,x
	rep #$20
CODE_9C8BBE:
	cpy.w $1DC1
	bcc CODE_9C8B9E
	inx
	cpx.w $1DC1
	bcc CODE_9C8B9D
	jsl.l CODE_9C8934
	rtl
