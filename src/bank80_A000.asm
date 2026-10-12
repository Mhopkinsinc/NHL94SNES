; Bank $80, third 4 KB: the CPU side of the music and sound effect player, then the sound driver boot upload.
; The player shares the sound driver voices between the song tracks and the sound effects. For each voice it keeps
; the owner, state, pitch, volume and an envelope, and it sends key on/off, pitch and volume changes to the driver through
; the APUIO ports. Sound effects come from the table at [$34]. Song tracks are byte streams: notes, and commands $D9 and up.
; The tracks advance one tick at a time. SoundUpdate runs every frame from the NMI unless SoundLock is set: it applies the
; fade, steps the envelopes and plays the song ticks that are due. PitchTable gives the driver pitch of each semitone, and
; VolumeCurve scales note volumes. SPCIPLUpload sends the sound driver through the sound CPU's boot loader. The last
; routines set up and fill buffers in bank $7E; they are not traced yet.

org $809FF5
PitchTable:		; sound driver pitch of each semitone, from the lowest octave up
	dw $0020,$0021,$0023,$0026,$0028,$002A,$002D,$002F,$0032,$0035,$0039,$003C
	dw $0040,$0043,$0047,$004C,$0050,$0055,$005A,$005F,$0065,$006B,$0072,$0078
	dw $0080,$0087,$008F,$0098,$00A1,$00AA,$00B5,$00BF,$00CB,$00D7,$00E4,$00F1
	dw $0100,$010F,$011F,$0130,$0142,$0155,$016A,$017F,$0196,$01AE,$01C8,$01E3
	dw $0200,$021E,$023E,$0260,$0285,$02AB,$02D4,$02FF,$032C,$035D,$0390,$03C6
	dw $0400,$043C,$047D,$04C1,$050A,$0556,$05A8,$05FE,$0659,$06BA,$0720,$078D
	dw $0800,$0879,$08FA,$0983,$0A14,$0AAD,$0B50,$0BFC,$0CB2,$0D74,$0E41,$0F1A
	dw $1000,$10F3,$11F5,$1306,$1428,$155B,$16A0,$17F9,$1965,$1AE8,$1C82,$1E34
	dw $2000,$21E7,$23EB,$260D,$2851,$2AB7,$2D41,$2FF2,$32CB,$35D1,$3904,$3C68
	dw $2000,$21E7,$23EB,$260D,$2851,$2AB7,$2D41,$2FF2,$32CB,$35D1,$3904,$3C68
	dw $2000,$21E7,$23EB,$260D,$2851,$2AB7,$2D41,$2FF2,$32CB,$35D1,$3904,$3C68
VolumeCurve:		; note volume 0-$7F to a scale of 64
	db $00,$00,$00,$00,$01,$01,$01,$01,$02,$02,$02,$03,$03,$03,$04,$04
	db $05,$05,$05,$06,$06,$07,$07,$08,$08,$08,$09,$09,$0A,$0A,$0B,$0C
	db $0C,$0D,$0D,$0E,$0E,$0F,$0F,$10,$11,$11,$12,$12,$13,$14,$14,$15
	db $16,$16,$17,$17,$18,$19,$19,$1A,$1B,$1B,$1C,$1D,$1D,$1E,$1F,$1F
	db $20,$21,$21,$22,$23,$23,$24,$25,$25,$26,$27,$27,$28,$29,$29,$2A
	db $2B,$2B,$2C,$2D,$2D,$2E,$2E,$2F,$30,$30,$31,$31,$32,$32,$33,$34
	db $34,$35,$35,$36,$36,$37,$37,$38,$38,$39,$39,$3A,$3A,$3A,$3B,$3B
	db $3C,$3C,$3C,$3D,$3D,$3E,$3E,$3E,$3E,$3F,$3F,$3F,$3F,$3F,$3F,$3F

CODE_80A17D:
	phx
	phy
	phb
	php
	pha
	sep #$30
	dec.w SoundLock
	lda.b $50
	pha
	plb
	rep #$30
	lda.b $01,s
	sep #$10
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
CODE_80A19D:
	lda.w $092A,x
	cmp.b $4E
	beq CODE_80A1E9
CODE_80A1A4:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A19D
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w $07FF
	lda.b $4E
	sta.w $086A,x
	lda.w $15D8
	bit.w #$0800
	bne CODE_80A1E5
	pla
	phx
	rep #$10
	ldx.w $0CAD
	bmi CODE_80A1DC
	ldx.w $0CAD
	stx.w $0CB3
	ldx.w $0CAF
	stx.w $0CB5
	ldx.w $0CB1
	stx.w $0CB7
CODE_80A1DC:
	sta.w $0CAD
	sep #$10
	plx
	jmp.w CODE_80A226
CODE_80A1E5:
	pla
	jmp.w CODE_80A226
CODE_80A1E9:
	lda.w $08F2,y
	and.w #$00FF
	beq CODE_80A1A4
	pla
	tya
	and.w #$00FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
CODE_80A200:
	phx
	phy
	phb
	php
	sep #$30
	pha
	dec.w SoundLock
	lda.b $50
	pha
	plb
	pla
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w $07FF
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	sta.w $086A,x
CODE_80A226:
	ldy.b #$06
	lda.b ($4E),y
	sta.b $5E
	sep #$20
	ldy.b #$05
	lda.b ($4E),y
	sta.b $60
	ldy.b #$2F
	lda.b ($4E),y
	sta.w $089D,x
	stz.w $088C,x
	lda.w $07E3
	bne CODE_80A24F
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08BE
	iny
	lda.b ($4E),y
	bra CODE_80A256
CODE_80A24F:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08BE
CODE_80A256:
	sta.w $08CF
	lda.b $65
	sta.b $5A
	ldy.b #$10
	jsr.w CODE_80A697
	and.b #$FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
CODE_80A26E:
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b $50
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
CODE_80A28B:
	lda.w $092A,x
	cmp.b $4E
	bne CODE_80A297
	jsr.w CODE_80ABF7
	bra CODE_80A29E
CODE_80A297:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A28B
CODE_80A29E:
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
CODE_80A2A8:
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b $50
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
CODE_80A2C5:
	lda.w $092A,x
	cmp.b $4E
	bne CODE_80A2CF
	jsr.w CODE_80ABC7
CODE_80A2CF:
	inx
	inx
	iny
	cpy.b #$08
	bne CODE_80A2C5
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
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
CODE_80A333:
	stz.w $07EF
	sep #$20
	ldy.b #$06
	lda.b [$0C],y
	sta.w $0801
	lda.b #$01
	sta.w MusicOn
	inc.w SoundLock
	plp
	rtl
MusicStop:		; stop the song: release its voices and clear its tracks
	php
	sep #$30
	lda.b #$FF
	sta.w SoundLock
	stz.w MusicOn
	stz.w $0801
	ldy.b #$07
	ldx.b #$0E
CODE_80A35B:
	lda.w $08FA,y
	cmp.b #$10
	bcs CODE_80A36A
	lda.w $08F2,y
	beq CODE_80A36A
	jsr.w CODE_80ABC7
CODE_80A36A:
	dex
	dex
	dey
	bpl CODE_80A35B
	ldy.b #$00
	ldx.b #$10
	jsr.w CODE_80A3D8
	stz.w SoundLock
	plp
	rtl
SetSoundFade:		; SoundFadeSpeed = A
	sta.l SoundFadeSpeed
	rtl
SoundInit:		; silence everything and reset the player; SoundVolume = $5000
	php
	sep #$20
	rep #$10
	lda.b #$FF
	sta.w SoundLock
	jsl.l SoundVoicesOff
	ldx.b $36
	stx.b $50
	ldx.w #$021A
CODE_80A395:
	stz.w $07EF,x
	dex
	bpl CODE_80A395
	ldx.w #$5000
	stx.w SoundVolume
	sep #$10
	ldy.b #$00
	ldx.b #$11
	jsr.w CODE_80A3D8
	ldy.b #$F6
CODE_80A3AC:
	dex
	bne CODE_80A3AC
	dey
	bne CODE_80A3AC
	jsr.w CODE_80A3F5
	lda.b #$12
	sta.w $07F6
	stz.w SoundLock
	stz.b $66
	plp
	rtl
SoundVoicesOff:		; release every voice
	php
	sep #$30
	dec.w SoundLock
	ldy.b #$07
	ldx.b #$0E
CODE_80A3CB:
	jsr.w CODE_80ABC7
	dex
	dex
	dey
	bpl CODE_80A3CB
	inc.w SoundLock
	plp
	rtl
CODE_80A3D8:
	php
	sep #$30
	stx.b $52
	tya
	tax
	asl a
	tay
	rep #$20
	lda.w #$0000
CODE_80A3E6:
	sta.w $086A,y
	sta.w $0848,y
	iny
	iny
	inx
	cpx.b $52
	bne CODE_80A3E6
	plp
	rts
CODE_80A3F5:
	jsl.l SPCCmd0D
	sep #$30
	lda.b #$00
	sta.w $07E9
	sta.w $07E8
	sta.w $07E7
	sta.w $07EA
	sta.w $07EB
	sta.w $07EC
CODE_80A40F:
	lda.w APUIO0
	bne CODE_80A40F
	lda.w $07F8
	sta.w APUIO1
	sta.w APUIO2
	lda.l $0007E9
	sta.w APUIO3
	lda.b #$08
	sta.w APUIO0
CODE_80A429:
	cmp.w APUIO0
	bne CODE_80A429
	lda.l $0007E8
	sta.w APUIO1
	lda.l $0007E7
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
CODE_80A441:
	cpx.w APUIO0
	bne CODE_80A441
	stz.w APUIO0
	rts
CODE_80A44A:
	lda.w APUIO0
	bne CODE_80A44A
	lda.b $5B
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0C
	sta.w APUIO0
CODE_80A45C:
	cmp.w APUIO0
	bne CODE_80A45C
	stz.w APUIO0
	rts
CODE_80A465:
	lda.w APUIO0
	bne CODE_80A465
	lda.b $4B
	sta.w APUIO1
	lda.w $07FC
	sta.w APUIO2
	lda.w $07FE
	sta.w APUIO3
	lda.b #$07
	sta.w APUIO0
CODE_80A480:
	cmp.w APUIO0
	bne CODE_80A480
	ldy.b #$14
	lda.b ($4E),y
	sta.w APUIO1
	iny
	lda.b ($4E),y
	sta.w APUIO2
	pha
	iny
	lda.b ($4E),y
	sta.w APUIO3
	ldx.b #$81
	stx.w APUIO0
CODE_80A49E:
	cpx.w APUIO0
	bne CODE_80A49E
	stz.w APUIO0
CODE_80A4A6:
	lda.w APUIO0
	bne CODE_80A4A6
	lda.b $4B
	sta.w APUIO1
	rep #$20
	lda.b $5A
	sta.w APUIO2
	sep #$20
	lda.b #$06
	sta.w APUIO0
CODE_80A4BE:
	cmp.w APUIO0
	bne CODE_80A4BE
	stz.w APUIO0
	pla
	bmi CODE_80A4E0
CODE_80A4C9:
	lda.w APUIO0
	bne CODE_80A4C9
	lda.b $5D
	sta.w APUIO2
	lda.b #$0C
	sta.w APUIO0
CODE_80A4D8:
	cmp.w APUIO0
	bne CODE_80A4D8
	stz.w APUIO0
CODE_80A4E0:
	ldy.b $4B
	rts
CODE_80A4E3:
	lda.w APUIO0
	bne CODE_80A4E3
	lda.b $5B
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0C
	sta.w APUIO0
CODE_80A4F5:
	cmp.w APUIO0
	bne CODE_80A4F5
	stz.w APUIO0
CODE_80A4FD:
	lda.w APUIO0
	bne CODE_80A4FD
	rep #$20
	lda.b $60
	sta.w APUIO2
	sep #$20
	sty.w APUIO1
	lda.b #$0B
	sta.w APUIO0
CODE_80A513:
	cmp.w APUIO0
	bne CODE_80A513
	stz.w APUIO0
	rts
CODE_80A51C:
	rep #$20
	lda.w $091A,x
	bmi CODE_80A546
	bne CODE_80A543
	sep #$20
	lda.w $08F2,y
	cmp.b #$04
	beq CODE_80A542
	lda.w $08FA,y
	phx
	tax
	lda.w $08D0,x
	plx
	cmp.b #$00
	bne CODE_80A542
	rep #$20
	jsr.w CODE_80ABF7
	sep #$20
CODE_80A542:
	rts
CODE_80A543:
	dec.w $091A,x
CODE_80A546:
	sep #$20
	rts
CODE_80A549:
	ldx.b #$00
	txy
CODE_80A54C:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	beq CODE_80A560
	lda.w $08FA,y
	cmp.b #$10
	bcs CODE_80A560
	jsr.w CODE_80A51C
CODE_80A560:
	inx
	inx
	iny
	cpy.b #$08
	bcc CODE_80A54C
	rts
CODE_80A568:
	lda.b [$56]
	inc.b $56
	tax
	and.w #$007F
	txy
	bpl CODE_80A58D
CODE_80A573:
	sta.b $52
	lda.b [$56]
	inc.b $56
	tax
	and.w #$007F
	sta.b $54
	lda.b $52
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.b $54
	txy
	bmi CODE_80A573
CODE_80A58D:
	rts
CODE_80A58E:
	lda.b $4C
	sta.b $56
	jsr.w CODE_80A568
	lda.b [$56]
	inc.b $56
	tay
	sty.b $60
	cpy.b #$D9
	bcc CODE_80A603
	cpy.b #$E7
	bne CODE_80A5B1
	lda.b [$56]
	and.w #$00FF
	sec
	adc.b $56
	sta.b $56
	jmp.w CODE_80A60F
CODE_80A5B1:
	cpy.b #$D9
	beq CODE_80A60F
	cpy.b #$DA
	beq CODE_80A60F
	cpy.b #$DB
	beq CODE_80A60F
	cpy.b #$E3
	beq CODE_80A60F
	cpy.b #$DC
	beq CODE_80A5D5
	cpy.b #$EA
	beq CODE_80A5D5
	cpy.b #$DD
	beq CODE_80A5D5
	cpy.b #$DE
	beq CODE_80A5D5
	cpy.b #$E2
	bne CODE_80A5DF
CODE_80A5D5:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jmp.w CODE_80A60F
CODE_80A5DF:
	cpy.b #$DF
	bne CODE_80A5F4
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5E
	jmp.w CODE_80A60F
CODE_80A5F4:
	cpy.b #$E5
	bne CODE_80A60F
	lda.b [$56]
	inc.b $56
	inc.b $56
	sta.b $5E
	jmp.w CODE_80A60F
CODE_80A603:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jsr.w CODE_80A568
	sta.b $5E
CODE_80A60F:
	rts
CODE_80A610:
	lda.b $66
	inc a
	and.b #$07
	sta.b $66
	ldy.b #$07
	tax
CODE_80A61A:
	lda.w $08F2,x
	beq CODE_80A68E
CODE_80A61F:
	inx
	txa
	and.b #$07
	tax
	dey
	bpl CODE_80A61A
	lda.b #$FF
	sta.b $4B
	stz.w $07FB
	stz.w $07FC
	stz.w $07FD
	ldy.b #$2A
	lda.b ($4E),y
	sta.w $07FE
	lda.b #$08
	sta.b $68
	ldx.b $66
	ldy.b #$0E
CODE_80A643:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq CODE_80A67B
	lda.w $07FE
	cmp.w $0912,x
	bcc CODE_80A67B
	lda.w $08F2,x
	cmp.w $07FD
	bcc CODE_80A67B
	bne CODE_80A66E
	rep #$20
	lda.w $096A,y
	cmp.w $07FB
	bcc CODE_80A67B
	stx.b $4B
	sta.w $07FB
	bra CODE_80A67B
CODE_80A66E:
	stx.b $4B
	sta.w $07FD
	rep #$20
	lda.w $096A,y
	sta.w $07FB
CODE_80A67B:
	sep #$20
	inx
	txa
	and.b #$07
	tax
	dey
	dey
	dec.b $68
	bne CODE_80A643
	ldx.b $4B
	txy
	jmp.w CODE_80A44A
CODE_80A68E:
	lda.b ($4E)
	and.l ByteBitMasks,x
	beq CODE_80A61F
	rts
CODE_80A697:
	php
	rep #$20
	lda.w $086A,x
	beq CODE_80A6BB
	sta.b $4E
	cmp.w #$DF80
	beq CODE_80A6AB
	cmp.w #$DFB0
	bne CODE_80A6B1
CODE_80A6AB:
	lda.b $5E
	bmi CODE_80A6BB
	beq CODE_80A6BB
CODE_80A6B1:
	sep #$30
	jsr.w CODE_80A610
	stx.b $4B
	txa
	bpl CODE_80A6BD
CODE_80A6BB:
	plp
	rts
CODE_80A6BD:
	asl a
	sta.w $0800
	lda.b $4A
	sta.w $08FA,x
	ldy.b #$2A
	lda.b ($4E),y
	sta.w $0912,x
	ldy.b #$15
	lda.b ($4E),y
	bpl CODE_80A6D7
	lda.b #$02
	bra CODE_80A6D9
CODE_80A6D7:
	lda.b #$01
CODE_80A6D9:
	sta.w $08F2,x
	ldx.w $0800
	rep #$20
	lda.b $4E
	cmp.w #$E130
	bne CODE_80A6ED
	lda.w #$002D
	bra CODE_80A6EF
CODE_80A6ED:
	lda.b $5E
CODE_80A6EF:
	dec a
	sta.w $091A,x
	stz.w $096A,x
	stz.w $097A,x
	stz.w $098A,x
	ldy.b #$1C
	lda.b ($4E),y
	sta.w $099A,x
	stz.w $09AA,x
	ldy.b #$20
	lda.b ($4E),y
	sta.w $09BA,x
	stz.w $09CA,x
	ldy.b #$1E
	lda.b ($4E),y
	sta.w $09DA,x
	stz.w $09EA,x
	ldy.b #$2D
	lda.b ($4E),y
	bmi CODE_80A725
	lda.w #$FFFF
	bra CODE_80A728
CODE_80A725:
	lda.w #$0000
CODE_80A728:
	sta.w $09FA,x
	ldy.b #$0A
	lda.b ($4E),y
	sta.w $093A,x
	sta.b $5C
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne CODE_80A74B
	lda.w $15D8
	bit.w #$0800
	bne CODE_80A74B
	lda.b $5C
	sta.w $0CB1
CODE_80A74B:
	lda.b $4E
	sta.w $092A,x
	sep #$20
	ldx.b $5A
	lda.l VolumeCurve,x
	and.b #$FF
	cmp.b #$40
	bne CODE_80A770
	ldx.b $4A
	lda.w $08AE,x
	sta.w $07FC
	iny
	lda.w $08BF,x
	sta.w $07FE
	jmp.w CODE_80A790
CODE_80A770:
	asl a
	sta.b $5A
	ldx.b $4B
	sta.w $0902,x
	ldx.b $4A
	xba
	lda.w $08AE,x
	jsr.w MulFrac8
	sta.w $07FC
	lda.b $5A
	xba
	lda.w $08BF,x
	jsr.w MulFrac8
	sta.w $07FE
CODE_80A790:
	lda.w $0802
	beq CODE_80A7AC
	lda.b $4A
	cmp.b #$10
	beq CODE_80A7AC
	lsr.w $07FE
	lsr.w $07FC
	lda.w $0802
	bpl CODE_80A7AC
	lsr.w $07FE
	lsr.w $07FC
CODE_80A7AC:
	ldy.b #$04
	lda.b $60
	clc
	adc.b ($4E),y
	sta.b $60
	ldx.b $4B
	sta.w $090A,x
	ldx.b $4A
	cpx.b #$09
	bne CODE_80A7C5
	lda.b #$3F
	clc
	adc.b ($4E),y
CODE_80A7C5:
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	ldx.w $0800
	sta.w $095A,x
	sta.b $5A
	sep #$20
	ldy.b $4A
	lda.w $089D,y
	beq CODE_80A840
	lda.w $088C,y
	beq CODE_80A840
	bmi CODE_80A80C
	lda.b $60
	clc
	adc.w $089D,y
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.w $088C,y
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.b $5A
	sta.b $5A
	bra CODE_80A840
CODE_80A80C:
	lda.b $60
	sec
	sbc.w $089D,y
	asl a
	tax
	rep #$20
	lda.b $5A
	sec
	sbc.l PitchTable,x
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.w $088C,y
	bpl CODE_80A831
	rep #$20
	lda.b $5E
	sta.b $43
	bra CODE_80A839
CODE_80A831:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
CODE_80A839:
	lda.b $5A
	sec
	sbc.b $43
	sta.b $5A
CODE_80A840:
	rep #$20
	ldy.b #$02
	lda.b ($4E),y
	ldx.w $0800
	clc
	adc.b $5A
	sta.w $094A,x
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne CODE_80A867
	lda.w $15D8
	bit.w #$0800
	bne CODE_80A867
	lda.w $094A,x
	sta.w $0CAF
CODE_80A867:
	sep #$20
	jsr.w CODE_80A465
	tya
	plp
	rts
CODE_80A86F:
	txa
	sta.b $4A
	asl a
	tax
	stx.w $07FF
CODE_80A877:
	rep #$20
	lda.w $0848,x
	beq CODE_80A881
	jmp.w CODE_80ABBF
CODE_80A881:
	lda.w $0804,x
	sta.b $4C
CODE_80A886:
	jsr.w CODE_80A58E
	lda.b $56
	sta.b $4C
	ldx.w $07FF
	ldy.b $60
	cpy.b #$D9
	bcs CODE_80A899
	jmp.w CODE_80AB63
CODE_80A899:
	cpy.b #$D9
	beq CODE_80A8A1
	cpy.b #$DA
	bne CODE_80A8A8
CODE_80A8A1:
	jsl.l MusicStop
	jmp.w CODE_80ABC2
CODE_80A8A8:
	cpy.b #$E2
	bne CODE_80A8B5
	lda.w $0804,x
	sta.w $0826,x
	jmp.w CODE_80ABA5
CODE_80A8B5:
	cpy.b #$DB
	bne CODE_80A8C1
	lda.w $0826,x
	sta.w $0804,x
	bra CODE_80A877
CODE_80A8C1:
	cpy.b #$DD
	bne CODE_80A8CD
CODE_80A8C5:
	ldy.b $5A
	sty.w $07F6
	jmp.w CODE_80ABA5
CODE_80A8CD:
	cpy.b #$DE
	beq CODE_80A8D4
	jmp.w CODE_80A965
CODE_80A8D4:
	lda.w $086A,x
	sta.b $4E
	sep #$20
	lda.w $07E3
	bne CODE_80A8EC
	ldy.b #$12
	lda.b ($4E),y
	sta.w $07FB
	iny
	lda.b ($4E),y
	bra CODE_80A8F3
CODE_80A8EC:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $07FB
CODE_80A8F3:
	sta.w $07FD
	ldx.b $4A
	lda.w $07FB
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08AE,x
	lda.w $07FD
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08BF,x
	ldy.b #$07
CODE_80A912:
	lda.w $08FA,y
	cmp.b $4A
	bne CODE_80A956
	ldx.b $4A
	lda.w $08AE,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FC
	lda.w $08BF,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FE
CODE_80A935:
	lda.w APUIO0
	bne CODE_80A935
	lda.w $07FE
	sta.w APUIO3
	lda.w $07FC
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0E
	sta.w APUIO0
CODE_80A94E:
	cmp.w APUIO0
	bne CODE_80A94E
	stz.w APUIO0
CODE_80A956:
	dey
	bpl CODE_80A912
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A95E:
	lda.b $5E
	sta.b $5A
	jmp.w CODE_80A8D4
CODE_80A965:
	cpy.b #$DF
	beq CODE_80A96C
	jmp.w CODE_80AA48
CODE_80A96C:
	ldy.b $5A
	cpy.b #$07
	beq CODE_80A95E
CODE_80A972:
	cpy.b #$40
	bne CODE_80A9A4
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08D0,x
	bne CODE_80A99F
	ldx.b #$07
CODE_80A983:
	lda.w $08FA,x
	cmp.b $4A
	bne CODE_80A99C
	lda.w $08F2,x
	beq CODE_80A99C
	phx
	txy
	txa
	asl a
	tax
	rep #$20
	jsr.w CODE_80ABF7
	sep #$20
	plx
CODE_80A99C:
	dex
	bpl CODE_80A983
CODE_80A99F:
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A9A4:
	cpy.b #$0B
	bne CODE_80A9B6
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08AE,x
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A9B6:
	cpy.b #$0C
	bne CODE_80A9C8
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08BF,x
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A9C8:
	cpy.b #$32
	bne CODE_80A9DB
	sep #$20
	lda.b $5E
	sta.w $07E7
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A9DB:
	cpy.b #$33
	bne CODE_80A9EE
	sep #$20
	lda.b $5E
	sta.w $07EA
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
CODE_80A9EE:
	cpy.b #$34
	bne CODE_80AA01
	sep #$20
	lda.b $5E
	sta.w $07EB
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AA01:
	cpy.b #$35
	bne CODE_80AA14
	sep #$20
	lda.b $5E
	sta.w $07EC
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AA14:
	cpy.b #$37
	bne CODE_80AA27
	sep #$20
	lda.b $5E
	sta.w $07F8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AA27:
	cpy.b #$38
	bne CODE_80AA2E
	jmp.w CODE_80ABA5
CODE_80AA2E:
	cpy.b #$39
	bne CODE_80AA41
	sep #$20
	lda.b $5E
	sta.w $07E8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AA41:
	cpy.b #$3A
	bne CODE_80AA45
CODE_80AA45:
	jmp.w CODE_80ABA5
CODE_80AA48:
	cpy.b #$E5
	beq CODE_80AA4F
	jmp.w CODE_80AB0B
CODE_80AA4F:
	lda.b $5E
	sep #$20
	asl a
	rep #$20
	sec
	sbc.w #$4000
	asl a
	sep #$20
	xba
	ldx.b $4A
	sta.w $088C,x
	sta.b $5C
	lda.w $089D,x
	bne CODE_80AA6D
CODE_80AA6A:
	jmp.w CODE_80AB06
CODE_80AA6D:
	sta.b $60
	ldy.b #$07
CODE_80AA71:
	lda.w $08FA,y
	cmp.b $4A
	beq CODE_80AA7B
	jmp.w CODE_80AAFE
CODE_80AA7B:
	phy
	tya
	asl a
	tax
	phx
	lda.b $5C
	beq CODE_80AAAF
	bmi CODE_80AAB9
	lda.w $090A,y
	clc
	adc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	plx
	sec
	sbc.w $095A,x
	sta.b $5E
	sep #$20
	lda.b $5C
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.w $095A,x
	sta.b $5A
	bra CODE_80AAF3
CODE_80AAAF:
	rep #$20
	plx
	lda.w $095A,x
	sta.b $5A
	bra CODE_80AAF3
CODE_80AAB9:
	lda.w $090A,y
	sec
	sbc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sta.b $5A
	plx
	lda.w $095A,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.b $5C
	bpl CODE_80AAE3
	rep #$20
	lda.b $5E
	sta.b $43
	bra CODE_80AAEB
CODE_80AAE3:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
CODE_80AAEB:
	lda.w $095A,x
	sec
	sbc.b $43
	sta.b $5A
CODE_80AAF3:
	ldy.b #$02
	lda.b ($4E),y
	clc
	adc.b $5A
	sta.w $094A,x
	ply
CODE_80AAFE:
	sep #$20
	dey
	bmi CODE_80AB06
	jmp.w CODE_80AA71
CODE_80AB06:
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AB0B:
	cpy.b #$DC
	bne CODE_80AB51
	lda.b $5A
	and.w #$00FF
	cmp.w #$006A
	bne CODE_80AB1C
CODE_80AB19:
	lda.w #$0014
CODE_80AB1C:
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.w $086A,x
	sta.b $4E
	sep #$20
	ldx.b $4A
	ldy.b #$2F
	lda.b ($4E),y
	sta.w $089D,x
	stz.w $088C,x
	lda.w $07E3
	bne CODE_80AB47
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08AE,x
	iny
	lda.b ($4E),y
	bra CODE_80AB4E
CODE_80AB47:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08AE,x
CODE_80AB4E:
	sta.w $08BF,x
CODE_80AB51:
	rep #$20
	cpy.b #$EA
	bne CODE_80AB5E
CODE_80AB57:
	lda.b $5A
	and.w #$00FF
	sta.b $62
CODE_80AB5E:
	rep #$20
	jmp.w CODE_80ABA5
CODE_80AB63:
	sep #$20
	lda.b $4A
	cmp.b #$09
	bne CODE_80AB9C
	asl a
	tax
	tya
	sec
	sbc.b #$2F
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $4E
	sta.w $086A,x
	sep #$20
	ldx.b $4A
	ldy.b #$12
	lda.b [$4E],y
	sta.w $08AE,x
	iny
	lda.b [$4E],y
	sta.w $08BF,x
	ldy.b #$2F
	lda.b [$4E],y
	sta.w $089D,x
	stz.w $088C,x
CODE_80AB9C:
	lda.b $4A
	asl a
	tax
	rep #$20
	jsr.w CODE_80A697
CODE_80ABA5:
	jsr.w CODE_80A568
	ldx.w $07FF
	cmp.w #$0000
	bne CODE_80ABB7
	jmp.w CODE_80A886
CODE_80ABB3:
	rep #$20
	bra CODE_80ABA5
CODE_80ABB7:
	sta.w $0848,x
	lda.b $4C
	sta.w $0804,x
CODE_80ABBF:
	dec.w $0848,x
CODE_80ABC2:
	sep #$30
	ldx.b $4A
	rts
CODE_80ABC7:
	rep #$20
	lda.w $092A,x
	cmp.w #$E1C0
	bcc CODE_80ABE4
	cmp.w #$E2B1
	bcs CODE_80ABE4
	lda.w #$0000
	sta.l $7E35E8
	lda.w #$0000
	sta.l $7E35E6
CODE_80ABE4:
	sep #$30
	lda.b #$00
	sta.w $08F2,y
	lda.b #$FF
	sta.w $08FA,y
	lda.b #$9F
	sta.b $5B
	jmp.w CODE_80A44A
CODE_80ABF7:
	sep #$20
	lda.w $08F2,y
	beq CODE_80AC45
	cmp.b #$01
	beq CODE_80AC46
	lda.b #$04
	sta.w $08F2,y
	phy
	rep #$20
	lda.w $092A,x
	sta.b $4E
	ldy.b #$15
	lda.b ($4E),y
	lsr a
	and.w #$7000
	clc
	adc.w #$0FFF
	sta.w $093A,x
	ldy.b #$10
	lda.b ($4E),y
	xba
	ply
	sep #$20
	cmp.b #$6D
	bcc CODE_80AC2E
	lda.b #$9F
	bra CODE_80AC40
CODE_80AC2E:
	cmp.b #$36
	bcc CODE_80AC36
	lda.b #$99
	bra CODE_80AC40
CODE_80AC36:
	cmp.b #$03
	bcc CODE_80AC3E
	lda.b #$8C
	bra CODE_80AC40
CODE_80AC3E:
	lda.b #$81
CODE_80AC40:
	sta.b $5B
	jsr.w CODE_80A44A
CODE_80AC45:
	rts
CODE_80AC46:
	jsr.w CODE_80ABC7
	rts
CODE_80AC4A:
	lda.w $07F5
	clc
	adc.b #$40
CODE_80AC50:
	sta.w $07F5
	cmp.w $07F6
	bcc CODE_80AC7A
	jsr.w CODE_80A549
	lda.w $07F1
	bne CODE_80AC71
	ldx.w $0801
	beq CODE_80AC7A
	dex
CODE_80AC66:
	jsr.w CODE_80A86F
	lda.w MusicOn
	beq CODE_80AC7A
	dex
	bpl CODE_80AC66
CODE_80AC71:
	lda.w $07F5
	sec
	sbc.w $07F6
	bra CODE_80AC50
CODE_80AC7A:
	rts
CODE_80AC7B:
	ldx.b #$00
	txy
CODE_80AC7E:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	bne CODE_80AC8B
	jmp.w CODE_80AD61
CODE_80AC8B:
	pha
	lda.w $08FA,y
	cmp.b #$10
	bcc CODE_80AC96
	jsr.w CODE_80A51C
CODE_80AC96:
	rep #$20
	lda.w $092A,x
	sta.b $4E
	lda.w $094A,x
	sta.b $60
	lda.w $093A,x
	sta.b $5A
	lda.w $096A,x
	inc a
	sta.w $096A,x
	ldy.b #$1A
	cmp.b ($4E),y
	bcs CODE_80ACBF
	ldy.b #$18
	cmp.b ($4E),y
	bcc CODE_80ACBF
	dec.w $097A,x
	bmi CODE_80ACC2
CODE_80ACBF:
	jmp.w CODE_80AD55
CODE_80ACC2:
	ldy.b #$2A
	lda.b ($4E),y
	clc
	adc.w $09AA,x
	sta.w $09AA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $099A,x
	sta.w $099A,x
	sta.w $097A,x
	ldy.b #$26
	lda.b ($4E),y
	clc
	adc.w $09CA,x
	sta.w $09CA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09BA,x
	sta.w $09BA,x
	ldy.b #$22
	lda.b ($4E),y
	clc
	adc.w $09EA,x
	sta.w $09EA,x
	iny
	iny
	lda.b ($4E),y
	adc.w $09DA,x
	sta.w $09DA,x
	bit.w $09FA,x
	bmi CODE_80AD2A
	clc
	adc.w $098A,x
	sta.w $098A,x
	bmi CODE_80AD4D
	cmp.w $09BA,x
	bcc CODE_80AD4D
	ldy.b #$2D
	lda.b ($4E),y
	and.w #$4000
	bne CODE_80AD25
CODE_80AD20:
	stz.w $098A,x
	bra CODE_80AD4D
CODE_80AD25:
	dec.w $09FA,x
	bra CODE_80AD4D
CODE_80AD2A:
	lda.w $098A,x
	sec
	sbc.w $09DA,x
	sta.w $098A,x
	bpl CODE_80AD4D
	eor.w #$FFFF
	inc a
	cmp.w $09BA,x
	bcc CODE_80AD4D
	ldy.b #$2D
	lda.b ($4E),y
	bmi CODE_80AD4A
	stz.w $098A,x
	bra CODE_80AD4D
CODE_80AD4A:
	inc.w $09FA,x
CODE_80AD4D:
	lda.w $098A,x
	clc
	adc.b $60
	sta.b $60
CODE_80AD55:
	ply
	cpy.b #$02
	bne CODE_80AD64
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
CODE_80AD61:
	jmp.w CODE_80AD90
CODE_80AD64:
	cpy.b #$04
	bne CODE_80AD89
	rep #$20
	ldy.b #$10
	lda.w $093A,x
	sec
	sbc.b ($4E),y
	sta.w $093A,x
	bcs CODE_80AD80
	sep #$20
	ldy.b $4B
	jsr.w CODE_80ABC7
	bra CODE_80AD90
CODE_80AD80:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
	bra CODE_80AD90
CODE_80AD89:
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4E3
CODE_80AD90:
	sep #$20
	inx
	inx
	iny
	cpy.b #$08
	bcs CODE_80AD9C
	jmp.w CODE_80AC7E
CODE_80AD9C:
	rts
SoundUpdate:		; per frame: fade, envelopes, and the song ticks that are due; nothing while SoundLock is set
	sep #$30
	lda.b $50
	pha
	plb
	lda.w SoundLock
	bne CODE_80ADE8
	rep #$20
	lda.w SoundFadeSpeed
	beq CODE_80ADC6
	lda.w SoundVolume
	sec
	sbc.w SoundFadeSpeed
	sta.w SoundVolume
	bcs CODE_80ADC1
	jsl.l SoundInit
	bra CODE_80ADC6
CODE_80ADC1:
	sep #$20
	jsr.w CODE_80A40F
CODE_80ADC6:
	sep #$20
	lda.w $07F1
	beq CODE_80ADD4
CODE_80ADCD:
	lda.w $07F8
	pha
	stz.w $07F8
CODE_80ADD4:
	lda.w $07F1
	beq CODE_80ADDD
CODE_80ADD9:
	pla
	sta.w $07F8
CODE_80ADDD:
	jsr.w CODE_80AC7B
	lda.w MusicOn
	beq CODE_80ADE8
	jsr.w CODE_80AC4A
CODE_80ADE8:
	rts
CODE_80ADE9:
	php
	sep #$30
CODE_80ADEC:
	lda.w APUIO0
	bne CODE_80ADEC
	ldy.b #$00
	lda.w $07F8
	sta.w APUIO1
	iny
	lda.w $07F8
	sta.w APUIO2
	iny
	lda.l $0007E9
	sta.w APUIO3
	iny
	lda.b #$08
	sta.w APUIO0
CODE_80AE0E:
	cmp.w APUIO0
	bne CODE_80AE0E
	lda.l $0007E8
	sta.w APUIO1
	iny
	lda.l $0007E7
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
CODE_80AE27:
	cpx.w APUIO0
	bne CODE_80AE27
	stz.w APUIO0
	lda.w $07E7
	beq CODE_80AE77
CODE_80AE34:
	lda.w APUIO0
	bne CODE_80AE34
	ldy.b #$00
	lda.l $0007EB
	sta.w APUIO1
	iny
	lda.l $0007EB
	sta.w APUIO2
	iny
	lda.l $0007EC
	sta.w APUIO3
	iny
	lda.b #$09
	sta.w APUIO0
CODE_80AE58:
	cmp.w APUIO0
	bne CODE_80AE58
	lda.b #$E0
	sta.w APUIO1
	iny
	lda.l $0007EA
	sta.w APUIO2
	ldx.b #$83
	stx.w APUIO0
CODE_80AE6F:
	cpx.w APUIO0
	bne CODE_80AE6F
	stz.w APUIO0
CODE_80AE77:
	rep #$30
	plp
	rts
SPCIPLUpload:		; send the stream at [$0C] through the boot loader: blocks of length, sound RAM address and data;
		;   length 0 ends it with the start address
	rep #$30
	ldy.w #$0000
	lda.w #$BBAA
CODE_80AE83:
	cmp.w APUIO0
	bne CODE_80AE83
	sep #$20
	lda.b #$CC
	bra CODE_80AEB4
CODE_80AE8E:
	lda.b [$0C],y
	iny
	xba
	lda.b #$00
	bra CODE_80AEA1
CODE_80AE96:
	xba
	lda.b [$0C],y
	iny
	xba
CODE_80AE9B:
	cmp.w APUIO0
	bne CODE_80AE9B
	inc a
CODE_80AEA1:
	rep #$20
	sta.w APUIO0
	sep #$20
	dex
	bne CODE_80AE96
CODE_80AEAB:
	cmp.w APUIO0
	bne CODE_80AEAB
CODE_80AEB0:
	adc.b #$03
	beq CODE_80AEB0
CODE_80AEB4:
	pha
	rep #$20
	lda.b [$0C],y
	iny
	iny
	tax
	lda.b [$0C],y
	iny
	iny
	sta.w APUIO2
	sep #$20
	cpx.w #$0001
	lda.b #$00
	rol a
	sta.w APUIO1
	adc.b #$7F
	pla
	sta.w APUIO0
CODE_80AED4:
	cmp.w APUIO0
	bne CODE_80AED4
	bvs CODE_80AE8E
	stz.w APUIO0
	rep #$30
	rtl
CODE_80AEE1:
	sta.w $07B4
	phb
	pea.w $7E7E
	plb
	plb
	stx.w $07B6
	tya
	cmp.w #$01C0
	bcs CODE_80AEF6
	lda.w #$01A0
CODE_80AEF6:
	clc
	adc.w #$001F
	and.w #$FFE0
	sta.w $07B8
	stz.w $07BA
	lsr a
	lsr a
	sep #$30
	tax
	lda.b #$00
CODE_80AF0A:
	sta.w $2F40,x
	txa
	sec
	sbc.b #$08
	sta.w $2FB9,x
	tax
	lda.b #$08
	cpx.b #$00
	bpl CODE_80AF0A
	lda.b #$FF
	sta.w $2FB9
	rep #$30
	lda.w #$0002
	sta.w $07C2
	lda.w #$0200
	sec
	sbc.w $07B8
	sep #$30
	tax
	sta.w $3032
	stz.w $3032,x
	stz.w $3093,x
	lda.b #$FF
	sta.w $3093
	rep #$30
	lda.w #$0080
	sta.w $07AE
	lda.w #$2100
	sta.w $07BC
	lda.w #$2300
	sta.w $07BE
	lda.w #$2520
	sta.w $07A8
	lda.w #$2320
	sta.w $07AC
	lda.w #$2100
	sta.w $07AA
	jsr.w CODE_80AF6D
	plb
	jmp.w CODE_80AFDE
CODE_80AF6D:
	ldx.w #$03D0
	lda.w #$FFFF
CODE_80AF73:
	sta.w $2740,x
	dex
	dex
	bpl CODE_80AF73
	rts
CODE_80AF7B:
	phb
	lda.w #$7E7E
	pha
	plb
	plb
	lda.w #$0080
	sec
	sbc.w $07B6
	sta.w $07AE
	lda.w $07B6
	lsr a
	lsr a
	tax
	clc
	adc.w $07AA
	adc.w #$0200
	sta.w $07B0
	txa
	and.w #$0003
	eor.w #$0003
	sta.w $07B2
	lda.w $07B6
	asl a
	asl a
	adc.w $07AA
	sta.w $07BC
	lda.w $07BA
	beq CODE_80AFDC
	dec a
	asl a
	tax
CODE_80AFB9:
	lda.w $2D40,x
	bmi CODE_80AFD8
	lsr a
	sta.w $2D40,x
	bcc CODE_80AFD8
	ldy.w $2B40,x
	sep #$20
	lda.b #$80
	pha
	rep #$20
	lda.w #CODE_80AFD8-1
	pha
	phx
	phy
	phb
	jmp.w $B772
CODE_80AFD8:
	dex
	dex
	bpl CODE_80AFB9
CODE_80AFDC:
	plb
	rtl
CODE_80AFDE:
	phb
	pea.w $7E7E
	plb
	plb
	lda.w $07AE
	ldx.w $07BC
	lda.w #$E100
CODE_80AFED:
	cpx.w $07BE
	bcs CODE_80AFFB
	sta.w $0000,x
	inx
	inx
	inx
	inx
	bne CODE_80AFED
CODE_80AFFB:
	ldy.w $07A8
	lda.w $07BC
