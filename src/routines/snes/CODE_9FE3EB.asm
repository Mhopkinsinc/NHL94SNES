; Unidentified routine.
CODE_9FE3EB:
	lda.w tmgoalie,y
	bmi .t1
	inc a
	cmp.b d0
	bcc CODE_9FE3DD
	lda.w #$FFFF
	bra CODE_9FE3DD

.t1:
	lda.w #$0000
	bra CODE_9FE3DD
