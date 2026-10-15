; a handle for fixed memory at A in bank X; returns the handle, 0 if none is free
NewPtrHandle:
	stx.b $16
	sta.b $14
	ldx.w #$2000
.find:
	lda.l Ram7E,x
	ora.l Ram7E+2,x
	beq .slot
	inx
	inx
	inx
	inx
	cpx.w #$2100
	bne .find
	lda.w #$0000
	bra .exit
.slot:
	lda.b $14
	sta.l Ram7E,x
	lda.b $16
	sta.l Ram7E+2,x
	txa
.exit:
	rtl
