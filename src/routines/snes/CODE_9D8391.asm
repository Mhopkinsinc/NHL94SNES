; Unidentified routine.
CODE_9D8391:
	lda.w $1E61,y
	sta.b $00
	lda.w $1E49,y
	sta.b $04
	lda.b $A5
	sta.w $1E61,y
	lda.b $A9
	sta.w $1E49,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D83AD:
	lda.w $1E65,y
	sta.b $00
	lda.w $1E4D,y
	sta.b $04
	lda.b $A5
	sta.w $1E65,y
	lda.b $A9
	sta.w $1E4D,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D83C9:
	lda.b $A5
	sta.w $1E69,y
	lda.b $A9
	sta.w $1E51,y
CODE_9D83D3:
	lda.b $B1
	sta.b $A9
	lda.b $08
	sta.b $A5
	cmp.w $1E6D,y
	bmi CODE_9D83EC
	cmp.w $1E71,y
	bmi CODE_9D8408
	cmp.w $1E75,y
	bmi CODE_9D8424
	bra CODE_9D842E
