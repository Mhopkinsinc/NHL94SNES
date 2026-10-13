; Unidentified routine.
CODE_9EE6D2:
	lda.w position,x
	bne CODE_9EE6F6
	lda.w puckx
	cmp.w #$FFF0
	bmi CODE_9EE6F6
	cmp.w #$0010
	bpl CODE_9EE6F6
	lda.w pucky
	cmp.w #$0108
	bpl CODE_9EE6F1
	cmp.w #$FEF8
	bpl CODE_9EE6F6
CODE_9EE6F1:
	cmp.w #$0110
	bcc CODE_9EE705
CODE_9EE6F6:
	lda.w facedir,x
	and.w #$0007
	sta.w passdir
	lda.w #$0004
	tsb.w sflags
CODE_9EE705:
	rtl
