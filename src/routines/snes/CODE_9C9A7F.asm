; Unidentified routine.
CODE_9C9A7F:
	sep #$20
	dec.w SoundLock
	rep #$20
	sta.b $14
	phx
	lda.l $7E35E6
	beq .1
	cmp.b $14
	beq .2
	lda.l $7E35E6
	cmp.w #$0003
	bcc .2
	asl a
	tax
	lda.l DATA8_9C9A73-2,x
	jsl.l StopSound
.1:
	lda.w #$0000
	sta.l $7E35E8
	lda.b $14
	sta.l $7E35E6
.2:
	sep #$20
	inc.w SoundLock
	rep #$20
	plx
	rtl
