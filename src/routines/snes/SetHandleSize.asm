; resize handle A's block to X bytes: in place when it can, else in a new block
SetHandleSize:		; resize handle A's block to X bytes: in place when it can, else in a new block
	cmp.w #$2000
	bcc .bad
	cmp.w #INIDISP
	bcs .bad
	stx.b $14
	tax
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .bad
	lda.l $7E0002,x
	cmp.w #$007E
	beq .heap
	cmp.w #$007F
	bne .bad
.heap:
	stx.b $08
	sta.b $0E
	stz.b $0C
	lda.l $7E0000,x
	sec
	sbc.w #$0006
	tay
	lda.b [$0C],y
	beq .bad
	dey
	dey
	tyx
	lda.b [$0C],y
	sta.b $16
	iny
	iny
	iny
	iny
	sec
	sbc.b $14
	bcc .togrow
	cmp.w #$0009
	bcs .shrink
	jmp.w .exit
.togrow:
	jmp.w .grow
.bad:
	jmp.w .exit
.shrink:
	lda.b [$0C],y
	sta.b $02
	beq .split
	tay
	iny
	iny
	lda.b [$0C],y
	beq .mergenext
.split:
	txy
	lda.b $16
	sec
	sbc.w #$0008
	sbc.b $14
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	tya
	clc
	adc.b $14
	adc.w #$0008
	iny
	iny
	iny
	iny
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	sta.b [$0C],y
	jmp.w .newfree
.mergenext:
	dey
	dey
	lda.b [$0C],y
	sta.b $06
	ldy.b $02
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	lda.b $16
	sec
	sbc.b $14
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	tya
	clc
	adc.b $14
	adc.w #$0008
	iny
	iny
	iny
	iny
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	clc
	adc.b $06
	sta.b [$0C],y
.newfree:
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $02
	sta.b [$0C],y
	iny
	iny
	txa
	sta.b [$0C],y
	ldy.b $02
	beq .done
.linkprev:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.done:
	jmp.w .exit
.grow:
	lda.b [$0C],y
	sta.b $02
	beq .move
	tay
	iny
	iny
	lda.b [$0C],y
	bne .move
	dey
	dey
	lda.b [$0C],y
	clc
	adc.w #$0008
	adc.b $16
	cmp.b $14
	beq .wholenext
	bcc .move
	lda.b $14
	sec
	sbc.b $16
	sta.b $00
	lda.b [$0C],y
	sec
	sbc.b $00
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	tya
	clc
	adc.b $14
	adc.w #$0004
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	sta.b [$0C],y
	jmp.w .newfree
.wholenext:
	ldy.b $02
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	sty.b $04
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $02
	sta.b [$0C],y
	tay
	bne .tolinkprev
	jmp.w .exit
.tolinkprev:
	jmp.w .linkprev
.move:
	txy
	iny
	iny
	lda.b [$0C],y
	and.w #$4000
	lda.b $16
	pha
	lda.b $08
	pha
	lda.w #$0000
	ldx.b $14
	phx
	ldy.w #$0000
	jsl.l NewHandle
	plx
	stx.b $14
	plx
	stx.b $08
	plx
	stx.b $16
	tax
	sta.b $0A
	lda.l $7E0000,x
	tay
	sep #$20
	lda.b #$54
	sta.b $10
	lda.l $7E0002,x
	sta.b $11
	ldx.b $08
	lda.l $7E0002,x
	sta.b $12
	lda.b #$6B
	sta.b $13
	rep #$20
	lda.l $7E0000,x
	tax
	lda.b $16
	phb
	jsl.l $000010		; mvn written to $10-$13 above, then rtl
	plb
	lda.b $08
	jsl.l DisposeHandle
	ldx.b $0A
	lda.l $7E0000,x
	tay
	lda.l $7E0002,x
	ldx.b $08
	sta.l $7E0002,x
	tya
	sta.l $7E0000,x
	ldx.b $0A
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
.exit:
	rtl
