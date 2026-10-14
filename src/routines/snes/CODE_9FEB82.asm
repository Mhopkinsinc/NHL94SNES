; Unidentified routine.
CODE_9FEB82:
	ldy.w #$0001
CODE_9FEB85:
	iny
	lda.b [a4],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9FEB85
CODE_9FEB90:
	iny
	tya
	cmp.b [a4]
	beq CODE_9FEBA5
	lda.b [a4],y
	phy
	ldy.w mesarea
	sta.w mesarea,y
	inc.w mesarea
	ply
	bra CODE_9FEB90
