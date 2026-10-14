; Show or clear the scroll arrows beside a summary list, then send the text map
PrintScrollArrows:
	lda.w $1DBD
	clc
	adc.w #$0005
	cmp.w $1DC1
	bpl .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #RightArrowTxt2>>16
	sta.b $8F
	lda.w #RightArrowTxt2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .1

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PrintScrollArrowsPos>>16
	sta.b $8F
	lda.w #PrintScrollArrowsPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.1:
	lda.w $1DBD
	dec a
	bmi .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #LeftArrowTxt2>>16
	sta.b $8F
	lda.w #LeftArrowTxt2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PrintScrollArrowsPos2>>16
	sta.b $8F
	lda.w #PrintScrollArrowsPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2:
	jsl.l QueueTextDMA
	rtl
