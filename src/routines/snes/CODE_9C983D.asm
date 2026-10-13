; Unidentified routine.
CODE_9C983D:
	stz.w $0CC3
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C9890
	jsl.l CODE_8086A9
	lda.w #$0001
	sta.w $1D68
	sep #$20
	dec.w $07E5
	rep #$20
	jsl.l SPCCmd01
	sep #$20
	inc.w $07E5
	rep #$20
	lda.w #$009B
	sta.b $36
	lda.w #DATA8_9BB4C9
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9875:
	lda.l DATA8_80E6C1,x
	sta.b $0C
	lda.l DATA8_80E6C1+2,x
	sta.b $0E
	phx
	jsl.l SPCUploadBlock
	plx
	inx
	inx
	inx
	inx
	cpx.w #$003C
	bne CODE_9C9875
CODE_9C9890:
	rtl
