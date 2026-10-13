; Unidentified routine.
HeapAllocBlock:		; first free block of size $14 or more (flags $16) from header Y in the bank in $0E; splits it when 16 or more bytes are left.
		;   returns the data address, $FFFF for none
	stz.b $0C
.walk:
	lda.b [$0C],y
	iny
	iny
	cmp.b $14
	bcs .fit
.next:
	iny
	iny
	lda.b [$0C],y
	beq .none
	tay
	bra .walk
.none:
	lda.w #$FFFF
	rts
.fit:
	lda.b [$0C],y
	bne .next
	dey
	dey
	lda.b [$0C],y
	sty.b $02
	sec
	sbc.b $14
	beq .whole
	cmp.w #$0010
	bcc .whole
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	lda.b $16
	ora.w #$8000
	sta.b [$0C],y
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	lda.b $02
	clc
	adc.b $14
	adc.w #$0008
	sta.b [$0C],y
	tay
	lda.b $00
	sec
	sbc.w #$0008
	sta.b [$0C],y
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $04
	sta.b [$0C],y
	iny
	iny
	lda.b $02
	sta.b [$0C],y
.ret:
	lda.b $02
	clc
	adc.w #$0008
	rts
.whole:
	iny
	iny
	lda.b $16
	ora.w #$8000
	sta.b [$0C],y
	bra .ret
