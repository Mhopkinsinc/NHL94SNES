; Unidentified routine.
CODE_9E81DB:
	lda.b $A9
	sec
	sbc.w #$FFAD
	bpl CODE_9E81E8
	lda.w #$FFBC
	sta.b $A9
CODE_9E81E8:
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
