; Unidentified routine.
CODE_9C90F0:
	lda.b [$89]
	inc.b $89
	inc.b $89
	clc
	adc.b $91
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l PushNumber
	lda.b [$89]
	sta.b $A9
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36D
	sta.b $8D
	jsl.l appstring
	lda.b $91
	clc
	adc.b $A9
	tay
	lda.w $0000,y
	sta.b $A5
	jsl.l PushNumber
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	bra CODE_9C9154
