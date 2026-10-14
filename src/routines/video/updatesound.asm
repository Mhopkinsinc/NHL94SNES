; Set the crowd noise volume from crowdlevel
updatesound:
	lda.l crowdlevel
	cmp.w #$0380
	bcc .1
	lda.w #$0380
.1:
	clc
	adc.w #$0080
	asl a
	asl a
	asl a
	asl a
	sta.w $093C
	phx
	tax
	lda.w #$0015
	jsl.l DivX8U
	plx
	clc
	adc.w #$0253
	sta.w $094C
	lda.w $093C
	cmp.w #$2733
	bcs .t1
	lda.w #$0100
	sta.w $093A
	rtl

.t1:
	sec
	sbc.w #$2600
	asl a
	asl a
	sta.w $093A
	rtl
