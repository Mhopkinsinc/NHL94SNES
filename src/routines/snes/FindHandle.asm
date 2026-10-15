; the handle of address A in bank X, 0 if none
FindHandle:
	stx.b r3+2
	sta.b r3
	ldx.w #$2000
.loop:
	lda.l Ram7E,x
	cmp.b r3
	bne .next
	lda.l Ram7E+2,x
	cmp.b r3+2
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
