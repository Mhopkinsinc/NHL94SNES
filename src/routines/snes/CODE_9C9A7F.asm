; Unidentified routine.
CODE_9C9A7F:
	sep #$20
	dec.w $07E5
	rep #$20
	sta.b $14
	phx
	lda.l $7E35E6
	beq CODE_9C9AA6
	cmp.b $14
	beq CODE_9C9AB3
	lda.l $7E35E6
	cmp.w #$0003
	bcc CODE_9C9AB3
	asl a
	tax
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A2A8
CODE_9C9AA6:
	lda.w #$0000
	sta.l $7E35E8
	lda.b $14
	sta.l $7E35E6
CODE_9C9AB3:
	sep #$20
	inc.w $07E5
	rep #$20
	plx
	rtl
