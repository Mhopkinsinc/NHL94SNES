; The next line of the scouting report; scroll the text box up when it is full
ScrollDisplayUp:
	stz.w $0D47
	inc.w VertLineScrolling
	lda.w VertLineScrolling
	sec
	sbc.w #$0008
	bmi CODE_9ECDB1
	bvc CODE_9ECDB3
CODE_9ECDAE:
	jmp.w CODE_9EC9B0
