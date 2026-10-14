; Unidentified routine.
CODE_9EDC06:
	lda.w facedir,x
	sta.b $14
	lda.w $0BCB,x
	bne .t1
	lda.b d0
	sec
	sbc.b $14
	beq .t1
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	sta.b d0
	clc
	adc.b $14
	and.w #$0007
	sta.w facedir,x
	lda.w #$0006
	sta.w $0BCB,x
	rtl

.t1:
	lda.w $0BCB,x
	beq .rtl
	sec
	sbc.w $0ADB
	bpl .1
	lda.w #$0000
.1:
	sta.w $0BCB,x
.rtl:
	rtl
