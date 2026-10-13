; Unidentified routine.
CODE_9ED7CA:
	lda.w seed
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
	adc.w puckx
	sta.b $A5
CODE_9ED7E7:
	jsl.l CODE_9EDBC0
	lda.b $A9
	pha
	lda.b $A5
	pha
CODE_9ED7F1:
	lda.b $A5
	ldy.b $A9
	jsl.l CODE_9CA554
	sta.b $A5
	cmp.w #$001E
	bcs CODE_9ED808
	pla
	sta.b $A5
	pla
	sta.b $A9
	bra CODE_9ED853
