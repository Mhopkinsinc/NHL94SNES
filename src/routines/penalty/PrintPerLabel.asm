; Unidentified routine.
PrintPerLabel:
	lda.w gsp
	sta.b $A5
	cmp.w #$0004
	bne CODE_9F9D8F
	dec.w printx
	inc.b $A5
CODE_9F9D8F:
	lda.w #$0080
	sta.b $8B
	lda.w #$D6E1
	sta.b $89
CODE_9F9D99:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	dec.b $A5
	bpl CODE_9F9D99
	jml.l CODE_9EC7BE
