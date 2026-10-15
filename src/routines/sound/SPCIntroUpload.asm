; Upload the intro sample set (IntroSampleList, sound table IntroSfxTable), unless it is loaded
SPCIntroUpload:
	stz.w cursong
	lda.w sndbank
	cmp.w #$0001
	beq .rtl
	jsl.l forceblack
	lda.w #$0001
	sta.w sndbank
	sep #$20
	dec.w SoundLock
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w SoundLock
	rep #$20
	lda.w #IntroSfxTable>>16
	sta.b SoundTable+2
	lda.w #IntroSfxTable
	sta.b SoundTable
	jsl.l SoundInit
	ldx.w #$0000
.loop:
	lda.l IntroSampleList,x
	sta.b $0C
	lda.l IntroSampleList+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0004
	bne .loop
.rtl:
	rtl
