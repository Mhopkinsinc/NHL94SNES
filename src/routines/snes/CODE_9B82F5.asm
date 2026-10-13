; Unidentified routine.
CODE_9B82F5:
	ldx.w #$0000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
CODE_9B8307:
	plp
	rtl
