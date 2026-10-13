; Unidentified routine.
CODE_9EB1C9:
	stz.b $A9
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EB1E4
	bpl CODE_9EB1DB
	lda.w #$0002
	sta.b $A9
CODE_9EB1DB:
	ldy.b $A9
	lda.w $1756,y
	inc a
	sta.w $1756,y
CODE_9EB1E4:
	rtl
