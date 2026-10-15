; Other scores: game $1DB9, its two teams with their scores and the period label (PerLabels)
PrintOtherScore:
	lda.w curitem
	asl a
	tax
	lda.l gss1,x
	sta.b d0
	lda.l gst1,x
	jsr.w PrintOtherScoreTeam
	inc.w printy
	lda.l gss2,x
	sta.b d0
	lda.l gst2,x
	jsr.w PrintOtherScoreTeam
	lda.w #$0017
	sta.w printx
	lda.l gsper,x
	sta.b d0
	lda.l gss1,x
	cmp.l gss2,x
	beq .2
	lda.b d0
	cmp.w #$0004
	bne .2
.1:
	inc.b d0
.2:
	lda.w #PerLabels>>16
	sta.b a0+2
	lda.w #PerLabels
	sta.b a0
.loop:
	lda.b a0+2
	sta.b a1+2
	lda.b a0
	sta.b a1
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	dec.b d0
	bmi .3
	bne .loop
.3:
	jsl.l PrintToStatsPage
	inc.w printy
	rts
