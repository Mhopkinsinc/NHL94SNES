; Unidentified routine.
CODE_9C97E9:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C983C
	jsl.l CODE_8086A9
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
	lda.w #$E741
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9821:
	lda.l DATA8_80E73D,x
	sta.b $0C
	lda.l DATA8_80E73D+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$0004
	bne CODE_9C9821
CODE_9C983C:
	rtl
