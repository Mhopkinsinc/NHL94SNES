; Unidentified routine.
CODE_9EF722:
	lda.w #$FFFF
	sta.w shotPlIdx
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w puckvy
	jsl.l RandomWord
	and.w #$1FFF
	sec
	sbc.w #$1000
	sta.w puckvx
	jsl.l RandomWord
	and.w #$0FFF
	sta.w $0E01
	jmp.w puckflip
