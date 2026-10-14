; Unidentified routine.
CODE_9BC9CD:
	sta.b d4
	jsl.l CODE_9BCA7A
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b a0
	stz.b d0
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC9F0
	sec
	sbc.b d5
	sta.b d0
CODE_9BC9F0:
	lda.b d5
	clc
	adc.b d0
	cmp.w #$001E
	bcc CODE_9BC9FD
	jmp.w CODE_9BC949
