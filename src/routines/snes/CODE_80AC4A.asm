; Unidentified routine.
CODE_80AC4A:
	lda.w $07F5
	clc
	adc.b #$40
.loop:
	sta.w $07F5
	cmp.w $07F6
	bcc .t1
	jsr.w CODE_80A549
	lda.w $07F1
	bne .1
	ldx.w $0801
	beq .t1
	dex
.loop2:
	jsr.w CODE_80A86F
	lda.w MusicOn
	beq .t1
	dex
	bpl .loop2
.1:
	lda.w $07F5
	sec
	sbc.w $07F6
	bra .loop

.t1:
	rts
