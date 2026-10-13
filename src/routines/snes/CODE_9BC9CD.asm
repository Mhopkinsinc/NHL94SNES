; Unidentified routine.
CODE_9BC9CD:
	sta.b $B5
	jsl.l CODE_9BCA7A
	lda.w #$007E
	sta.b $8B
	lda.w #$34F4
	sta.b $89
	stz.b $A5
	ldy.b $B5
	lda.b [$89],y
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC9F0
	sec
	sbc.b $B9
	sta.b $A5
CODE_9BC9F0:
	lda.b $B9
	clc
	adc.b $A5
	cmp.w #$001E
	bcc CODE_9BC9FD
	jmp.w $C949
