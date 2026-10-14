; Unidentified routine.
CODE_9C978E:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0002
	beq .1
	jsl.l forceblack
	lda.w #$0002
	sta.w $1D68
	sep #$20
	dec.w SoundLock
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w SoundLock
	rep #$20
	lda.w #$009B
	sta.b $36
	lda.w #DATA8_9BB4C9
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
.loop:
	lda.l DATA8_80E6FD,x
	sta.b $0C
	lda.l DATA8_80E6FD+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0040
	bne .loop
.1:
	lda.w #$0000
	sta.l $7E35EA
	rtl
