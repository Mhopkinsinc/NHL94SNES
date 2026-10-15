; Track X: count down its wait, or play its events until the next wait
StepTrack:
	txa
	sta.b CurTrack
	asl a
	tax
	stx.w CurTrackOfs
.1:
	rep #$20
	lda.w TrackWait,x
	beq .t1
	jmp.w .13

.t1:
	lda.w TrackPtr,x
	sta.b CurTrackPtr
.2:
	jsr.w ReadTrackEvent
	lda.b EventPtr
	sta.b CurTrackPtr
	ldx.w CurTrackOfs
	ldy.b EventCode
	cpy.b #$D9
	bcs .t1x
	jmp.w .11

.t1x:
	cpy.b #$D9
	beq .1x
	cpy.b #$DA
	bne .t3
.1x:
	jsl.l MusicStop
	jmp.w .14

.t3:
	cpy.b #$E2
	bne .t1xx
	lda.w TrackPtr,x
	sta.w TrackLoop,x
	jmp.w .12

.t1xx:
	cpy.b #$DB
	bne .t2
	lda.w TrackLoop,x
	sta.w TrackPtr,x
	bra .1

.t2:
	cpy.b #$DD
	bne .t1xxx
.1xx:
	ldy.b EventData1
	sty.w TempoTick
	jmp.w .12

.t1xxx:
	cpy.b #$DE
	beq .3
	jmp.w .10
.3:
	lda.w TrackInst,x
	sta.b InstPtr
	sep #$20
	lda.w SoundMono
	bne .t1xxxx
	ldy.b #$12
	lda.b (InstPtr),y
	sta.w InstVolL
	iny
	lda.b (InstPtr),y
	bra .2x

.t1xxxx:
	ldy.b #$17
	lda.b (InstPtr),y
	sta.w InstVolL
.2x:
	sta.w InstVolR
	ldx.b CurTrack
	lda.w InstVolL
	xba
	lda.b EventData1
	jsr.w MulFrac8
	sta.w TrackVolL,x
	lda.w InstVolR
	xba
	lda.b EventData1
	jsr.w MulFrac8
	sta.w TrackVolR,x
	ldy.b #$07
.loop:
	lda.w VoiceTrack,y
	cmp.b CurTrack
	bne .1xxx
	ldx.b CurTrack
	lda.w TrackVolL,x
	xba
	lda.w VoiceVelocity,y
	jsr.w MulFrac8
	sta.w VoiceVolL
	lda.w TrackVolR,x
	xba
	lda.w VoiceVelocity,y
	jsr.w MulFrac8
	sta.w VoiceVolR
.loop2:
	lda.w APUIO0
	bne .loop2
	lda.w VoiceVolR
	sta.w APUIO3
	lda.w VoiceVolL
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0E
	sta.w APUIO0
.loop3:
	cmp.w APUIO0
	bne .loop3
	stz.w APUIO0
.1xxx:
	dey
	bpl .loop
	rep #$20
	jmp.w .12
.4:
	lda.b EventData2
	sta.b EventData1
	jmp.w .3
.10:
	cpy.b #$DF
	beq .t1xxxxx
	jmp.w .t5

.t1xxxxx:
	ldy.b EventData1
	cpy.b #$07
	beq .4
.1xxxx:
	cpy.b #$40
	bne .t2x
	sep #$20
	ldx.b CurTrack
	lda.b EventData2
	sta.w TrackSustain,x
	bne .3x
	ldx.b #$07
.loopx:
	lda.w VoiceTrack,x
	cmp.b CurTrack
	bne .2xx
	lda.w VoiceState,x
	beq .2xx
	phx
	txy
	txa
	asl a
	tax
	rep #$20
	jsr.w ReleaseVoice
	sep #$20
	plx
.2xx:
	dex
	bpl .loopx
.3x:
	rep #$20
	jmp.w .12

.t2x:
	cpy.b #$0B
	bne .t1xxxxxx
	sep #$20
	ldx.b CurTrack
	lda.b EventData2
	sta.w TrackVolL,x
	rep #$20
	jmp.w .12

.t1xxxxxx:
	cpy.b #$0C
	bne .t4
	sep #$20
	ldx.b CurTrack
	lda.b EventData2
	sta.w TrackVolR,x
	rep #$20
	jmp.w .12

.t4:
	cpy.b #$32
	bne .t1x2
	sep #$20
	lda.b EventData2
	sta.w EchoVoices
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t1x2:
	cpy.b #$33
	bne .t2xx
	sep #$20
	lda.b EventData2
	sta.w EchoDelay
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t2xx:
	cpy.b #$34
	bne .t1xxxxxxx
	sep #$20
	lda.b EventData2
	sta.w EchoVolume
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t1xxxxxxx:
	cpy.b #$35
	bne .t3x
	sep #$20
	lda.b EventData2
	sta.w EchoFeedback
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t3x:
	cpy.b #$37
	bne .t1x2x
	sep #$20
	lda.b EventData2
	sta.w SoundVolume+1
	jsr.w SeqCmd08Init_send
	rep #$20
	jmp.w .12

.t1x2x:
	cpy.b #$38
	bne .t2xxx
	jmp.w .12

.t2xxx:
	cpy.b #$39
	bne .t1xxxxxxxx
	sep #$20
	lda.b EventData2
	sta.w NoiseVoices
	jsr.w SeqCmd08Init_send
	rep #$20
	jmp.w .12

.t1xxxxxxxx:
	cpy.b #$3A
	bne .1xxxxx
.1xxxxx:
	jmp.w .12

.t5:
	cpy.b #$E5
	beq .t2x2
	jmp.w .9

.t2x2:
	lda.b EventData2
	sep #$20
	asl a
	rep #$20
	sec
	sbc.w #$4000
	asl a
	sep #$20
	xba
	ldx.b CurTrack
	sta.w TrackBend,x
	sta.b BendAmount
	lda.w TrackBendRange,x
	bne .t1x3
.1x2:
	jmp.w .8

.t1x3:
	sta.b EventCode
	ldy.b #$07
.4x:
	lda.w VoiceTrack,y
	cmp.b CurTrack
	beq .t3xx
	jmp.w .7

.t3xx:
	phy
	tya
	asl a
	tax
	phx
	lda.b BendAmount
	beq .t1xxxxxxxxx
	bmi .t2xxxx
	lda.w VoiceNote,y
	clc
	adc.b EventCode
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	plx
	sec
	sbc.w VoiceBasePitch,x
	sta.b EventData2
	sep #$20
	lda.b BendAmount
	tay
	rep #$20
	lda.b EventData2
	jsr.w MulFrac16
	clc
	adc.w VoiceBasePitch,x
	sta.b EventData1
	bra .6

.t1xxxxxxxxx:
	rep #$20
	plx
	lda.w VoiceBasePitch,x
	sta.b EventData1
	bra .6

.t2xxxx:
	lda.w VoiceNote,y
	sec
	sbc.b EventCode
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sta.b EventData1
	plx
	lda.w VoiceBasePitch,x
	sec
	sbc.b EventData1
	sta.b EventData2
	sep #$20
	lda.b #$00
	sec
	sbc.b BendAmount
	bpl .t1xxxxxxxxxx
	rep #$20
	lda.b EventData2
	sta.b MulFracResult
	bra .5

.t1xxxxxxxxxx:
	tay
	rep #$20
	lda.b EventData2
	jsr.w MulFrac16
.5:
	lda.w VoiceBasePitch,x
	sec
	sbc.b MulFracResult
	sta.b EventData1
.6:
	ldy.b #$02
	lda.b (InstPtr),y
	clc
	adc.b EventData1
	sta.w VoicePitch,x
	ply
.7:
	sep #$20
	dey
	bmi .8
	jmp.w .4x
.8:
	rep #$20
	jmp.w .12
.9:
	cpy.b #$DC
	bne .4xx
	lda.b EventData1
	and.w #$00FF
	cmp.w #$006A
	bne .2xxx
.1xxxxxx:
	lda.w #$0014
.2xxx:
	asl a
	tay
	lda.b [SoundTable],y
	clc
	adc.b SoundTable
	sta.w TrackInst,x
	sta.b InstPtr
	sep #$20
	ldx.b CurTrack
	ldy.b #$2F
	lda.b (InstPtr),y
	sta.w TrackBendRange,x
	stz.w TrackBend,x
	lda.w SoundMono
	bne .t1xxxxxxxxxxx
	ldy.b #$12
	lda.b (InstPtr),y
	sta.w TrackVolL,x
	iny
	lda.b (InstPtr),y
	bra .3xx

.t1xxxxxxxxxxx:
	ldy.b #$17
	lda.b (InstPtr),y
	sta.w TrackVolL,x
.3xx:
	sta.w TrackVolR,x
.4xx:
	rep #$20
	cpy.b #$EA
	bne .2xxxx
.1xxxxxxx:
	lda.b EventData1
	and.w #$00FF
	sta.b EventEAUnused
.2xxxx:
	rep #$20
	jmp.w .12
.11:
	sep #$20
	lda.b CurTrack
	cmp.b #$09
	bne .1xxxxxxxx
	asl a
	tax
	tya
	sec
	sbc.b #$2F
	asl a
	tay
	rep #$20
	lda.b [SoundTable],y
	clc
	adc.b SoundTable
	sta.b InstPtr
	lda.b InstPtr
	sta.w TrackInst,x
	sep #$20
	ldx.b CurTrack
	ldy.b #$12
	lda.b [InstPtr],y
	sta.w TrackVolL,x
	iny
	lda.b [InstPtr],y
	sta.w TrackVolR,x
	ldy.b #$2F
	lda.b [InstPtr],y
	sta.w TrackBendRange,x
	stz.w TrackBend,x
.1xxxxxxxx:
	lda.b CurTrack
	asl a
	tax
	rep #$20
	jsr.w StartSoundVoice
.12:
	jsr.w ReadVarLen
	ldx.w CurTrackOfs
	cmp.w #$0000
	bne .t2xxxxx
	jmp.w .2

.t1xxxxxxxxxxxx:
	rep #$20
	bra .12

.t2xxxxx:
	sta.w TrackWait,x
	lda.b CurTrackPtr
	sta.w TrackPtr,x
.13:
	dec.w TrackWait,x
.14:
	sep #$30
	ldx.b CurTrack
	rts
