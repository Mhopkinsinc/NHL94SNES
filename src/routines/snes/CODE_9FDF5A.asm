; Unidentified routine.
CODE_9FDF5A:
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	beq CODE_9FDF7F
	tay
	lda.b [$8D],y
	and.w #$00FF
	asl a
	sta.b $B1
	inc.b $04
	lda.b $91
	beq CODE_9FDF75
	lda.w #$0034
CODE_9FDF75:
	adc.b $B1
	tay
	lda.w $17E8,y
	adc.b $08
	sta.b $08
CODE_9FDF7F:
	dec.b $B5
	bpl CODE_9FDF5A
	phx
	jsl.l Div16U
	plx
	lda.b $00
	sta.b $A5
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $B7
	pla
	sta.b $B5
	pla
	sta.b $B3
	pla
	sta.b $B1
	rtl
