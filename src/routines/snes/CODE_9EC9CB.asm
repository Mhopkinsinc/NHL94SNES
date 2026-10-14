; Unidentified routine.
CODE_9EC9CB:
	lda.b [a2]
	inc.b a2
	and.w #$00FF
	cmp.w #$000D
	bne CODE_9EC9CB
CODE_9EC9D7:
	dec.b d0
	bpl CODE_9EC9CB
	lda.b a2
	sec
	sbc.b a1
	sta.b d0
CODE_9EC9E2:
	lda.b a1
	clc
	adc.b d0
	sta.b a2
	lda.b $8F
	sta.b $93
	lda.w #$000A
	sta.w ScoutingReportTimer
	lda.w $0D47
	sta.b d0
	lda.b [a2]
	and.w #$00FF
	cmp.w #$0025
	beq CODE_9ECA05
	jmp.w CODE_9ECAB7
