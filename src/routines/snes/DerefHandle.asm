; Unidentified routine.
DerefHandle:		; address of handle A in A, bank in X; 0 and 0 for a bad handle
	cmp.w #$2000
	bcc .bad
	cmp.w #$2100
	bcs .bad
	stx.b $14
	tax
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .bad
	lda.l $7E0002,x
	pha
	lda.l $7E0000,x
	plx
	bra .exit
.bad:
	lda.w #$0000
	tax
.exit:
	rtl
