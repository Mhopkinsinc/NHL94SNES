; Unidentified routine.
CODE_80BA21:
	lda.b $71
	and.b #$1F
	asl a
	asl a
	adc.b #$04
	cmp.b #$71
	bcs .t1
	rep #$20
	and.w #$00FF
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loop:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loop
	jmp.w CODE_80B8F0

.t1:
	lda.b $71
	rep #$20
	and.w #$0003
	beq .1
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loopx:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loopx
.1:
	rep #$20
	rts
