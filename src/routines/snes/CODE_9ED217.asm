; Unidentified routine.
CODE_9ED217:
	sta.w $1003,x
	lda.w $0AD9
	bpl CODE_9ED214
	lda.w puckvy
	ldy.w pfgoal,x
	beq CODE_9ED22B
	eor.w #$FFFF
	inc a
CODE_9ED22B:
	cmp.w #$F800
	bmi CODE_9ED214
	stz.b $8D
	lda.w #$0002
	sta.b $91
	lda.w pfteam,x
	beq CODE_9ED243
	stz.b $91
	lda.w #$0002
	sta.b $8D
CODE_9ED243:
	ldy.b $91
	lda.w $17AE,y
	cmp.w #$0096
	bcc CODE_9ED214
CODE_9ED24D:
	jsr.w CODE_9EDC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	asl.w $12E3,x
	jsl.l CODE_9ED263
	lsr.w $12E3,x
	rtl
