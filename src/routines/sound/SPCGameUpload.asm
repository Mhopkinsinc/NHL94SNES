; Upload the in-game sample set, unless it is the one loaded
SPCGameUpload:
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
	lda.w #GameSfxTable>>16
	sta.b SoundTable+2
	lda.w #GameSfxTable
	sta.b SoundTable
	jsl.l SoundInit
	ldx.w #$0000
.loop:
	lda.l GameSampleList,x
	sta.b p0
	lda.l GameSampleList+2,x
	sta.b p0+2
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0050
	bne .loop
.rtl:
	rtl
