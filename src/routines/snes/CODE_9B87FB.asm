; Unidentified routine.
CODE_9B87FB:
	lda.w $1D9F
	cmp.w #$0005
	beq CODE_9B8809
	inc.w $1D9F
	inc.w $1D8B
CODE_9B8809:
	jsl.l CODE_9B8810
CODE_9B880D:
	jmp.w $86E5
