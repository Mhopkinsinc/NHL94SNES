; Unidentified routine.
CODE_9ED7CA:
	lda.w $0792
	and.w #$0380
	beq CODE_9ED793
CODE_9ED7D2:
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ED7E1
	ora.w #$FF00
CODE_9ED7E1:
	clc
	adc.w $0D71
	sta.b d0
CODE_9ED7E7:
	jsl.l CODE_9EDBC0
	lda.b d1
	pha
	lda.b d0
	pha
CODE_9ED7F1:
	lda.b d0
	ldy.b d1
	jsl.l CODE_9CA554
	sta.b d0
	cmp.w #$001E
	bcs CODE_9ED808
	pla
	sta.b d0
	pla
	sta.b d1
	bra CODE_9ED853
