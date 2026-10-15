; Find a free voice, starting after the last one used
FindFreeVoice:
	lda.b $66
	inc a
	and.b #$07
	sta.b $66
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
	sta.b $4B
	stz.w InstVolL
	stz.w VoiceVolL
	stz.w InstVolR
	ldy.b #$2A
	lda.b ($4E),y
	sta.w VoiceVolR
	lda.b #$08
	sta.b $68
	ldx.b $66
	ldy.b #$0E
.3:
	lda.b ($4E)
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
	stx.b $4B
	sta.w InstVolL
	bra .4

.t1:
	stx.b $4B
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
	dec.b $68
	bne .3
	ldx.b $4B
	txy
	jmp.w SeqCmd0C
.5:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq .2
	rts
