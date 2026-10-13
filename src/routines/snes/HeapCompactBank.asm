; join free blocks and move unlocked blocks down over them, fixing their handles
HeapCompactBank:		; join free blocks and move unlocked blocks down over them, fixing their handles
	iny
	iny
	lda.b [$0C],y
	beq .free
.next:
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	bra HeapCompactBank
.done:
	rts
.merge:
	tyx
	dey
	dey
	lda.b [$0C],y
	sta.b $04
	txy
	iny
	iny
	lda.b [$0C],y
	sta.b $08
	tay
	beq .size
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $00
	sta.b [$0C],y
.size:
	ldy.b $00
	lda.b $04
	clc
	adc.w #$0008
	adc.b $06
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $08
	sta.b [$0C],y
	dey
	dey
.free:
	dey
	dey
	sty.b $00
	lda.b [$0C],y
	sta.b $06
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	iny
	iny
	lda.b [$0C],y
	beq .merge
	and.w #$4000
	bne .next
	dey
	dey
	sty.b $0A
	lda.b [$0C],y
	sta.b $04
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $08
	tay
	lda.b $00
	clc
	adc.w #$0008
	adc.b $04
	cpy.w #$0000
	beq .move
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.move:
	tax
	ldy.b $00
	lda.b $04
	sta.b [$0C],y
	iny
	iny
	lda.w #$8000
	sta.b [$0C],y
	iny
	iny
	txa
	sta.b [$0C],y
	phx
	phy
	phb
	lda.b $0A
	clc
	adc.w #$0008
	tax
	lda.b $00
	clc
	adc.w #$0008
	tay
	lda.b $0E
	cmp.w #$007E
	beq .mvn7E
	lda.b $04
	dec a
	mvn $7F,$7F
	bra .moved
.mvn7E:
	lda.b $04
	dec a
	mvn $7E,$7E
.moved:
	plb
	ply
	plx
	txy
	lda.b $06
	sta.b [$0C],y
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $08
	sta.b [$0C],y
	iny
	iny
	lda.b $00
	sta.b [$0C],y
	lda.b $0A
	clc
	adc.w #$0008
	txy
	ldx.w #$00FC
.scan:
	cmp.l HandleTable,x
	beq .fix
	dex
	dex
	dex
	dex
	bpl .scan
	bra .again
.fix:
	lda.b $00
	clc
	adc.w #$0008
	sta.l HandleTable,x
.again:
	iny
	iny
	jmp.w .free
	rts		; not reached
