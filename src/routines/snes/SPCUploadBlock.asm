; SPCUpload of the block at [$0C]: address and length (big-endian words), then the data
SPCUploadBlock:
	sep #$20
	dec.w SoundLock
	rep #$20
	ldy.w #$0000
	lda.b [$0C],y
	xba
	sta.b $14
	ldy.w #$0002
	lda.b [$0C],y
	xba
	tax
	ldy.b $14
	lda.b $0C
	clc
	adc.w #$0004
	sta.b $0C
	jsl.l SPCUpload
	sep #$20
	inc.w SoundLock
	rep #$20
	rtl
