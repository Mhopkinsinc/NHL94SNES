; Print the label of the current period
PrintPerLabel:
	lda.w gsp
	sta.b d0
	cmp.w #$0004
	bne .list
	dec.w printx
	inc.b d0
.list:
	lda.w #PerLabels>>16
	sta.b a0+2
	lda.w #PerLabels
	sta.b a0
.next:
	lda.b a0+2
	sta.b a1+2
	lda.b a0
	sta.b a1
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	dec.b d0
	bpl .next
	jml.l print
