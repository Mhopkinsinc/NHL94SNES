; Unidentified routine.
NewPtrHandle:		; a handle for fixed memory at A in bank X; returns the handle, 0 if none is free
	stx.b $16
	sta.b $14
	ldx.w #$2000
.find:
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .slot
	inx
	inx
	inx
	inx
	cpx.w #INIDISP
	bne .find
	lda.w #$0000
	bra .exit
.slot:
	lda.b $14
	sta.l $7E0000,x
	lda.b $16
	sta.l $7E0002,x
	txa
.exit:
	rtl
