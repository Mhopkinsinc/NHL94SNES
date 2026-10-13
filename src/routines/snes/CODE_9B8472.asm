; Unidentified routine.
CODE_9B8472:
	lda.w JoyPad
	eor.w $0A9A
	sta.w $0AAE
	and.w JoyPad
	sta.w $0AB8
	lda.w $0778
	eor.w $0A9C
	sta.w $0AB0
	and.w $0778
	sta.w $0ABA
	lda.w $077A
	eor.w $0A9E
	sta.w $0AB2
	and.w $077A
	sta.w $0ABC
	lda.w $077C
	eor.w $0AA0
	sta.w $0AB4
	and.w $077C
	sta.w $0ABE
	lda.w $077E
	eor.w $0AA2
	sta.w $0AB6
	and.w $077E
	sta.w $0AC0
	lda.w JoyPad
	sta.w $0A9A
	lda.w $0778
	sta.w $0A9C
	lda.w $077A
	sta.w $0A9E
	lda.w $077C
	sta.w $0AA0
	lda.w $077E
	sta.w $0AA2
	rts
