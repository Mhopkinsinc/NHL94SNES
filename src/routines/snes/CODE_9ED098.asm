; Unidentified routine.
CODE_9ED098:
	lda.w #SPAgskate
CODE_9ED09B:
	jsl.l CODE_9EA3F1
	lda.w facedir,x
	sta.b $AD
	jml.l CODE_9EA719
