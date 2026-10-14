; Sequencer: clear the command $08 values, then send command $08
SeqCmd08Init:
	jsl.l SPCCmd0D
	sep #$30
	lda.b #$00
	sta.w $07E9
	sta.w $07E8
	sta.w $07E7
	sta.w $07EA
	sta.w $07EB
	sta.w $07EC
SeqCmd08Init_send:
	lda.w APUIO0
	bne SeqCmd08Init_send
	lda.w $07F8
	sta.w APUIO1
	sta.w APUIO2
	lda.l $0007E9
	sta.w APUIO3
	lda.b #$08
	sta.w APUIO0
.loop:
	cmp.w APUIO0
	bne .loop
	lda.l $0007E8
	sta.w APUIO1
	lda.l $0007E7
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
.loop2:
	cpx.w APUIO0
	bne .loop2
	stz.w APUIO0
	rts
