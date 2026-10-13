; Unidentified routine.
CODE_9C8B21:
	lda.w #$0064
	sta.b $A5
CODE_9C8B26:
	lda.w #$0064
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	lda.w #$001E
	sta.w printx
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C8D2B
	sta.b $8D
	jsl.l CODE_9EC894
	pla
	sta.b $A9
	ply
	rtl
