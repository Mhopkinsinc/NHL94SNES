; Bank $80, fifth 4 KB: the end of the Huffman decoder, the decompress dispatcher, the sound driver and the shootout.
; First come the Huffman decoder's handlers for long codes and its bit readers, then DecompressRLE and Decompress, which
; reads the format word of packed data and calls its decompressor. SoundDriver is the sound CPU's program, sent by
; SPCIPLUpload at reset. The rest is the shootout: the rounds, ShootoutWonBy, and the screen where each team picks its
; goalie and shooters (ShootoutShooters, InitShooters, ShooterSelectList).

org $80C001
	bcc CODE_80C080
	jmp.w CODE_80C09C
CODE_80C006:
	cmp.w $0750
	bcc CODE_80BF8F
	cmp.w $0752
	bcc CODE_80BFA9
	cmp.w $0754
	bcc CODE_80C069
	cmp.w $0756
	bcc CODE_80C080
	cmp.w $0758
	bcc CODE_80C09C
	jmp.w CODE_80C0B1
CODE_80C022:
	cmp.w $0750
	bcc CODE_80BFC5
	cmp.w $0752
	bcc CODE_80BFCD
	cmp.w $0754
	bcc CODE_80C069
	cmp.w $0756
	bcc CODE_80C080
	cmp.w $0758
	bcc CODE_80C09C
	cmp.w $075A
	bcc CODE_80C0B1
	jmp.w CODE_80C0C5
CODE_80C043:
	cmp.w $0750
	bcc CODE_80C099
	cmp.w $0752
	bcc CODE_80BFCD
	cmp.w $0754
	bcc CODE_80C069
	cmp.w $0756
	bcc CODE_80C080
	cmp.w $0758
	bcc CODE_80C09C
	cmp.w $075A
	bcc CODE_80C0B1
	cmp.w $075C
	bcc CODE_80C0C5
	jmp.w CODE_80C0D8
CODE_80C069:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0734
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$03
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
CODE_80C080:
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0736
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$04
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
CODE_80C096:
	jmp.w CODE_80C15F
CODE_80C099:
	jmp.w CODE_80BF8F
CODE_80C09C:
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0738
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$05
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
CODE_80C0B1:
	lsr a
	lsr a
	sec
	sbc.w $073A
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$06
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
CODE_80C0C5:
	lsr a
	sec
	sbc.w $073C
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$07
	cmp.b $73
	beq CODE_80C096
	bra CODE_80C0E8
CODE_80C0D8:
	sec
	sbc.w $073E
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$08
	cmp.b $73
	beq CODE_80C15F
CODE_80C0E8:
	sta.w WMDATA
	sta.b $08
	rep #$20
	inc.b $0C
	lda.b $6B
	jmp (DATA16_80C0F6-2,x)
DATA16_80C0F6:
	dw CODE_80C122,CODE_80C11E,CODE_80C11A,CODE_80C116,CODE_80C112,CODE_80C10E,CODE_80C10A,CODE_80C106
CODE_80C106:
	asl a
	dey
	beq CODE_80C159
CODE_80C10A:
	asl a
	dey
	beq CODE_80C156
CODE_80C10E:
	asl a
	dey
	beq CODE_80C153
CODE_80C112:
	asl a
	dey
	beq CODE_80C150
CODE_80C116:
	asl a
	dey
	beq CODE_80C14D
CODE_80C11A:
	asl a
	dey
	beq CODE_80C14A
CODE_80C11E:
	asl a
	dey
	beq CODE_80C147
CODE_80C122:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	dey
	beq CODE_80C15C
	asl a
	dey
	beq CODE_80C159
	asl a
	dey
	beq CODE_80C156
	asl a
	dey
	beq CODE_80C153
	asl a
	dey
	beq CODE_80C150
CODE_80C13E:
	asl a
	dey
	beq CODE_80C14D
	asl a
	dey
	beq CODE_80C14A
	asl a
CODE_80C147:
	jmp.w CODE_80BF53
CODE_80C14A:
	jmp.w CODE_80BF00
CODE_80C14D:
	jmp.w CODE_80BEAE
CODE_80C150:
	jmp.w CODE_80BE5D
CODE_80C153:
	jmp.w CODE_80BE0D
CODE_80C156:
	jmp.w CODE_80BDBE
CODE_80C159:
	jmp.w CODE_80BD70
CODE_80C15C:
	jmp.w CODE_80BD23
CODE_80C15F:
	rep #$20
	inc.b $0C
	lda.b $6B
	jsr.w CODE_80C2DC
	sta.b $6C
	jsr.w CODE_80C232
	beq CODE_80C195
	ldy.b $08
CODE_80C171:
	sty.w WMDATA
	dec a
	bne CODE_80C171
	lda.b $6C
	jmp (DATA16_80BCF9,x)
CODE_80C17C:
	ldy.b $74
	jsr.w CODE_80C2DC
	sta.b $6C
	jsr.w CODE_80C232
	beq CODE_80C195
	ldy.b $08
CODE_80C18A:
	sty.w WMDATA
	dec a
	bne CODE_80C18A
	lda.b $6C
	jmp (DATA16_80BCF9,x)
CODE_80C195:
	lda.b $6C
	bmi CODE_80C1AF
	ldy.b #$01
	jsr.w CODE_80C2DC
	sta.b $6C
	ldy.b $6D
	sty.w WMDATA
	sty.b $08
	ldy.b #$08
	jsr.w CODE_80C2DC
	jmp (DATA16_80BCF9,x)
CODE_80C1AF:
	rts
CODE_80C1B0:
	stz.b $6F
	lda.b $6C
	asl a
	dey
	beq CODE_80C1CB
CODE_80C1B8:
	bcc CODE_80C1F2
	asl a
	rol.b $6F
	dey
	beq CODE_80C1D7
CODE_80C1C0:
	asl a
	rol.b $6F
	dey
	beq CODE_80C1E3
	sta.b $6C
	lda.b $6F
	rts
CODE_80C1CB:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C1B8
CODE_80C1D7:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C1C0
CODE_80C1E3:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	sta.b $6C
	lda.b $6F
	rts
CODE_80C1F2:
	stx.b $00
	ldx.b #$02
CODE_80C1F6:
	asl a
	dey
	beq CODE_80C21A
CODE_80C1FA:
	inx
	bcc CODE_80C1F6
	stx.b $04
CODE_80C1FF:
	asl a
	rol.b $6F
	dey
	beq CODE_80C226
CODE_80C205:
	dex
	bne CODE_80C1FF
	sta.b $6C
	asl.b $04
	ldx.b $04
	lda.l DATA16_80C2BA-4,x
	ldx.b $00
	clc
	adc.b $6F
	sta.b $6F
	rts
CODE_80C21A:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C1FA
CODE_80C226:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C205
CODE_80C232:
	stz.b $6F
	lda.b $6C
	asl a
	dex
	dex
	beq CODE_80C250
CODE_80C23B:
	bcc CODE_80C277
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C25C
CODE_80C244:
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C268
	sta.b $6C
	lda.b $6F
	rts
CODE_80C250:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra CODE_80C23B
CODE_80C25C:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra CODE_80C244
CODE_80C268:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	sta.b $6C
	lda.b $6F
	rts
CODE_80C277:
	ldy.b #$02
CODE_80C279:
	asl a
	dex
	dex
	beq CODE_80C2A2
CODE_80C27E:
	iny
	bcc CODE_80C279
	sty.b $14
CODE_80C283:
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C2AE
CODE_80C28A:
	dey
	bne CODE_80C283
	sta.b $6C
	txy
	lda.b $14
	and.w #$00FF
	asl a
	tax
	lda.l DATA16_80C2BA-4,x
	tyx
	clc
	adc.b $6F
	sta.b $6F
	rts
CODE_80C2A2:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra CODE_80C27E
CODE_80C2AE:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra CODE_80C28A
DATA16_80C2BA:		; bases of the variable-length numbers in the bit stream
	dw $0000,$0004,$000C,$001C,$003C,$007C,$00FC,$01FC,$03FC
	dw $07FC,$0FFC,$1FFC,$3FFC,$7FFC,$FFFC,$FFFC,$FFFC
CODE_80C2DC:
	asl a
	dex
	dex
	beq CODE_80C2E5
	dey
	bne CODE_80C2DC
	rts
CODE_80C2E5:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	dey
	bne CODE_80C2DC
	rts
DecompressRLE:		; run-length data at Y to WRAM: literal runs and repeats, of bytes if its header word is $0101,
		;   else of byte pairs
	iny
	iny
	iny
	lda.w $0000,y
	iny
	cmp.w #$0101
	bne CODE_80C32F
	lda.w #$0000
	sep #$20
	bra CODE_80C313
CODE_80C306:
	eor.b #$FF
	tax
CODE_80C309:
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl CODE_80C309
CODE_80C313:
	iny
	lda.w $0000,y
	bmi CODE_80C306
	beq CODE_80C32E
CODE_80C31B:
	tax
	iny
	lda.w $0000,y
CODE_80C320:
	sta.w WMDATA
	dex
	bpl CODE_80C320
	iny
	lda.w $0000,y
	bmi CODE_80C306
	bne CODE_80C31B
CODE_80C32E:
	rts
CODE_80C32F:
	lda.w #$0000
	sep #$20
	bra CODE_80C34A
CODE_80C336:
	eor.b #$FF
	tax
CODE_80C339:
	iny
	lda.w $0000,y
	sta.w WMDATA
	iny
	lda.w $0000,y
	sta.w WMDATA
	dex
	bpl CODE_80C339
CODE_80C34A:
	iny
	lda.w $0000,y
	bmi CODE_80C336
	beq CODE_80C372
CODE_80C352:
	tax
	iny
	lda.w $0000,y
	xba
	iny
	lda.w $0000,y
CODE_80C35C:
	xba
	sta.w WMDATA
	xba
	sta.w WMDATA
	dex
	bpl CODE_80C35C
	lda.b #$00
	xba
	iny
	lda.w $0000,y
	bmi CODE_80C336
	bne CODE_80C352
CODE_80C372:
	rts
Decompress:		; unpack the data at [$0C] to WRAM at [$10] by its format word ($FB10 LZ, $FB46 pairs, $FB30 Huffman,
		;   $FB7A run-length); X = the unpacked size from the header, or 1 for an unknown format
	php
	phb
	rep #$30
	jsl.l WaitDMAQueue
	lda.b $11
	sta.w WMADDM
	lda.b $10
	sta.w WMADDL
	lda.b $0D
	pha
	plb
	plb
	ldy.b $0C
	lda.w $0003,y
	xba
	pha
	lda.w $0000,y
	iny
	iny
	cmp.w #$FB10
	bne CODE_80C3A0
	jsr.w DecompressLZ
	bra CODE_80C3C5
CODE_80C3A0:
	cmp.w #$FB46
	bne CODE_80C3AA
	jsr.w DecompressPairs
	bra CODE_80C3C5
CODE_80C3AA:
	cmp.w #$FB30
	bne CODE_80C3B4
	jsr.w DecompressHuffman
	bra CODE_80C3C5
CODE_80C3B4:
	cmp.w #$FB7A
	bne CODE_80C3BE
	jsr.w DecompressRLE
	bra CODE_80C3C5
CODE_80C3BE:
	plx
	ldx.w #$0001
	plb
	plp
	rtl
CODE_80C3C5:
	rep #$30
	plx
	plb
	plp
	rtl
SoundDriver:		; the sound CPU program as SPCIPLUpload blocks: length, sound RAM address, bytes; length 0 ends it
		;   with the start address
	dw .end-.code,$0400
.code:
	db $20,$CD,$FF,$BD,$E8,$49,$C4,$0E,$E8,$08,$C4,$0F,$E8,$FF,$80,$A4
	db $0E,$C4,$11,$E8,$FE,$80,$A4,$0F,$C4,$10,$F8,$11,$8D,$00,$E8,$00
	db $D7,$0E,$FC,$1D,$D0,$FA,$AB,$0F,$C4,$0E,$8D,$00,$F8,$10,$D7,$0E
	db $FC,$D0,$FB,$AB,$0F,$1D,$D0,$F6,$D7,$0E,$8D,$BF,$D7,$0E,$DC,$D0
	db $FB,$E8,$20,$C4,$0D,$8D,$6C,$CB,$F2,$C4,$F3,$E8,$00,$8D,$0C,$CB
	db $F2,$C4,$F3,$8D,$1C,$CB,$F2,$C4,$F3,$E8,$90,$C4,$F1,$E8,$10,$C4
	db $FA,$E8,$81,$C4,$F1,$E8,$00,$C4,$00,$E8,$49,$C4,$03,$E8,$08,$C4
	db $04,$E8,$02,$8D,$5D,$CB,$F2,$C4,$F3,$E8,$00,$8D,$5C,$CB,$F2,$C4
	db $F3,$E8,$FF,$8D,$4C,$CB,$F2,$C4,$F3,$E8,$FF,$8D,$5C,$CB,$F2,$C4
	db $F3,$E8,$00,$8D,$2C,$CB,$F2,$C4,$F3,$8D,$3C,$CB,$F2,$C4,$F3,$8D
	db $0D,$CB,$F2,$C4,$F3,$E8,$01,$8D,$6D,$CB,$F2,$C4,$F3,$8D,$7D,$CB
	db $F2,$C4,$F3,$E8,$00,$8D,$2D,$CB,$F2,$C4,$F3,$8D,$3D,$CB,$F2,$C4
	db $F3,$8D,$4D,$CB,$F2,$C4,$F3,$E8,$00,$C4,$F5,$C4,$F6,$5F,$D6,$04
	db $C4,$F4,$E4,$F4,$D0,$FC,$E8,$00,$C4,$F4,$E4,$F4,$F0,$FC,$00,$00
	db $64,$F4,$D0,$F6,$1C,$5D,$1F,$EF,$04,$01,$02,$04,$08,$10,$20,$40
	db $80,$13,$05,$2C,$05,$45,$05,$9B,$05,$B4,$05,$C4,$05,$F2,$05,$31
	db $06,$70,$06,$AF,$06,$04,$07,$1F,$07,$3D,$07,$4A,$07,$63,$07,$D3
	db $07,$0B,$08,$E8,$00,$C4,$00,$E8,$49,$C4,$03,$E8,$08,$C4,$04,$E8
	db $FF,$8D,$5C,$CB,$F2,$C4,$F3,$E8,$01,$5F,$D0,$04,$E4,$00,$C4,$F5
	db $E8,$02,$C4,$F4,$64,$F4,$F0,$FC,$E4,$03,$C4,$F5,$E4,$04,$C4,$F6
	db $E8,$80,$5F,$D0,$04,$E4,$00,$68,$60,$F0,$4B,$1C,$1C,$5D,$E4,$03
	db $D5,$00,$02,$60,$84,$F6,$D5,$02,$02,$E4,$04,$D5,$01,$02,$84,$F7
	db $D5,$03,$02,$CD,$00,$8D,$00,$D8,$F5,$E8,$03,$C4,$F4,$3D,$3E,$F5
	db $D0,$0C,$E4,$F6,$D7,$03,$D8,$F5,$3A,$03,$3D,$5F,$6E,$05,$E4,$F4
	db $D0,$EC,$E4,$00,$1C,$1C,$5D,$E4,$03,$D5,$04,$02,$E4,$04,$D5,$05
	db $02,$AB,$00,$5F,$D6,$04,$E8,$FF,$5F,$D0,$04,$E4,$00,$F0,$F7,$9C
	db $C4,$00,$1C,$1C,$5D,$F5,$00,$02,$C4,$03,$F5,$01,$02,$C4,$04,$E8
	db $04,$5F,$D0,$04,$F8,$F5,$F5,$E9,$04,$8D,$5C,$CB,$F2,$C4,$F3,$E8
	db $05,$5F,$D0,$04,$E4,$F5,$1C,$1C,$1C,$1C,$FD,$FC,$FC,$E4,$F6,$CB
	db $F2,$C4,$F3,$FC,$E4,$F7,$CB,$F2,$C4,$F3,$E8,$00,$8D,$5C,$CB,$F2
	db $C4,$F3,$F8,$F5,$F5,$E9,$04,$8D,$4C,$CB,$F2,$C4,$F3,$E8,$06,$5F
	db $D0,$04,$E4,$F5,$1C,$1C,$1C,$1C,$FD,$E4,$F6,$CB,$F2,$C4,$F3,$FC
	db $E4,$F7,$CB,$F2,$C4,$F3,$FC,$E8,$07,$C4,$F4,$64,$F4,$F0,$FC,$FC
	db $FC,$E4,$F5,$CB,$F2,$C4,$F3,$FC,$E4,$F6,$CB,$F2,$C4,$F3,$FC,$E4
	db $F7,$CB,$F2,$C4,$F3,$FC,$E8,$00,$CB,$F2,$C4,$F3,$E8,$81,$5F,$D0
	db $04,$E4,$F5,$8D,$0C,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$1C,$CB,$F2,$C4
	db $F3,$E4,$F7,$8D,$2D,$CB,$F2,$C4,$F3,$E8,$08,$C4,$F4,$64,$F4,$F0
	db $FC,$E4,$F5,$8D,$3D,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$4D,$CB,$F2,$C4
	db $F3,$E4,$F7,$04,$0D,$8D,$6C,$CB,$F2,$C4,$F3,$E8,$82,$5F,$D0,$04
	db $E4,$F5,$8D,$2C,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$3C,$CB,$F2,$C4,$F3
	db $E4,$F7,$8D,$0D,$CB,$F2,$C4,$F3,$E8,$09,$C4,$F4,$64,$F4,$F0,$FC
	db $E4,$F5,$8D,$6D,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$7D,$CB,$F2,$C4,$F3
	db $E8,$00,$C4,$0D,$8D,$6C,$CB,$F2,$C4,$F3,$E8,$83,$5F,$D0,$04,$E4
	db $F5,$8D,$0F,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$1F,$CB,$F2,$C4,$F3,$E4
	db $F7,$8D,$2F,$CB,$F2,$C4,$F3,$E8,$0A,$C4,$F4,$64,$F4,$F0,$FC,$E4
	db $F5,$8D,$3F,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$4F,$CB,$F2,$C4,$F3,$E4
	db $F7,$8D,$5F,$CB,$F2,$C4,$F3,$E8,$84,$C4,$F4,$64,$F4,$F0,$FC,$E4
	db $F5,$8D,$6F,$CB,$F2,$C4,$F3,$E4,$F6,$8D,$7F,$CB,$F2,$C4,$F3,$E8
	db $85,$5F,$D0,$04,$E4,$F5,$1C,$1C,$1C,$1C,$FD,$FC,$FC,$E4,$F6,$CB
	db $F2,$C4,$F3,$FC,$E4,$F7,$CB,$F2,$C4,$F3,$E8,$0B,$5F,$D0,$04,$E4
	db $F5,$1C,$1C,$1C,$1C,$88,$05,$FD,$FC,$FC,$E4,$F6,$CB,$F2,$C4,$F3
	db $DC,$DC,$E8,$00,$CB,$F2,$C4,$F3,$E8,$0C,$5F,$D0,$04,$E8,$FF,$8D
	db $5C,$CB,$F2,$C4,$F3,$E8,$0D,$5F,$D0,$04,$E4,$F5,$1C,$1C,$1C,$1C
	db $FD,$E4,$F6,$CB,$F2,$C4,$F3,$FC,$E4,$F7,$CB,$F2,$C4,$F3,$E8,$0E
	db $5F,$D0,$04,$E4,$00,$68,$60,$F0,$65,$C4,$07,$1C,$1C,$5D,$E4,$03
	db $D5,$00,$02,$60,$84,$F6,$D5,$02,$02,$E4,$04,$D5,$01,$02,$84,$F7
	db $D5,$03,$02,$E4,$F6,$C4,$09,$E4,$F7,$C4,$0A,$CD,$00,$8D,$00,$D8
	db $F5,$E8,$0F,$C4,$F4,$3D,$3E,$F5,$D0,$0B,$E4,$F6,$D7,$03,$D8,$F5
	db $FC,$3D,$5F,$96,$07,$E4,$F4,$D0,$ED,$DD,$60,$84,$03,$C4,$03,$E4
	db $04,$88,$00,$C4,$04,$1A,$03,$1D,$D8,$09,$E4,$00,$1C,$1C,$5D,$E4
	db $03,$D5,$04,$02,$E4,$04,$D5,$05,$02,$AB,$00,$5F,$D6,$04,$E8,$FF
	db $5F,$D0,$04,$8D,$00,$CB,$F5,$E8,$10,$C4,$F4,$00,$00,$00,$00,$FC
	db $E4,$F6,$CB,$F5,$D7,$03,$E4,$F4,$D0,$F5,$DD,$60,$84,$03,$C4,$03
	db $E4,$04,$88,$00,$C4,$04,$1D,$D8,$09,$E4,$07,$1C,$1C,$5D,$E4,$03
	db $D5,$04,$02,$E4,$04,$D5,$05,$02,$5F,$D6,$04,$E4,$F6,$C4,$0B,$E4
	db $F7,$C4,$0C,$E8,$11,$C4,$F4,$64,$F4,$F0,$FC,$E4,$F6,$C4,$05,$E4
	db $F7,$C4,$06,$E8,$00,$C4,$F5,$E8,$86,$C4,$F4,$64,$F4,$F0,$FC,$CD
	db $00,$8D,$00,$D8,$F5,$3E,$F5,$D0,$FC,$F7,$0B,$C4,$F6,$3D,$D8,$F5
	db $3A,$0B,$1A,$05,$D0,$EF,$5F,$D6,$04
.end:
	dw $0000,$0400
CODE_80C81C:		; the shootout: both shooter lists, then a turn for each team every round, until after five rounds
		;   $178E and $1790 differ
	lda.l $7E34C6
	pha
	lda.w #$0000
	sta.l $7E34C6
	lda.w #$0001
	sta.w $1D81
	stz.b $91
	jsl.l InitShooters
	lda.w #$0002
	sta.b $91
	jsl.l InitShooters
	jsl.l CODE_9F833C
	jsl.l CODE_9F8433
	jsl.l CODE_9F937B
	lda.w #$0001
	sta.w shootoutround
	stz.b $A9
CODE_80C851:
	stz.w $1D89
	lda.w #$0002
	sta.b $91
	stz.b $8D
	jsl.l CODE_80C898
	lda.w shootoutround
	cmp.w #$0005
	bmi CODE_80C86D
	lda.w #$0001
	sta.w $1D89
CODE_80C86D:
	stz.b $91
	lda.w #$0002
	sta.b $8D
	jsl.l CODE_80C898
	jsl.l CODE_80CA0A
	inc.w shootoutround
	lda.w shootoutround
	cmp.w #$0006
	bmi CODE_80C851
	lda.w $178E
	cmp.w $1790
	beq CODE_80C851
	stz.w $1D81
	pla
	sta.l $7E34C6
	rtl
CODE_80C898:		; a shootout turn of team $91: the shooter of this round from its list
	stz.w $1D83
	stz.w $1D87
	lda.b $91
	pha
	jsl.l CODE_9EC107
	stz.w $15D4
	lda.b $91
	beq CODE_80C8B2
	lda.w #$0002
	sta.w $15D4
CODE_80C8B2:
	jsl.l CODE_9F8433
	pla
	sta.b $91
	lda.w #$0000
	sta.w $1E8D
	lda.b $91
	beq CODE_80C8C9
	lda.w #$000C
	sta.w $1E8D
CODE_80C8C9:
	ldy.w #$0000
CODE_80C8CC:
	lda.w $19F6,y
	cmp.b $91
	beq CODE_80C8E2
	iny
	iny
	cpy.w #$000A
	bcc CODE_80C8CC
	lda.w #$FFFF
	sta.w $1E93
	bra CODE_80C8E5
CODE_80C8E2:
	sty.w $1E93
CODE_80C8E5:
	jsl.l CODE_9EC72D
	lda.b $91
	beq CODE_80C918
	lda.w shootoutround
CODE_80C8F0:
	cmp.w #$0006
	bmi CODE_80C8FB
	sec
	sbc.w #$0005
	bra CODE_80C8F0
CODE_80C8FB:
	tay
	sep #$20
	lda.w awayshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$000C
	sta.w $1E8D
	lda.w #$0002
	sta.w $1E91
	bra CODE_80C93E
CODE_80C918:
	lda.w shootoutround
CODE_80C91B:
	cmp.w #$0006
	bmi CODE_80C926
	sec
	sbc.w #$0005
	bra CODE_80C91B
CODE_80C926:
	tay
	sep #$20
	lda.w homeshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w $1E8F
	lda.w #$0000
	sta.w $1E8D
	stz.w $1E91
CODE_80C93E:
	jsl.l CODE_9F8511
	rtl
ShootoutWonBy:		; "<team> Wins!" once the shootout is decided
	lda.w $1D81
	bne CODE_80C94B
	jmp.w CODE_80CA05
CODE_80C94B:
	lda.w #$000A
	sta.b $A5
	lda.w $1D89
	bne CODE_80C958
	jmp.w CODE_80CA05
CODE_80C958:
	lda.w $178E
	sec
	sbc.w $1790
	bne CODE_80C964
	jmp.w CODE_80CA05
CODE_80C964:
	phx
	phy
	lda.b $A9
	pha
	lda.b $8D
	pha
	lda.w $178E
	sec
	sbc.w $1790
	bmi CODE_80C97A
	ldy.w #$0000
	bra CODE_80C97D
CODE_80C97A:
	ldy.w #$0002
CODE_80C97D:
	phy
	lda.w $1C98,y
	jsl.l CODE_9BC5AB
	lda.b [$8D]
	and.w #$00FF
	dec a
	dec a
	asl a
	tax
	txa
	clc
	adc.w #$0002
	sta.b $A5
	lda.w #$0020
	sec
	sbc.b $A5
	lsr a
	sta.w $0D0F
	sta.b $00
	lda.w #$000D
	sta.w $0D11
	lda.w #$0006
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $00
	inc a
	sta.w $0D0F
	lda.w #$000E
	sta.w $0D11
	jsl.l CODE_9ECE15
	lda.w #$000C
	sta.w $0D0F
	lda.w #$0010
	sta.w $0D11
	ply
	lda.w $1C98,y
	cmp.w #$000E
	beq CODE_80C9EA
	cmp.w #$000D
	beq CODE_80C9EA
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF59
	sta.b $8D
	jsl.l CODE_9ECE15
	bra CODE_80C9F8
CODE_80C9EA:
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF60
	sta.b $8D
	jsl.l CODE_9ECE15
CODE_80C9F8:
	pla
	sta.b $8D
	pla
	sta.b $A9
	ply
	plx
	lda.w #$0010
	sta.b $A5
CODE_80CA05:
	jsl.l CODE_9EB88A
	rtl
CODE_80CA0A:		; does nothing
	rtl
ShootoutShooters:	; the screen where team $91 picks its goalie and shooters; Selected_Goalie is set from the list on exit
	jsl.l CODE_9DE0E9
	lda.w #$0001
	sta.b $A5
	lda.b $91
	beq CODE_80CA1D
	lda.w #$0002
	sta.b $A5
CODE_80CA1D:
	lda.w $1C84
	cmp.b $A5
	beq CODE_80CA2E
	lda.w $1C86
	cmp.b $A5
	beq CODE_80CA2E
	jmp.w CODE_80CA9C
CODE_80CA2E:
	ldx.b $91
	lda.w $1C98,x
	sta.l $7E3454
	lda.w #$FFFF
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l CODE_80CAE1
	jsl.l CODE_9DE0D4
	jsl.l CODE_80CC1B
	stz.w $1DB9
	lda.w #$0001
	sta.w $0D43
	stz.w $0D47
	jsl.l CODE_80CC89
	lda.w #$0005
	ldx.w #$0050
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_80CA70:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$0800
	bne CODE_80CAB8
	bit.w #$0400
	bne CODE_80CAC6
	bit.w #$8080
	bne CODE_80CAD7
	bit.w #$1000
	bne CODE_80CA9C
CODE_80CA9A:
	bra CODE_80CA70
CODE_80CA9C:
	ldy.b $91
	bne CODE_80CAA9
	sep #$20
	lda.w homeshooters
	rep #$20
	bra CODE_80CAB0
CODE_80CAA9:
	sep #$20
	lda.w awayshooters
	rep #$20
CODE_80CAB0:
	and.w #$00FF
	dec a
	sta.w Selected_Goalie,y
	rtl
CODE_80CAB8:
	lda.w $1DB9
	beq CODE_80CA9A
	dec.w $1DB9
	jsl.l CODE_80CC89
	bra CODE_80CA9A
CODE_80CAC6:
	lda.w $1DB9
	cmp.w #$0005
	bpl CODE_80CA9A
	inc.w $1DB9
	jsl.l CODE_80CC89
	bra CODE_80CA9A
CODE_80CAD7:
	jsl.l CODE_80CE0A
	jsl.l CODE_80CC89
	bra CODE_80CA9A
CODE_80CAE1:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF66
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF6B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF70
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_80CC1B
	rtl
CODE_80CB5C:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF81
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF86
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF8B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ABA95
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0000
	ldy.w #$0000
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l CODE_808E2D
	rtl
CODE_80CC1B:
	lda.l $7E3468
	beq CODE_80CC25
	jsl.l CODE_80CB5C
CODE_80CC25:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF9C
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFA6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1C98
	sta.b $A9
	lda.b $91
	beq CODE_80CC65
	lda.w $1C9A
	sta.b $A9
CODE_80CC65:
	jsl.l CODE_9FBE08
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq CODE_80CC88
	jsl.l WaitFrame
	lda.w #$0050
	sta.w $1DEF
	lda.w #$0000
	sta.l $7E3468
CODE_80CC88:
	rtl
CODE_80CC89:		; print the goalie and shooter rows, the row at the cursor ($1DB9) in another palette
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFAB
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFB0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9ED300
	lda.b $A5
	dec a
	sta.b $A9
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDAA
	sta.b $9D
	lda.w #$0080
	sta.b $97
	lda.w #DATA8_80CDA6
	sta.b $95
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_80CD22
	asl a
	asl a
	asl a
	sta.b $A5
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CD13
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CD13:
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDB6
	sta.b $9D
	lda.w #$0005
	sta.b $A9
CODE_80CD22:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$0005
	sec
	sbc.b $A9
	cmp.w $1DB9
	bne CODE_80CD62
	lda.w #$2000
	sta.w $0D0D
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.l $7E345A
	phx
	ldx.b $91
	lda.w $1C98,x
	cmp.w #$0018
	bcc CODE_80CD61
CODE_80CD4E:
	ldx.w #$0000
	lda.l $7E345A
	lda.b $12
	sta.b $0E
	lda.b $10
	sta.b $0C
	jsl.l CODE_80B719
CODE_80CD61:
	plx
CODE_80CD62:
	lda.w #$0005
	sta.w $0D0F
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b $8D
	jsl.l CODE_9EC7BE
	lda.b $8F
	sta.b $9F
	lda.b $8D
	sta.b $9D
	lda.w #$0008
	sta.w $0D0F
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC372
	jsl.l CODE_9EC7BE
	inc.b $95
	inc.w $0D11
	inc.w $0D11
	dec.b $A9
	bmi CODE_80CDA1
	jmp.w CODE_80CD22
CODE_80CDA1:
	jsl.l CODE_80CC1B
	rtl
DATA8_80CDA6:
	db $01,$02,$03,$04
DATA8_80CDAA:
	db $03,$00,$47,$03,$00,$47,$03,$00,$47,$03,$00,$47
DATA8_80CDB6:
	db $03,$00,$47,$03,$00,$31,$03,$00,$32,$03,$00,$33,$03,$00,$34,$03,$00,$35
InitShooters:		; homeshooters or awayshooters (team $91) from the team data
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CDE0
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CDE0:
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w $1CDC,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.w #$0007
	sta.b $A5
CODE_80CDF9:
	sep #$20
	lda.b [$8D]
	sta.b [$95]
	rep #$20
	inc.b $8D
	inc.b $95
	dec.b $A5
	bpl CODE_80CDF9
	rtl
CODE_80CE0A:		; button on a row: the goalie row cycles the goalie, a shooter row opens ShooterSelectList
	lda.w $1DB9
	bne ShooterSelectList
	jsl.l CODE_9ED300
	lda.w #$0000
	sta.b $8F
	lda.w #homeshooters
	sta.b $8D
	lda.b $91
	beq CODE_80CE2B
	lda.w #$0000
	sta.b $8F
	lda.w #awayshooters
	sta.b $8D
CODE_80CE2B:
	lda.b [$8D]
	and.w #$00FF
	inc a
	cmp.b $A5
	beq CODE_80CE3A
	bmi CODE_80CE3A
	lda.w #$0001
CODE_80CE3A:
	sep #$20
	sta.b [$8D]
	rep #$20
	rtl
ShooterSelectList:	; pick the player for the shooter row at the cursor
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFB5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE9C7
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	ldx.w #$0001
	ldy.w #$0001
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l CODE_808E2D
	jsl.l CODE_9DD938
	jsl.l CODE_9DD962
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	jsl.l CODE_9FC93D
	lda.b $A5
	sta.w $1DA3
	jsl.l CODE_9ED300
	lda.w $1DA3
	sec
	sbc.b $A5
	sta.w $1DA3
	lda.b $A5
	sta.w $1DAB
	lda.b $A5
	sta.w $1DA7
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CEFF
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CEFF:
	lda.b $95
	clc
	adc.w $1DB9
	sta.b $95
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.w $1D9B
	lda.w #$0008
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl CODE_80CF36
	lda.w $1D9B
	sec
	sbc.w #$0008
	sec
	sbc.w $1DA7
	bmi CODE_80CF31
	clc
	adc.w $1DA7
	sta.w $1DA7
CODE_80CF31:
	lda.w #$0000
	bra CODE_80CF41
CODE_80CF36:
	lda.w $1DA7
	clc
	adc.w #$0008
	sec
	sbc.w $1D9B
CODE_80CF41:
	sta.w $1D9B
	jsl.l CODE_80D004
CODE_80CF48:
	jsl.l CODE_9DD923
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_80CF84
	bit.w #$0800
	bne CODE_80CFBE
	bit.w #$0400
	bne CODE_80CFAE
	bit.w #$0100
	bne CODE_80CF8C
	bit.w #$0200
	bne CODE_80CF9E
	bit.w #$8080
	beq CODE_80CF48
	jsl.l CODE_80D2BD
CODE_80CF84:
	lda.w #$0001
	sta.l $7E3468
	rtl
CODE_80CF8C:
	lda.w $0D47
	inc a
	cmp.w #$0010
	bpl CODE_80CF48
	sta.w $0D47
	jsl.l CODE_80D004
	bra CODE_80CF48
CODE_80CF9E:
	lda.w $0D47
	dec a
	bmi CODE_80CF48
	sta.w $0D47
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
CODE_80CFAE:
	lda.w $1D9B
	dec a
	bmi CODE_80CFD1
	sta.w $1D9B
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
CODE_80CFBE:
	lda.w $1D9B
	inc a
	cmp.w #$0009
	bpl CODE_80CFEE
	sta.w $1D9B
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
CODE_80CFD1:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w #$0009
	cmp.w $1DA3
	bmi CODE_80CFE4
	jmp.w CODE_80CF48
CODE_80CFE4:
	inc.w $1DA7
	jsl.l CODE_80D004
	jmp.w CODE_80CF48
CODE_80CFEE:
	lda.w $1DA7
	dec a
	cmp.w $1DAB
	bpl CODE_80CFFA
	jmp.w CODE_80CF48
CODE_80CFFA:
	dec.w $1DA7
	jsl.l CODE_80D004
