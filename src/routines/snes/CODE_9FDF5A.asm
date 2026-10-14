; Unidentified routine.
CODE_9FDF5A:
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	beq CODE_9FDF7F
	tay
	lda.b [a1],y
	and.w #$00FF
	asl a
	sta.b d3
	inc.b $04
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	adc.b d3
	tay
	lda.w $17E8,y
	adc.b $08
	sta.b $08
CODE_9FDF7F:
	dec.b d4
	bpl CODE_9FDF5A
	phx
	jsl.l Div16U
	plx
	lda.b $00
	sta.b d0
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $B7
	pla
	sta.b d4
	pla
	sta.b $B3
	pla
	sta.b d3
	rtl
