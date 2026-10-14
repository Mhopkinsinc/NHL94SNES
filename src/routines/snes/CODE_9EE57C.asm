; Unidentified routine.
CODE_9EE57C:
	lda.w #$EF6E
CODE_9EE57F:
	jsl.l CODE_9EA3F1
	jsl.l CODE_9EA419
	lda.w #$0002
	sta.w SPAcnt,x
	jsl.l CODE_9EE220
	rtl
	rtl
