; free handle A and its block, joined with free neighbours
DisposeHandle:		; free handle A and its block, joined with free neighbours
	cmp.w #$2000
	bcc .exit
	cmp.w #INIDISP
	bcs .exit
	tax
	lda.l $7E0002,x
	tay
	lda.l $7E0000,x
	pha
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
	pla
	tyx
	ldy.w HeapStart7E
	cpx.w #$007E
	beq .heap
	ldy.w HeapStart7F
	cpx.w #$007F
	beq .heap
.exit:
	rtl
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
	iny
	iny
	lda.b [$0C],y
	beq .prev
	tay
	tax
	iny
	iny
	lda.b [$0C],y
	bne .prev
	txy
	lda.b [$0C],y
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	tay
	lda.b $14
	cpy.w #$0000
	beq .size
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.size:
	tay
	lda.b [$0C],y
	clc
	adc.b $00
	adc.w #$0008
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.prev:
	ldy.b $14
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	cmp.w #$FFFF
	beq .done
	tay
	tax
	iny
	iny
	lda.b [$0C],y
	bne .done
	ldy.b $14
	lda.b [$0C],y
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	tay
	txa
	cpy.w #$0000
	beq .size2
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.size2:
	tay
	lda.b [$0C],y
	clc
	adc.b $00
	adc.w #$0008
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.done:
	rtl
