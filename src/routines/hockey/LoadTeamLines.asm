; Copy team a2's lines from its team data into its RAM lines (GetTeamLines)
LoadTeamLines:
	lda.b $97
	pha
	lda.b a3
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.b d0
	pha
	phy
	jsl.l GetTeamLines
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$0006
	clc
	adc.b [a1],y
	sta.b a1
	lda.w #$0000
	sta.b d0
.loop:
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	lda.b d0
	inc a
	sta.b d0
	cmp.w #$0038
	bmi .loop
	lda.l $7E34C6
	bne .1
	jsl.l GetTeamLines
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$000C
	clc
	adc.b [a1],y
	sta.b a1
	lda.w #$0000
	sta.b d0
.loop2:
	sep #$20
	lda.b [a1]
	sta.b [a3]
	rep #$20
	inc.b a1
	inc.b a3
	lda.b d0
	inc a
	sta.b d0
	cmp.w #$0008
	bmi .loop2
.1:
	ply
	pla
	sta.b d0
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b a3
	pla
	sta.b $97
	rtl
