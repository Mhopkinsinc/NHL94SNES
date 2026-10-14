; the handle of address A in bank X, 0 if none
FindHandle:
	stx.b $16
	sta.b $14
	ldx.w #$2000
.loop:
	lda.l $7E0000,x
	cmp.b $14
	bne .next
	lda.l $7E0002,x
	cmp.b $16
	beq .found
.next:
	inx
	inx
	inx
	inx
	cpx.w #$2100
	bne .loop
	lda.w #$0000
	bra .exit
.found:
	txa
.exit:
	rtl
