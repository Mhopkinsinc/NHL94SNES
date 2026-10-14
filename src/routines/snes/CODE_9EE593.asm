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
	sta.b a0
	lda.b [a0],y
	sta.b d0
	lda.w $1EA9
	bpl .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:
	lda.b d0
	sta.w $1EA1
	iny
	iny
	lda.b [a0],y
	sta.w $1EA3
	iny
	iny
	lda.b [a0],y
	sta.w $1EA5
	inc.w $1EA7
	rts
