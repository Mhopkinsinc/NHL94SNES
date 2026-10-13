; Unidentified routine.
CODE_9EE593:
	lda.w $1EA7
	asl a
	adc.w $1EA7
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EE5CE
	sta.b $89
	lda.b [$89],y
	sta.b $A5
	lda.w $1EA9
	bpl CODE_9EE5B7
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE5B7:
	lda.b $A5
	sta.w $1EA1
	iny
	iny
	lda.b [$89],y
	sta.w $1EA3
	iny
	iny
	lda.b [$89],y
	sta.w $1EA5
	inc.w $1EA7
	rts
