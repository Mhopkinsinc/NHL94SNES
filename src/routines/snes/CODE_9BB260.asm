; Unidentified routine.
CODE_9BB260:
	lda.b #$00
CODE_9BB262:
	sta.w $0DFA
	lda.w WMDATA
	sta.w $0DFB
	bpl CODE_9BB271
	lda.b #$FF
	bra CODE_9BB273
