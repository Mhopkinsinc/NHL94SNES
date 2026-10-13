; Unidentified routine.
CODE_9ED098:
	lda.w #$E3C0
CODE_9ED09B:
	jsl.l CODE_9EA3F1
	lda.w $1163,x
	sta.b $AD
	jml.l CODE_9EA719
