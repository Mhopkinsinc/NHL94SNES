; Unidentified routine.
CODE_9E92D8:
	lda.w #$0800
	sta.w puckvx
CODE_9E92DE:
	stz.b $A5
	lda.w #$00FF
	sta.b $A9
	lda.w puckx
	sec
	sbc.w $0E5F
	sta.b $AD
	bmi CODE_9E92F5
	lda.w #$FF01
	sta.b $A9
CODE_9E92F5:
	jmp.w $8F42
