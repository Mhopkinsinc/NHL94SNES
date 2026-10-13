; Unidentified routine.
CODE_9FE3EB:
	lda.w tmgoalie,y
	bmi CODE_9FE3FA
	inc a
	cmp.b $A5
	bcc CODE_9FE3DD
	lda.w #$FFFF
	bra CODE_9FE3DD
