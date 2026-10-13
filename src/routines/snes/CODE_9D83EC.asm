; Unidentified routine.
CODE_9D83EC:
	lda.w $1E6D,y
	sta.b $00
	lda.w $1E55,y
	sta.b $04
	lda.b $A5
	sta.w $1E6D,y
	lda.b $A9
	sta.w $1E55,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D8408:
	lda.w $1E71,y
	sta.b $00
	lda.w $1E59,y
	sta.b $04
	lda.b $A5
	sta.w $1E71,y
	lda.b $A9
	sta.w $1E59,y
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9D8424:
	lda.b $A5
	sta.w $1E75,y
	lda.b $A9
	sta.w $1E5D,y
CODE_9D842E:
	rtl
