; Put sound entry $4E on a free voice (FindFreeVoice) with its pitch, volume and envelope (SeqCmd07)
StartSoundVoice:
	php
	rep #$20
	lda.w TrackInst,x
	beq .3
	sta.b InstPtr
	cmp.w #GameSfxTable_organl
	beq .1
	cmp.w #GameSfxTable_organr
	bne .2
.1:
	lda.b EventData2
	bmi .3
	beq .3
.2:
	sep #$30
	jsr.w FindFreeVoice
	stx.b CurVoice
	txa
	bpl .t1
.3:
	plp
	rts

.t1:
	asl a
	sta.w VoiceOfs
	lda.b CurTrack
	sta.w VoiceTrack,x
	ldy.b #$2A
	lda.b (InstPtr),y
	sta.w VoicePriority,x
	ldy.b #$15
	lda.b (InstPtr),y
	bpl .t2
	lda.b #$02
	bra .4

.t2:
	lda.b #$01
.4:
	sta.w VoiceState,x
	ldx.w VoiceOfs
	rep #$20
	lda.b InstPtr
	cmp.w #GameSfxTable_clap
	bne .t1x
	lda.w #$002D
	bra .5

.t1x:
	lda.b EventData2
.5:
	dec a
	sta.w VoiceLength,x
	stz.w VoiceAge,x
	stz.w VoiceVibCount,x
	stz.w VoiceVibOfs,x
	ldy.b #$1C
	lda.b (InstPtr),y
	sta.w VoiceVibRate,x
	stz.w VoiceVibRateFrac,x
	ldy.b #$20
	lda.b (InstPtr),y
	sta.w VoiceVibDepth,x
	stz.w VoiceVibDepthFrac,x
	ldy.b #$1E
	lda.b (InstPtr),y
	sta.w VoiceVibSpeed,x
	stz.w VoiceVibSpeedFrac,x
	ldy.b #$2D
	lda.b (InstPtr),y
	bmi .t1xx
	lda.w #$FFFF
	bra .6

.t1xx:
	lda.w #$0000
.6:
	sta.w VoiceVibDir,x
	ldy.b #$0A
	lda.b (InstPtr),y
	sta.w VoiceGain,x
	sta.b StartGain
	lda.b CurTrack
	and.w #$00FF
	cmp.w #$0010
	bne .1x
	lda.w sflags
	bit.w #$0800
	bne .1x
	lda.b StartGain
	sta.w recsfxvol
.1x:
	lda.b InstPtr
	sta.w VoiceInst,x
	sep #$20
	ldx.b EventData1
	lda.l VolumeCurve,x
	and.b #$FF
	cmp.b #$40
	bne .t1xxx
	ldx.b CurTrack
	lda.w TrackVolL,x
	sta.w VoiceVolL
	iny
	lda.w TrackVolR,x
	sta.w VoiceVolR
	jmp.w .7

.t1xxx:
	asl a
	sta.b EventData1
	ldx.b CurVoice
	sta.w VoiceVelocity,x
	ldx.b CurTrack
	xba
	lda.w TrackVolL,x
	jsr.w MulFrac8
	sta.w VoiceVolL
	lda.b EventData1
	xba
	lda.w TrackVolR,x
	jsr.w MulFrac8
	sta.w VoiceVolR
.7:
	lda.w MusicDuck
	beq .1xx
	lda.b CurTrack
	cmp.b #$10
	beq .1xx
	lsr.w VoiceVolR
	lsr.w VoiceVolL
	lda.w MusicDuck
	bpl .1xx
	lsr.w VoiceVolR
	lsr.w VoiceVolL
.1xx:
	ldy.b #$04
	lda.b EventCode
	clc
	adc.b (InstPtr),y
	sta.b EventCode
	ldx.b CurVoice
	sta.w VoiceNote,x
	ldx.b CurTrack
	cpx.b #$09
	bne .2x
	lda.b #$3F
	clc
	adc.b (InstPtr),y
.2x:
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	ldx.w VoiceOfs
	sta.w VoiceBasePitch,x
	sta.b EventData1
	sep #$20
	ldy.b CurTrack
	lda.w TrackBendRange,y
	beq .9
	lda.w TrackBend,y
	beq .9
	bmi .t2x
	lda.b EventCode
	clc
	adc.w TrackBendRange,y
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sec
	sbc.b EventData1
	sta.b EventData2
	sep #$20
	lda.w TrackBend,y
	tay
	rep #$20
	lda.b EventData2
	jsr.w MulFrac16
	clc
	adc.b EventData1
	sta.b EventData1
	bra .9

.t2x:
	lda.b EventCode
	sec
	sbc.w TrackBendRange,y
	asl a
	tax
	rep #$20
	lda.b EventData1
	sec
	sbc.l PitchTable,x
	sta.b EventData2
	sep #$20
	lda.b #$00
	sec
	sbc.w TrackBend,y
	bpl .t1xxxx
	rep #$20
	lda.b EventData2
	sta.b MulFracResult
	bra .8

.t1xxxx:
	tay
	rep #$20
	lda.b EventData2
	jsr.w MulFrac16
.8:
	lda.b EventData1
	sec
	sbc.b MulFracResult
	sta.b EventData1
.9:
	rep #$20
	ldy.b #$02
	lda.b (InstPtr),y
	ldx.w VoiceOfs
	clc
	adc.b EventData1
	sta.w VoicePitch,x
	lda.b CurTrack
	and.w #$00FF
	cmp.w #$0010
	bne .1xxx
	lda.w sflags
	bit.w #$0800
	bne .1xxx
	lda.w VoicePitch,x
	sta.w recsfxpitch
.1xxx:
	sep #$20
	jsr.w SeqCmd07
	tya
	plp
	rts
