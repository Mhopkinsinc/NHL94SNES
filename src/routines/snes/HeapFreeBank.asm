; Add the sizes of the free blocks of the heap chain at [p0], from block Y, to $14-$17
HeapFreeBank:
	iny
	iny
	lda.b [p0],y
	bne .next
	dey
	dey
	lda.b [p0],y
	clc
	adc.b r3
	sta.b r3
	lda.w #$0000
	adc.b r3+2
	sta.b r3+2
	iny
	iny
.next:
	iny
	iny
	lda.b [p0],y
	beq .done
	tay
	bra HeapFreeBank
.done:
	rts
