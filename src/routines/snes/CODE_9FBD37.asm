; Unidentified routine.
CODE_9FBD37:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $A5
CODE_9FBD3F:
	ldy.b $AD
	iny
	cpy.w $0A2A
	bne CODE_9FBD10
CODE_9FBD47:
	dec.b $91
	dec.b $91
	bmi CODE_9FBD50
	jmp.w CODE_9FBC6E
