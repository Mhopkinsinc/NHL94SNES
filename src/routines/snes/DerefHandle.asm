; address of handle A in A, bank in X; 0 and 0 for a bad handle
DerefHandle:
	cmp.w #$2000
	bcc .bad
	cmp.w #$2100
	bcs .bad
	stx.b $14
	tax
	lda.l Ram7E,x
	ora.l Ram7E+2,x
	beq .bad
	lda.l Ram7E+2,x
	pha
	lda.l Ram7E,x
	plx
	bra .exit
.bad:
	lda.w #$0000
	tax
.exit:
	rtl
