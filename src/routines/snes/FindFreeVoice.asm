; Find a free voice, starting after the last one used
FindFreeVoice:
	lda.b VoiceRotor
	inc a
	and.b #$07
	sta.b VoiceRotor
	ldy.b #$07
	tax
.1:
	lda.w VoiceState,x
	beq .5
.2:
	inx
	txa
	and.b #$07
	tax
	dey
	bpl .1
	lda.b #$FF
	sta.b CurVoice
	stz.w InstVolL
	stz.w VoiceVolL
	stz.w InstVolR
	ldy.b #$2A
	lda.b (InstPtr),y
	sta.w VoiceVolR
	lda.b #$08
	sta.b StealCount
	ldx.b VoiceRotor
	ldy.b #$0E
.3:
	lda.b (InstPtr)
	and.l ByteBitMasks,x
	beq .4
	lda.w VoiceVolR
	cmp.w VoicePriority,x
	bcc .4
	lda.w VoiceState,x
	cmp.w InstVolR
	bcc .4
	bne .t1
	rep #$20
	lda.w VoiceAge,y
	cmp.w InstVolL
	bcc .4
	stx.b CurVoice
	sta.w InstVolL
	bra .4

.t1:
	stx.b CurVoice
	sta.w InstVolR
	rep #$20
	lda.w VoiceAge,y
	sta.w InstVolL
.4:
	sep #$20
	inx
	txa
	and.b #$07
	tax
	dey
	dey
	dec.b StealCount
	bne .3
	ldx.b CurVoice
	txy
	jmp.w SeqCmd0C
.5:
	lda.b (InstPtr)
	and.l ByteBitMasks,x
	beq .2
	rts
