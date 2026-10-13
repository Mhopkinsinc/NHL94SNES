; Unidentified routine.
CODE_9FEB82:
	ldy.w #$0001
CODE_9FEB85:
	iny
	lda.b [$99],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FEB85
CODE_9FEB90:
	iny
	tya
	cmp.b [$99]
	beq CODE_9FEBA5
	lda.b [$99],y
	phy
	ldy.w $0A2A
	sta.w $0A2A,y
	inc.w $0A2A
	ply
	bra CODE_9FEB90
