; Unidentified routine.
CODE_9FF5E3:
	lda.w #$0180
	sta.b $D5
	sta.w $07D6
	lda.w #$0190
	sta.b $D7
	sta.w $07D8
	lda.w #$0010
	tsb.b $C3
	lda.w #$0003
	sta.b $B7
	stz.b $BB
	lda.b $83
	tax
	clc
	adc.w #$02D0
	sta.b $BD
	txa
	clc
	adc.w #$00F0
	sta.b $C1
	jsr.w CODE_9FF89C
	rts
