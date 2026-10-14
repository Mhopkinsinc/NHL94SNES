; Unidentified routine.
CODE_9EE6D2:
	lda.w position,x
	bne .2
	lda.w puckx
	cmp.w #$FFF0
	bmi .2
	cmp.w #$0010
	bpl .2
	lda.w pucky
	cmp.w #$0108
	bpl .1
	cmp.w #$FEF8
	bpl .2
.1:
	cmp.w #$0110
	bcc .rtl
.2:
	lda.w facedir,x
	and.w #$0007
	sta.w passdir
	lda.w #$0004
	tsb.w sflags
.rtl:
	rtl
