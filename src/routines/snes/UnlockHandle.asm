; clear the locked bit of handle A's block
UnlockHandle:		; clear the locked bit of handle A's block
	pha
	cmp.w #$2000
	bcc .exit
	cmp.w #INIDISP
	bcs .exit
	tax
	lda.l $7E0002,x
	tay
	lda.l $7E0000,x
	tyx
	ldy.w HeapStart7E
	cpx.w #$007E
	beq .heap
	ldy.w HeapStart7F
	cpx.w #$007F
	bne .exit
.heap:
	sec
	sbc.w #$0008
	sta.b $14
	stx.b $0E
	stz.b $0C
.find:
	cpy.b $14
	beq .found
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .exit
	tay
	bra .find
.found:
	iny
	iny
	lda.b [$0C],y
	beq .exit
	and.w #$8000
	sta.b [$0C],y
.exit:
	pla
	rtl
