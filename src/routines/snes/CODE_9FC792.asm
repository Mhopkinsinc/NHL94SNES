; Unidentified routine.
CODE_9FC792:
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9FC79E
	inc.b a2
	inc.b a2
CODE_9FC79E:
	rtl
