; Unidentified routine.
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
CODE_80804D:
	stz.b $00,x
	inx
	cpx.w #BG1HOFS
	bne CODE_80804D
CODE_808055:
	stz.b $00,x
	stz.b $00,x
	inx
	cpx.w #VMAIN
	bne CODE_808055
	lda.b #$80
	sta.w VMAIN
	inx
CODE_808065:
	stz.b $00,x
	inx
	cpx.w #M7A
	bne CODE_808065
	ldy.w #$0000
CODE_808070:
	stz.b $00,x
	lda.w Mode7Identity,y
	sta.b $00,x
	iny
	inx
	cpx.w #CGADD
	bne CODE_808070
CODE_80807E:
	stz.b $00,x
	inx
	cpx.w #CGWSEL
	bne CODE_80807E
	lda.b #$30
	sta.w CGWSEL
	stz.w CGADSUB
	lda.b #$E0
	sta.w COLDATA
	stz.w SETINI
	rep #$20
	lda.w #$008F
	sta.w $0762
	lda.w #$0000
	tax
	tay
	jsl.l CODE_8087EA
	sep #$20
	stz.w NMITIMEN
	lda.b #$FF
	sta.w WRIO
	ldx.w #WRMPYA
CODE_8080B4:
	stz.b $00,x
	inx
	cpx.w #HDMAEN
	bne CODE_8080B4
	rep #$20
	lda.w #SoundDriver
	sta.b $0C
	stz.b $0E
	jsl.l SPCIPLUpload
	sep #$20
	rep #$20
	lda.w #$0000
	tax
CODE_8080D1:
	sta.l $7E0000,x
	sta.l $7F0000,x
	dex
	dex
	bne CODE_8080D1
	sep #$20
	ldx.w #$0005
CODE_8080E2:
	lda.w InitTag,x
	sta.w $0796,x
	sta.w $1EBD,x
	sta.l ReplayBufferEnd,x
	dex
	bpl CODE_8080E2
	ldx.w #$0010
	beq CODE_808102
CODE_8080F7:
	lda.l $80FEFF,x
	sta.l $7EE67B,x
	dex
	bne CODE_8080F7
CODE_808102:
	jsl.l CODE_9F8282
	sep #$20
	rep #$10
	lda.b #$8F
	sta.w $0762
	ldx.w #$000C
CODE_808112:
	lda.w InitHooks,x
	sta.w $0789,x
	dex
	bpl CODE_808112
	ldx.w #$0024
CODE_80811E:
	stz.w $0764,x
	dex
	bpl CODE_80811E
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
	stz.w $0AD3
	jsl.l CODE_8086A9
	jml.l CODE_9F8283
