; Unidentified routine.
RandomWord:
	lda.w $0792
	beq .3
	asl a
	bcc .1
	eor.w #$1D87
.1:
	sta.w $0792
	lda.w $0794
	beq .4
	asl a
	bcc .2
	eor.w #$1D87
.2:
	sta.w $0794
	clc
	adc.w $0792
	rtl
.3:
	lda.w #$A5A5
	bra .1
.4:
	lda.w #$B4B4
	bra .2

.t1:
	rtl
