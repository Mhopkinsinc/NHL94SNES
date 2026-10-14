; Unidentified routine.
CODE_9EC9CB:
	lda.b [$91]
	inc.b $91
	and.w #$00FF
	cmp.w #$000D
	bne CODE_9EC9CB
CODE_9EC9D7:
	dec.b $A5
	bpl CODE_9EC9CB
	lda.b $91
	sec
	sbc.b $8D
	sta.b $A5
CODE_9EC9E2:
	lda.b $8D
	clc
	adc.b $A5
	sta.b $91
	lda.b $8F
	sta.b $93
	lda.w #$000A
	sta.w $0D45
	lda.w $0D47
	sta.b $A5
	lda.b [$91]
	and.w #$00FF
	cmp.w #$0025
	beq CODE_9ECA05
	jmp.w CODE_9ECAB7
