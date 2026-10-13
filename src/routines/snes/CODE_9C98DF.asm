; Unidentified routine.
CODE_9C98DF:
	lda.w $1D68
	cmp.w #$0001
	beq CODE_9C992F
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
	lda.w #$0080
	sta.b $36
	lda.w #$DD66
	sta.b $34
	jsl.l SoundInit
	ldx.w #$0000
CODE_9C9914:
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
	bne CODE_9C9914
CODE_9C992F:
	rtl
