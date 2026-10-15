; Upload the title sample set (TitleSampleList, sound table MenuSfxTable)
SPCTitleUpload:
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
	lda.w #MenuSfxTable>>16
	sta.b $36
	lda.w #MenuSfxTable
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
.loop:
	lda.l TitleSampleList,x
	sta.b $0C
	lda.l TitleSampleList+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$003C
	bne .loop
.rtl:
	rtl
