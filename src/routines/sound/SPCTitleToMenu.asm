; Send the four blocks that turn the title sample set into the menu set, then mark $1D68 = 2
SPCTitleToMenu:
	stz.w cursong
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	jsl.l SPCCmd04
	lda.w #SampleTimp>>16
	sta.b $0E
	lda.w #SampleTimp
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #SampleDist>>16
	sta.b $0E
	lda.w #SampleDist
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #SamplePlayoffOrgan>>16
	sta.b $0E
	lda.w #SamplePlayoffOrgan
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #SampleAPower>>16
	sta.b $0E
	lda.w #SampleAPower
	sta.b $0C
	jsl.l SPCUploadBlock
	lda.w #$0002
	sta.w $1D68
	rtl
