; Unidentified routine.
CODE_9DC3F3:
	lda.w $1E7B
	sta.b $00
	lda.w $1E79
	sta.b $04
	lda.b $A5
	sta.w $1E7B
	lda.b $A9
	sta.w $1E79
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9DC40F:
	lda.w $1E7F
	sta.b $00
	lda.w $1E7D
	sta.b $04
	lda.b $A5
	sta.w $1E7F
	lda.b $A9
	sta.w $1E7D
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9DC42B:
	lda.b $A5
	sta.w $1E83
	lda.b $A9
	sta.w $1E81
CODE_9DC435:
	rtl
