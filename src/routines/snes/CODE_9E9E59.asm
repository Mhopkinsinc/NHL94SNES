; Unidentified routine.
CODE_9E9E59:
	ldy.b $91
	lda.w SPA,y
	cmp.w #SPAstumble
	beq CODE_9E9E69
	lda.w #$FFFF
	sta.w puckc
CODE_9E9E69:
	ldy.b $91
	lda.w pfteam,y
	bne CODE_9E9E78
	lda.w #$0003
	jsl.l CODE_9C9A7F
	rtl
