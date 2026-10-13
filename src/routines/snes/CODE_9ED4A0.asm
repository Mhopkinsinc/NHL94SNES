; Unidentified routine.
CODE_9ED4A0:
	lda.w temp5,x
	sec
	sbc.b $C1
	sta.w temp5,x
	bpl CODE_9ED4B4
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9EB88A
CODE_9ED4B4:
	lda.w pf2aip,x
	beq CODE_9ED4BC
	jmp.w $D49F
