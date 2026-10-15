; Stop voice Y
StopVoice:
	rep #$20
	lda.w VoiceInst,x
	cmp.w #$E1C0
	bcc .1
	cmp.w #$E2B1
	bcs .1
	lda.w #$0000
	sta.l streamstate
	lda.w #$0000
	sta.l streamsfx
.1:
	sep #$30
	lda.b #$00
	sta.w VoiceState,y
	lda.b #$FF
	sta.w VoiceTrack,y
	lda.b #$9F
	sta.b $5B
	jmp.w SeqCmd0C
