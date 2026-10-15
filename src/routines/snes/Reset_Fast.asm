; Reset in FastROM: clear the PPU and CPU registers, then start the game
Reset_Fast:
	phk
	plb
	sep #$20
	lda.b #$01
	sta.w MEMSEL
	stz.w NMITIMEN
	lda.b #$8F
	sta.w INIDISP
	stz.w OBSEL
	stz.w OAMADDL
	stz.w OAMADDH
	stz.w OAMDATA
	stz.w OAMDATA
	ldx.w #BGMODE
.loop:
	stz.b $00,x
	inx
	cpx.w #BG1HOFS
	bne .loop
.loop2:
	stz.b $00,x
	stz.b $00,x
	inx
	cpx.w #VMAIN
	bne .loop2
	lda.b #$80
	sta.w VMAIN
	inx
.loop3:
	stz.b $00,x
	inx
	cpx.w #M7A
	bne .loop3
	ldy.w #$0000
.loop4:
	stz.b $00,x
	lda.w Mode7Identity,y
	sta.b $00,x
	iny
	inx
	cpx.w #CGADD
	bne .loop4
.loop5:
	stz.b $00,x
	inx
	cpx.w #CGWSEL
	bne .loop5
	lda.b #$30
	sta.w CGWSEL
	stz.w CGADSUB
	lda.b #$E0
	sta.w COLDATA
	stz.w SETINI
	rep #$20
	lda.w #$008F
	sta.w IniDispShadow
	lda.w #$0000
	tax
	tay
	jsl.l FillVRAM
	sep #$20
	stz.w NMITIMEN
	lda.b #$FF
	sta.w WRIO
	ldx.w #WRMPYA
.loop6:
	stz.b $00,x
	inx
	cpx.w #HDMAEN
	bne .loop6
	rep #$20
	lda.w #SoundDriver
	sta.b $0C
	stz.b $0E
	jsl.l SPCIPLUpload
	sep #$20
	rep #$20
	lda.w #$0000
	tax
.loop7:
	sta.l $7E0000,x
	sta.l $7F0000,x
	dex
	dex
	bne .loop7
	sep #$20
	ldx.w #$0005
.loop8:
	lda.w InitTag,x
	sta.w RAMTag,x
	sta.w RAMTag2,x
	sta.l ReplayBufferEnd,x
	dex
	bpl .loop8
	ldx.w #$0010
	beq .1
.loop9:
	lda.l $80FEFF,x
	sta.l $7EE67B,x
	dex
	bne .loop9
.1:
	jsl.l ResetStub
	sep #$20
	rep #$10
	lda.b #$8F
	sta.w IniDispShadow
	ldx.w #$000C
.loop10:
	lda.w InitHooks,x
	sta.w FrameHook,x
	dex
	bpl .loop10
	ldx.w #$0024
.loop11:
	stz.w FrameCount,x
	dex
	bpl .loop11
	rep #$20
	lda.w #$0000
	tax
	tay
	jsl.l InitSprites
	sep #$20
	lda.b #$81
	sta.w NMITIMEN
	rep #$30
	jsl.l SoundInit
	stz.w brightness
	jsl.l forceblack
	jml.l Opening
