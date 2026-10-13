; byte pair data at Y (after its header) to WRAM
DecompressPairs:	; byte pair data at Y (after its header) to WRAM
	iny
	iny
	lda.w #$0000
	ldx.w #$0040
CODE_80BA6B:
	dex
	dex
	sta.w $0100,x
	sta.w $0140,x
	sta.w $0180,x
	sta.w $01C0,x
	bne CODE_80BA6B
	sep #$20
	iny
	lda.w $0000,y
	tax
	inc.w $0100,x
	iny
	lda.w $0000,y
	sta.b $00
	beq CODE_80BAE3
CODE_80BA8D:
	iny
	lda.w $0000,y
	tax
	iny
	lda.w $0000,y
	sta.w $0500,x
	iny
	lda.w $0000,y
	sta.w $0600,x
	dec.w $0100,x
	dec.b $00
	bne CODE_80BA8D
	bra CODE_80BAE3
