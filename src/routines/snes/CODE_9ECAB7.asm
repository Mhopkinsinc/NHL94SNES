; Unidentified routine.
CODE_9ECAB7:
	lda.w #$FFFF
	sta.w PlayerScrollCtr
	lda.w #$0000
	sta.b $8B
	lda.w #mesarea+2
	sta.b a0
	stz.b d1
CODE_9ECAC9:
	lda.b [a2]
	and.w #$00FF
	cmp.w #$000D
	beq CODE_9ECB1A
	inc.b d0
CODE_9ECAD5:
	sep #$20
	lda.b [a2]
	sta.b [a0]
	rep #$30
	inc.b a0
	inc.b d1
	lda.b [a2]
	and.w #$00FF
	cmp.w #$002C
	beq CODE_9ECAF0
	cmp.w #$002E
	bne CODE_9ECAFA
CODE_9ECAF0:
	lda.w ScoutingReportTimer
	clc
	adc.w #$0028
	sta.w ScoutingReportTimer
CODE_9ECAFA:
	lda.b [a2]
	inc.b a2
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECAC9
	lda.b [a2]
	and.w #$00FF
	cmp.w #$0020
	beq CODE_9ECAD5
	lda.b a2
	sec
	sbc.b a1
	sta.b a2
	sta.w PlayerScrollCtr
CODE_9ECB1A:
	lda.b d1
	inc a
	inc a
	sta.w mesarea
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
CODE_9ECB2B:
	lda.b d0
	sec
	sbc.w #$0014
	beq CODE_9ECB3F
	bmi CODE_9ECB3D
	bvs CODE_9ECB3F
CODE_9ECB37:
	jsl.l ScrollDisplayUp
	bra CODE_9ECB3F
