; Unidentified routine.
SetPA:
	lda.b $A5
	sta.w $162E
	stz.w RefStep
	jsl.l CODE_9EC160
	lda.b $A5
	cmp.w #$000E
	bne CODE_9EF980
	jsl.l CODE_9FA697
CODE_9EF980:
	lda.w #$7FFF
	sta.w penmsgtimer
	lda.w sfhormode
	beq CODE_9EF991
	lda.w #$003C
	sta.w penmsgtimer
CODE_9EF991:
	phx
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w RefStep
	bpl CODE_9EF9C5
	lda.w $1D81
	beq CODE_9EF9C0
	lda.w #$0001
	sta.w $1D83
CODE_9EF9C0:
	lda.w RefStep
	bra CODE_9EFA0F
