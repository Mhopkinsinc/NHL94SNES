; Unidentified routine.
CODE_80D2BD:		; put the player at the cursor in shooter row $1DB9; if that player is already in the list, the two swap
	ldy.b d1
	phy
	lda.w #$0009
	sec
	sbc.w $1D9B
	clc
	adc.w $1DA7
	and.w #$00FF
	sta.b d0
	lda.w #$0000
	sta.b $8F
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq CODE_80D2E8
	lda.w #$0000
	sta.b $8F
	lda.w #awayshooters
	sta.b a1
CODE_80D2E8:
	ldy.w $1DB9
	sep #$20
	lda.b [a1],y
	rep #$20
	and.w #$00FF
	sta.b d1
	lda.b d0
	ldy.w #$0001
CODE_80D2FB:
	sep #$20
	cmp.b [a1],y
	rep #$20
	beq CODE_80D30B
	iny
	cpy.w #$0007
	bmi CODE_80D2FB
	bra CODE_80D313
