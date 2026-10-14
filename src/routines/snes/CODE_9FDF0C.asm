; Unidentified routine.
CODE_9FDF0C:
	lda.b d3
	pha
	lda.b $B3
	pha
	lda.b d4
	pha
	lda.b $B7
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	ldy.b a2
	lda.w tmdata,y
	sta.b a1
	lda.w #$009C
	sta.b $8F
	ldy.w #$0006
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b d0
	asl a
	asl a
	asl a
	adc.b a1
	sta.b a1
	stz.b $08
	stz.b $04
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b a0
	ldy.b a2
	lda.w tmap,y
	sta.b d4
	bra CODE_9FDF7F
