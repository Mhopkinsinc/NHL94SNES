; Unidentified routine.
CODE_9FBD37:
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
CODE_9FBD3F:
	ldy.b d2
	iny
	cpy.w mesarea
	bne CODE_9FBD10
CODE_9FBD47:
	dec.b a2
	dec.b a2
	bmi CODE_9FBD50
	jmp.w CODE_9FBC6E
