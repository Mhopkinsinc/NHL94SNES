; Upload the in-game sample set, unless it is the one loaded
SPCGameUpload:
	lda.w $1D68
	cmp.w #$0001
	beq .rtl
	jsl.l forceblack
	lda.w #$0001
	sta.w $1D68
	sep #$20
	dec.w SoundLock
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w SoundLock
	rep #$20
	lda.w #$0080
	sta.b $36
	lda.w #$DD66
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
.loop:
	lda.l DATA8_80DD16,x
	sta.b $0C
	lda.l DATA8_80DD16+2,x
	sta.b $0E
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
