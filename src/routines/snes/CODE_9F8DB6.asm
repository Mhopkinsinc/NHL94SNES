; Unidentified routine.
CODE_9F8DB6:
	stz.w $07C6
	jsl.l CODE_9BC75E
	jsl.l CODE_9D8BBF
	lda.l $7E34BC
	cmp.w #$0001
	beq CODE_9F8DCE
	jml.l CODE_9F82D2
