; mesarea = the uniform number and name of roster player d0 of team a2
PlayerNumName:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b a2
	pha
	lda.b $93
	pha
	lda.b a3
	pha
	lda.b $97
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w #mesarea
	sta.b a3
	inc a
	inc a
	sta.b a1
	lda.w #$0000
	sta.b $97
	sta.b $8F
	lda.w #$0004
	sta.b [a3]
	lda.b a0
	clc
	adc.b [a0]
	sta.b a0
	lda.b [a0]
	and.w #$00FF
	sta.b d0
	jsl.l PutDigits2
	lda.w #$009C
	sta.b $8F
	lda.w #PlayerNumNamePos
	sta.b a1
	jsl.l appstring
	pla
	sta.b $8F
	pla
	sta.b a1
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $97
	pla
	sta.b a3
	pla
	sta.b $93
	pla
	sta.b a2
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	rtl
