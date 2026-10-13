; Unidentified routine.
CODE_9ED0FD:
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_9ED10F
	stz.b $8D
	lda.w #$0002
	sta.b $91
CODE_9ED10F:
	ldy.b $91
	lda.w tmgoalie,y
	bpl CODE_9ED12F
CODE_9ED116:
	and.w #$00FF
	cmp.w #$000A
	bcs CODE_9ED12F
	sta.w tmgoalie,y
	lda.w $19D0,y
	bne CODE_9ED12F
	lda.l $7E3138
	sta.b $A9
	jmp.w $D130
