; Unidentified routine.
CODE_9ED0FD:
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l CODE_9ED10F
	stz.b a1
	lda.w #$0002
	sta.b a2
CODE_9ED10F:
	ldy.b a2
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
	sta.b d1
	jmp.w CPgoalie
