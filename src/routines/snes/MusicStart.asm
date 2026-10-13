; Unidentified routine.
MusicStart:		; start the song at [$0C]: tempo from its second byte, tracks from its offset list
	php
	sep #$30
	jsl.l MusicStop
	dec.w SoundLock
	lda.b #$1F
	ldy.b #$10
CODE_80A2EE:
	sta.w $08E1,y
	dey
	bpl CODE_80A2EE
	rep #$10
	ldy.w #$0001
	ldx.w #$2760
	lda.w STAT78
	bit.b #$10
	beq CODE_80A306
	ldx.w #$1FE0
CODE_80A306:
	lda.b [$0C],y
	jsl.l DivX8U
	sta.w $07F6
	sep #$10
	lda.b $0E
	sta.b $58
	rep #$20
	lda.b $0C
	sta.w $07ED
	ldx.b #$00
	ldy.b #$08
CODE_80A320:
	lda.b [$0C],y
	beq CODE_80A333
	clc
	adc.b $0C
	sta.w $0804,x
	sta.w $0826,x
	iny
	iny
	inx
	inx
	bra CODE_80A320
