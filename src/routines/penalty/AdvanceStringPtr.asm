; a1 = string d0 of the string list [a1]
AdvanceStringPtr:
	bra .2
.1:
	lda.b a1
	clc
	adc.b [a1]
	sta.b a1
.2:
	dec.b d0
	bpl .1
	rtl
