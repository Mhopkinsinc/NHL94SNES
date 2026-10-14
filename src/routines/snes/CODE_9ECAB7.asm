; Unidentified routine.
CODE_9ECAB7:
	lda.w #$FFFF
	sta.w PlayerScrollCtr
	lda.w #$0000
	sta.b $8B
	lda.w #mesarea+2
	sta.b a0
	stz.b d1
.loop:
	lda.b [a2]
	and.w #$00FF
	cmp.w #$000D
	beq .3
	inc.b d0
.loop2:
	sep #$20
	lda.b [a2]
	sta.b [a0]
	rep #$30
	inc.b a0
	inc.b d1
	lda.b [a2]
	and.w #$00FF
	cmp.w #$002C
	beq .1
	cmp.w #$002E
	bne .2
.1:
	lda.w ScoutingReportTimer
	clc
	adc.w #$0028
	sta.w ScoutingReportTimer
.2:
	lda.b [a2]
	inc.b a2
	and.w #$00FF
	cmp.w #$0020
	bne .loop
	lda.b [a2]
	and.w #$00FF
	cmp.w #$0020
	beq .loop2
	lda.b a2
	sec
	sbc.b a1
	sta.b a2
	sta.w PlayerScrollCtr
.3:
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
