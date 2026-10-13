; Unidentified routine.
CODE_9FDF0C:
	lda.b $B1
	pha
	lda.b $B3
	pha
	lda.b $B5
	pha
	lda.b $B7
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	ldy.b $91
	lda.w tmdata,y
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	ldy.w #$0006
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b $A5
	asl a
	asl a
	asl a
	adc.b $8D
	sta.b $8D
	stz.b $08
	stz.b $04
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	ldy.b $91
	lda.w tmap,y
	sta.b $B5
	bra CODE_9FDF7F
