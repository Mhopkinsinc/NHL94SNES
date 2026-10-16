; Show or clear the scroll arrows beside a summary list, then send the text map
PrintScrollArrows:
	lda.w listtop
	clc
	adc.w #$0005
	cmp.w listend
	bpl .t1
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #RightArrowTxt2>>16
	sta.b a1+2
	lda.w #RightArrowTxt2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	bra .1

.t1:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #PrintScrollArrowsPos>>16
	sta.b a1+2
	lda.w #PrintScrollArrowsPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
.1:
	lda.w listtop
	dec a
	bmi .t1x
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #LeftArrowTxt2>>16
	sta.b a1+2
	lda.w #LeftArrowTxt2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	bra .2

.t1x:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #PrintScrollArrowsPos2>>16
	sta.b a1+2
	lda.w #PrintScrollArrowsPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
.2:
	jsl.l QueueTextDMA
	rtl
