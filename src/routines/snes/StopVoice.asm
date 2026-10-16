; Stop voice Y
StopVoice:
	rep #$20
	lda.w VoiceInst,x
	cmp.w #GameSfxTable_stream
	bcc .1
	cmp.w #GameSfxTable_streamlast+1
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
	sta.b DSPGain
	jmp.w SeqCmd0C
