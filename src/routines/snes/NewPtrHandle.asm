; a handle for fixed memory at A in bank X; returns the handle, 0 if none is free
NewPtrHandle:
	stx.b r3+2
	sta.b r3
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
	lda.b r3
	sta.l Ram7E,x
	lda.b r3+2
	sta.l Ram7E+2,x
	txa
.exit:
	rtl
