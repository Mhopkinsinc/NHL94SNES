; Add the sizes of the free blocks of the heap chain at [$0C], from block Y, to $14-$17
HeapFreeBank:
	iny
	iny
	lda.b [$0C],y
	bne .next
	dey
	dey
	lda.b [$0C],y
	clc
	adc.b $14
	sta.b $14
	lda.w #$0000
	adc.b $16
	sta.b $16
	iny
	iny
.next:
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	bra HeapFreeBank
.done:
	rts
