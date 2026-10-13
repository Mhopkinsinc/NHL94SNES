; Unidentified routine.
CODE_9EEF91:
	jsl.l a2touchpuck
	ldy.w $0DF9
	cmp.w #$000E
	bmi CODE_9EEFA6
	lda.w #$0005
	jsl.l CODE_9C9A7F
	bra CODE_9EEFAD
