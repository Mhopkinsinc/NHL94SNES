; Copy the next plain script word into mesarea and type it (not a % code)
ScoutPlainWord:
	lda.w #$FFFF
	sta.w PlayerScrollCtr
	lda.w #mesarea>>16
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
	lda.w #mesarea>>16
	sta.b $8F
	lda.w #mesarea
	sta.b a1
ScoutTypeWord:
	lda.b d0
	sec
	sbc.w #$0014
	beq .3
	bmi .2
	bvs .3
.1:
	jsl.l ScrollDisplayUp
	bra .3
.2:
	bvs .1
.3:
	lda.w $0D47
	bne .t1
	ldy.w #$0002
.loop:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .t1
	lda.b [a1]
	dec a
	inc.b a1
	sta.b [a1]
	dec.b d1
	iny
	bra .loop

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ScoutNamePosAt>>16
	sta.b $8F
	lda.w #ScoutNamePosAt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $0D47
	clc
	adc.w printx
	sta.w printx
	lda.w VertLineScrolling
	clc
	adc.w printy
	sta.w printy
	jsl.l print
	lda.w $0D47
	clc
	adc.b d1
	sta.w $0D47
	rtl
