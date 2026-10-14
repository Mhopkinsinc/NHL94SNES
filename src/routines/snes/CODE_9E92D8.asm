; Unidentified routine.
CODE_9E92D8:
	lda.w #$0800
	sta.w puckvx
CODE_9E92DE:
	stz.b d0
	lda.w #$00FF
	sta.b d1
	lda.w $0D71
	sec
	sbc.w $0E5F
	sta.b d2
	bmi CODE_9E92F5
	lda.w #$FF01
	sta.b d1
CODE_9E92F5:
	jmp.w CODE_9E8F42
