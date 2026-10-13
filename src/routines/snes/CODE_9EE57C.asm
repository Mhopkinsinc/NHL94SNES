; Unidentified routine.
CODE_9EE57C:
	lda.w #DATA8_9DEF6E
CODE_9EE57F:
	jsl.l CODE_9EA3F1
	jsl.l updateanim
	lda.w #$0002
	sta.w SPAcnt,x
	jsl.l CODE_9EE220
	rtl
	rtl
