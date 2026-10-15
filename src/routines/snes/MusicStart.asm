; start the song at [$0C]: tempo from its second byte, tracks from its offset list
MusicStart:
	php
	sep #$30
	jsl.l MusicStop
	dec.w SoundLock
	lda.b #$1F
	ldy.b #$10
.loop:
	sta.w TrackUnused,y
	dey
	bpl .loop
	rep #$10
	ldy.w #$0001
	ldx.w #$2760
	lda.w STAT78
	bit.b #$10
	beq .1
	ldx.w #$1FE0
.1:
	lda.b [$0C],y
	jsl.l DivX8U
	sta.w TempoTick
	sep #$10
	lda.b $0E
	sta.b $58
	rep #$20
	lda.b $0C
	sta.w SongPtr
	ldx.b #$00
	ldy.b #$08
.loop2:
	lda.b [$0C],y
	beq .t1
	clc
	adc.b $0C
	sta.w TrackPtr,x
	sta.w TrackLoop,x
	iny
	iny
	inx
	inx
	bra .loop2

.t1:
	stz.w SongUnused
	sep #$20
	ldy.b #$06
	lda.b [$0C],y
	sta.w TrackCount
	lda.b #$01
	sta.w MusicOn
	inc.w SoundLock
	plp
	rtl
