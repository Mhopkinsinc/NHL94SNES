; byte pair data at Y (after its header) to WRAM
DecompressPairs:	; byte pair data at Y (after its header) to WRAM
	iny
	iny
	lda.w #$0000
	ldx.w #$0040
.loop:
	dex
	dex
	sta.w $0100,x
	sta.w $0140,x
	sta.w $0180,x
	sta.w $01C0,x
	bne .loop
	sep #$20
	iny
	lda.w $0000,y
	tax
	inc.w $0100,x
	iny
	lda.w $0000,y
	sta.b $00
	beq CODE_80BAE3
.loop2:
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
	bne .loop2
	bra CODE_80BAE3
