; UpdateCrowdMeter into CurCrowdMeter; reaching 105-109 dB sets $19C0, and falling back under 105 then calls LowerHotColdTable
CheckCrowdMeter:
	lda.b d0
	pha
	jsl.l UpdateCrowdMeter
	lda.b d0
	sta.w CurCrowdMeter
	cmp.w #$0069
	bmi .t1
	cmp.w #$006E
	bmi .1
	lda.w #$0001
	sta.w CrowdLoud
	bra .1

.t1:
	lda.w CrowdLoud
	beq .1
	jsl.l LowerHotColdTable
	stz.w CrowdLoud
.1:
	pla
	sta.b d0
	rtl
