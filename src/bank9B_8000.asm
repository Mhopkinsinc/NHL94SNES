; Bank $9B, first 4 KB: pad input, then the start of the lines screen. CODE_9B8000 sets $7E35DA to $3333 on a 50 Hz
; console. CODE_9B8017 turns the d-pad bits of each of the five pads into a direction with PadDirection. Multi5Bios, a
; modified copy of the multitap reader that its marker strings call the SHVC MULTI5 BIOS, reads the five pads, and
; Multi5ConnectCheck reads the multitap signature bits of both ports into $1A00. LinearToPlanar converts linear 4bpp
; tiles to SNES planar (bit 3, 2, 1, 0 of each pixel to planes 1, 0, 3, 2). The rest draws and runs the screen that lists
; the lines (Goalies, Scoring 1, Scoring 2, Checking, the power play and penalty kill lines, or Best Line).

org $9B8000
CODE_9B8000:
	lda.w #$0000
	sta.l $7E35DA
	lda.w STAT78
	bit.w #$0010
	beq CODE_9B8016
	lda.w #$3333
	sta.l $7E35DA
CODE_9B8016:
	rtl
CODE_9B8017:
	lda.w JoyPad
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA4
	lda.w $0778
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA6
	lda.w $077A
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AA8
	lda.w $077C
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AAA
	lda.w $077E
	xba
	and.w #$000F
	tax
	lda.l PadDirection,x
	and.w #$00FF
	sta.w $0AAC
	jsr.w $8472
	lda.w $0AAE
	ora.w $0AB0
	ora.w $0AB2
	ora.w $0AB4
	ora.w $0AB6
	sta.w $0AC2
	rtl
PadDirection:		; the d-pad bits (up, down, left, right) to a direction: 0 up, then clockwise to 7 up-left; 8 for
			;   none or opposite directions
	db $08,$02,$06,$08,$04,$03,$05,$08,$00,$01,$07,$08,$08,$08,$08,$08
	db "START OF MULTI5 BIOS"
Multi5Bios:		; read the five pads: pads 1 and 2 from the auto read, pads 3 to 5 through the multitap
			;   on port 2 when $1A0C is set
	php
	sep #$20
	rep #$10
	stz.w $0ACD
	stz.w $0ACE
CODE_9B80B6:
	lda.w HVBJOY
	and.b #$01
	bne CODE_9B80B6
	ldx.w JOY1L
	stx.w JoyPad
	txa
	and.b #$0F
	sta.w $0ACA
	lda.w $4016
	lsr a
	rol.w $0ACA
	ldx.w JOY2L
	stx.w $0778
	txa
	and.b #$0F
	sta.w $0ACB
	lda.w $1A0C
	bne CODE_9B80E4
	jmp.w $81EC
CODE_9B80E4:
	ldx.w JOY4L
	stx.w $077A
	txa
	and.b #$0F
	sta.w $0ACC
	lda.w $4017
	lsr a
	rol.w $0ACB
	lsr a
	rol.w $0ACC
	stz.w WRIO
	lda.w $0AD7
	ora.w $1A0E
	bne CODE_9B811F
	lda.w $1C8A
	ora.w $1C8C
	bne CODE_9B811F
	lda.w $1A02
	beq CODE_9B811A
	dec a
	sta.w $1A02
	jmp.w $81F3
CODE_9B811A:
	lda.b #$1E
	sta.w $1A02
CODE_9B811F:
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $4017
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $077C
	and.b #$0F
	sta.w $0ACD
	lda.w $077E
	and.b #$0F
	sta.w $0ACE
	lda.w $4017
	lsr a
	rol.w $0ACD
	lsr a
	rol.w $0ACE
	bra CODE_9B81F3
CODE_9B81EC:
	lda.w $4017
	lsr a
	rol.w $0ACB
CODE_9B81F3:
	lda.b #$80
	sta.w WRIO
	lda.w $1A0E
	and.b #$01
	sta.w $1A0E
	lda.w $1A04
	beq CODE_9B8208
CODE_9B8205:
	dec.w $1A04
CODE_9B8208:
	stz.w $4016
	lda.b #$01
	sta.w $4016
	lda.w $4016
	and.b #$02
	tax
	eor.w $1A06
	stx.w $1A06
	sta.w $1A0A
	lda.w $4017
	and.b #$02
	tax
	eor.w $1A08
	stx.w $1A08
	ora.w $1A0A
	beq CODE_9B8235
CODE_9B8230:
	lda.b #$10
	sta.w $1A04
CODE_9B8235:
	lda.w $1A04
	bne CODE_9B823C
	bra CODE_9B8274
CODE_9B823C:
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.w $077A
	stx.w $077C
	stx.w $077E
	lda.w $1A00
	and.b #$80
	beq CODE_9B825A
	lda.b #$01
	tsb.w $1A0E
	bra CODE_9B825F
CODE_9B825A:
	lda.b #$01
	trb.w $1A0E
CODE_9B825F:
	lda.w $1A00
	and.b #$40
	beq CODE_9B826D
	lda.b #$01
	tsb.w $1A0C
	bra CODE_9B8277
CODE_9B826D:
	lda.b #$01
	trb.w $1A0C
	bra CODE_9B8277
CODE_9B8274:
	stz.w $4016
CODE_9B8277:
	lda.w $0ACA
	cmp.b #$01
	beq CODE_9B828C
	ldx.w #$000F
	stx.w JoyPad
	ldx.w $1A0C
	beq CODE_9B828C
CODE_9B8289:
	jsr.w $8309
CODE_9B828C:
	lda.w $0ACB
	cmp.b #$01
	beq CODE_9B82A1
	ldx.w #$000F
	stx.w $0778
	ldx.w $1A0C
	beq CODE_9B82D6
CODE_9B829E:
	jsr.w $8309
CODE_9B82A1:
	lda.w $1A0C
	beq CODE_9B82D6
CODE_9B82A6:
	lda.w $0ACC
	cmp.b #$01
	beq CODE_9B82B6
	ldx.w #$000F
	stx.w $077A
	jsr.w $8309
CODE_9B82B6:
	lda.w $0ACD
	cmp.b #$01
	beq CODE_9B82C6
	ldx.w #$000F
	stx.w $077C
	jsr.w $8309
CODE_9B82C6:
	lda.w $0ACE
	cmp.b #$01
	beq CODE_9B82D6
	ldx.w #$000F
	stx.w $077E
	jsr.w $8309
CODE_9B82D6:
	lda.w $1A0E
	beq CODE_9B8307
CODE_9B82DB:
	lda.b $83
	and.b #$10
	bne CODE_9B82F5
	ldx.w #$1000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
	bra CODE_9B8307
CODE_9B82F5:
	ldx.w #$0000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
CODE_9B8307:
	plp
	rtl
CODE_9B8309:
	and.b #$1E
	cmp.b #$02
	bne CODE_9B8316
	lda.b #$04
	tsb.w $1A0E
	bra CODE_9B831F
CODE_9B8316:
	cmp.b #$1E
	bne CODE_9B831F
	lda.b #$02
	tsb.w $1A0E
CODE_9B831F:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
Multi5Init:		; check for the multitap, then clear the multitap pads and state
	jsl.l Multi5ConnectCheck
	lda.w #$000F
	sta.w $077A
	sta.w $077C
	sta.w $077E
	stz.w $1A0C
	stz.w $1A0E
	stz.w $1A04
	stz.w $1A02
	lda.w $1A00
	and.w #$0080
	beq CODE_9B8384
	lda.w #$0001
	tsb.w $1A0E
	bra CODE_9B838A
CODE_9B8384:
	lda.w #$0001
	trb.w $1A0E
CODE_9B838A:
	lda.w $1A00
	and.w #$0040
	beq CODE_9B839A
	lda.w #$0001
	tsb.w $1A0C
	bra CODE_9B83A0
CODE_9B839A:
	lda.w #$0001
	trb.w $1A0C
CODE_9B83A0:
	rtl
	db "START OF MULTI5 CONNECT CHECK"
Multi5ConnectCheck:	; read 16 signature bits from each port; $1A00 bit 7 (port 1) or 6 (port 2) = multitap
	php
	sep #$30
	stz.w $1A00
CODE_9B83C4:
	lda.w HVBJOY
	and.b #$01
	bne CODE_9B83C4
	stz.w $4016
	lda.b #$01
	sta.w $4016
	ldx.b #$08
CODE_9B83D5:
	lda.w $4016
	lsr a
	lsr a
	rol.w $0782
	lda.w $4017
	lsr a
	lsr a
	rol.w $0784
	dex
	bne CODE_9B83D5
	stz.w $4016
	ldx.b #$08
CODE_9B83ED:
	lda.w $4016
	lsr a
	lsr a
	rol.w $0781
	lda.w $4017
	lsr a
	lsr a
	rol.w $0783
	dex
	bne CODE_9B83ED
	lda.w $0782
	cmp.b #$FF
	bne CODE_9B8413
	lda.w $0781
	cmp.b #$FF
	beq CODE_9B8413
	lda.b #$80
	sta.w $1A00
CODE_9B8413:
	lda.w $0784
	cmp.b #$FF
	bne CODE_9B8426
	lda.w $0783
	cmp.b #$FF
	beq CODE_9B8426
	lda.b #$40
	tsb.w $1A00
CODE_9B8426:
	plp
	rtl
	db "MODIFIED FROM SHVC MULTI5 CONNECT CHECK VER1.00"
	db "END OF MULTI5 CONNECT CHECK"
CODE_9B8472:
	lda.w JoyPad
	eor.w $0A9A
	sta.w $0AAE
	and.w JoyPad
	sta.w $0AB8
	lda.w $0778
	eor.w $0A9C
	sta.w $0AB0
	and.w $0778
	sta.w $0ABA
	lda.w $077A
	eor.w $0A9E
	sta.w $0AB2
	and.w $077A
	sta.w $0ABC
	lda.w $077C
	eor.w $0AA0
	sta.w $0AB4
	and.w $077C
	sta.w $0ABE
	lda.w $077E
	eor.w $0AA2
	sta.w $0AB6
	and.w $077E
	sta.w $0AC0
	lda.w JoyPad
	sta.w $0A9A
	lda.w $0778
	sta.w $0A9C
	lda.w $077A
	sta.w $0A9E
	lda.w $077C
	sta.w $0AA0
	lda.w $077E
	sta.w $0AA2
	rts
CODE_9B84DC:
	phx
	asl a
	tax
	lda.w JoyPad,x
	sta.b $B1
	lda.w $0AAE,x
	sta.b $AD
	lda.w $0AB8,x
	sta.b $A9
	lda.w $0AA4,x
	sta.b $A5
	plx
	rtl
CODE_9B84F5:
	lda.w JoyPad
	sta.b $B1
	lda.w $0AAE
	sta.b $AD
	lda.w $0AB8
	sta.b $A9
	lda.w $0AA4
	sta.b $A5
	rtl
CODE_9B850A:
	lda.w $0778
	sta.b $B1
	lda.w $0AB0
	sta.b $AD
	lda.w $0ABA
	sta.b $A9
	lda.w $0AA6
	sta.b $A5
	rtl
CODE_9B851F:
	lda.w $0AC6
	lsr a
	jmp.w $84DC
CODE_9B8526:
	lda.w $0AC2
	sta.b $A9
	rtl
CODE_9B852C:
	lda.b $B1
	beq CODE_9B8543
	lda.b $AD
	bne CODE_9B8544
	dec.w $0AC4
	bpl CODE_9B8543
	lda.w #$0006
	sta.w $0AC4
	lda.b $B1
	sta.b $A9
CODE_9B8543:
	rtl
CODE_9B8544:
	lda.w #$0014
	sta.w $0AC4
	rtl
RemapTiles:
	lda.w #$000E
	sta.b $CA
	sta.b $CA
CODE_9B8552:
	rep #$30
	ldy.b $CA
	lda.b [$89],y
	sta.b $C5
	tya
	clc
	adc.w #$0010
	tay
	lda.b [$89],y
	sta.b $C7
	sep #$30
	ldx.b $CA
	lda.b #$07
	sta.b $C9
CODE_9B856C:
	ldy.b #$00
	asl.b $C8
	bcc CODE_9B8574
	ldy.b #$08
CODE_9B8574:
	asl.b $C7
	bcc CODE_9B857C
	iny
	iny
	iny
	iny
CODE_9B857C:
	asl.b $C6
	bcc CODE_9B8582
	iny
	iny
CODE_9B8582:
	asl.b $C5
	bcc CODE_9B8587
	iny
CODE_9B8587:
	lda.b [$8D],y
	lsr a
	rol.w $0A0A,x
	lsr a
	rol.w $0A0B,x
	lsr a
	rol.w $0A1A,x
	lsr a
	rol.w $0A1B,x
	dec.b $C9
	bpl CODE_9B856C
	dec.b $CA
	dec.b $CA
	bpl CODE_9B8552
	rep #$30
	ldx.w #$0000
CODE_9B85A8:
	lda.w $0A0A,x
	sta.w VMDATAL
	inx
	inx
	cpx.w #$0020
	bne CODE_9B85A8
	lda.b $89
	clc
	adc.w #$0020
	sta.b $89
	dec.b $A5
	bne RemapTiles
	rtl
LinearToPlanar:		; convert $00 bytes of linear 4bpp tiles at [$0C] to SNES planar, in place
	ldx.b $00
	phb
	sep #$20
	lda.b $0E
	pha
	rep #$20
	plb
	stz.b $04
	lda.w #$FFFE
	sta.b $06
	lda.b $00
	lsr a
	lsr a
	sta.b $00
	bra CODE_9B85E8
CODE_9B85DC:
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	beq CODE_9B8637
	tax
	iny
	iny
	bra CODE_9B85F4
CODE_9B85E8:
	ldx.w #$0080
	stz.b $14
	stz.b $16
	lda.b $04
	asl a
	asl a
	tay
CODE_9B85F4:
	lda.b ($0C),y
	beq CODE_9B85DC
	xba
	tay
CODE_9B85FA:
	tya
	asl a
	bcc CODE_9B8603
	tay
	txa
	tsb.b $15
	tya
CODE_9B8603:
	asl a
	bcc CODE_9B860B
	tay
	txa
	tsb.b $14
	tya
CODE_9B860B:
	asl a
	bcc CODE_9B8613
	tay
	txa
	tsb.b $17
	tya
CODE_9B8613:
	asl a
	bcc CODE_9B861B
	tay
	txa
	tsb.b $16
	tya
CODE_9B861B:
	tay
	txa
	lsr a
	tax
	cpx.w #$0010
	bcs CODE_9B85FA
	cpx.w #$0000
	beq CODE_9B8637
	cpx.w #$0008
	bcc CODE_9B85FA
	lda.b $04
	asl a
	asl a
	tay
	iny
	iny
	bra CODE_9B85F4
CODE_9B8637:
	lda.b $06
	inc a
	inc a
	tay
	and.w #$0010
	beq CODE_9B8647
	tya
	clc
	adc.w #$0010
	tay
CODE_9B8647:
	sty.b $06
	lda.b $16
	sta.b ($10),y
	tya
	clc
	adc.w #$0010
	tay
	lda.b $14
	sta.b ($10),y
	inc.b $04
	dec.b $00
	bpl CODE_9B85E8
	plb
	rtl
CODE_9B865F:
	phx
	pha
	ldx.w $0AC6
CODE_9B8664:
	lda.w JoyPad,x
	bne CODE_9B8664
	pla
	plx
	rtl
CODE_9B866C:
	phx
	pha
CODE_9B866E:
	ldx.w #$0008
CODE_9B8671:
	lda.w $1C84,x
	beq CODE_9B867B
	lda.w JoyPad,x
	bne CODE_9B866E
CODE_9B867B:
	dex
	dex
	bpl CODE_9B8671
	pla
	plx
	rtl
CODE_9B8682:
	phx
	pha
CODE_9B8684:
	ldx.w #$0008
CODE_9B8687:
	lda.w JoyPad,x
	bit.w #$000F
	bne CODE_9B8694
	and.w #$FFF0
	bne CODE_9B8684
CODE_9B8694:
	dex
	dex
	bpl CODE_9B8687
	pla
	plx
	rtl
CODE_9B869B:
	jsl.l CODE_9DE0E9
	ldy.b $91
	lda.w $1796,y
	inc a
	sta.b $A5
	sta.w $0D43
	stz.w $0D47
	ldx.b $91
	lda.w $1C98,x
	sta.l $7E3454
	lda.w #$FFFF
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l CODE_9B890F
	lda.w #$0005
	sta.w $1D9F
	dec a
	sta.w $1D8B
	jsl.l CODE_9B8810
	lda.w #$0005
	ldx.w #$0068
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_9B86E5:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	beq CODE_9B8711
	jsr.w $8A15
	cmp.w #$0000
	beq CODE_9B870B
	jmp.w $8860
CODE_9B870B:
	jsl.l CODE_9B8810
	bra CODE_9B86E5
CODE_9B8711:
	bit.w #$8080
	bne CODE_9B8719
	jmp.w $8792
CODE_9B8719:
	jsl.l CODE_9B8D86
	cmp.w #$0000
	bmi CODE_9B8725
	jsr.w $8C7A
CODE_9B8725:
	lda.w #$0001
	sta.l $7E3468
	jsl.l CODE_9B8810
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFDB
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	sta.b $A5
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B8861
	sta.b $8D
	lda.l $7E34C6
	bne CODE_9B8769
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b $8D
CODE_9B8769:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DD923
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jmp.w $880D
CODE_9B8792:
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9B87C9
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9B87C9
	bit.w #$0400
	bne CODE_9B87B2
	inc.b $A5
	inc.b $A5
	bit.w #$0800
	beq CODE_9B880D
CODE_9B87B2:
	lda.b $A5
	clc
	adc.w $1D8B
	bmi CODE_9B880D
	cmp.w $1D9F
	bpl CODE_9B880D
	sta.w $1D8B
	jsl.l CODE_9B8810
	jmp.w $880D
CODE_9B87C9:
	lda.l $7E34C6
	beq CODE_9B880D
	lda.b $A5
	clc
	adc.w $0D43
	dec a
	bmi CODE_9B880D
	cmp.w #$0007
	bcs CODE_9B880D
	inc a
	sta.w $0D43
	cmp.w #$0006
	bmi CODE_9B87FB
	lda.w $1D9F
	cmp.w #$0004
	beq CODE_9B8809
	dec.w $1D9F
	lda.w $1D8B
	beq CODE_9B8809
	dec.w $1D8B
	bra CODE_9B8809
CODE_9B87FB:
	lda.w $1D9F
	cmp.w #$0005
	beq CODE_9B8809
	inc.w $1D9F
	inc.w $1D8B
CODE_9B8809:
	jsl.l CODE_9B8810
CODE_9B880D:
	jmp.w $86E5
CODE_9B8810:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	sta.b $A5
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B8861
	sta.b $8D
	lda.l $7E34C6
	bne CODE_9B8849
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b $8D
CODE_9B8849:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	jsr.w $8B60
	rtl
CODE_9B8860:
	rtl
DATA8_9B8861:		; the line names: each entry is a word (the bytes to the next entry), then its text
	dw $0011 : db "    Goalies   ]"
	dw $0011 : db "   Scoring 1  ]"
	dw $0011 : db "[  Scoring 2  ]"
	dw $0011 : db "[  Checking   ]"
	dw $0011 : db "[ Pwr. Play 1 ]"
	dw $0011 : db "[ Pwr. Play 2 ]"
	dw $0011 : db "[ Pen. Kill 1 ]"
	dw $0011 : db "[ Pen. Kill 2  "
DATA8_9B88E9:		; as DATA8_9B8861, the list with Best Line
	dw $0003 : db " "
	dw $0011 : db "   Best Line   "
	dw $0003 : db " "
	dw $0003 : db " "
	dw $0003 : db " "
	dw $0003 : db " "
	dw $0003 : db " "
	dw $0003 : db " "
CODE_9B890F:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFEA
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
	jsl.l eraser
	jsl.l CODE_9B8970
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFEF
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0011
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	rtl
CODE_9B8970:
	lda.l $7E3468
	beq CODE_9B8979
	jsr.w Div16S_divneg
CODE_9B8979:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFF4
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF000
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1C98
	sta.b $A9
	lda.b $91
	beq CODE_9B89BC
CODE_9B89B4:
	lda.w $1C9A
	sta.b $A9
	lda.w #$0030
CODE_9B89BC:
	sta.b $A5
	jsl.l CODE_9FBE08
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq CODE_9B89E1
	jsl.l WaitFrame
	lda.w #$0068
	sta.w $1DEF
	lda.w #$0000
	sta.l $7E3468
CODE_9B89E1:
	jsl.l CODE_9DE0D4
	rtl
CODE_9B89E6:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF005
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0011
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	rts
CODE_9B8A15:
	jsr.w $89E6
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF00A
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF01D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	jsl.l CODE_9B865F
	lda.w #$0000
	sta.w $1D97
CODE_9B8A5A:
	lda.w #$0000
	cmp.w $1D97
	bne CODE_9B8A7E
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF037
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B8A98
CODE_9B8A7E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF03C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B8A98:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF041
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0001
	cmp.w $1D97
	bne CODE_9B8AD6
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF051
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9B8AF0
CODE_9B8AD6:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF056
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9B8AF0:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF05B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$9080
	bne CODE_9B8B42
	bit.w #$0400
	bne CODE_9B8B3A
	bit.w #$0800
	bne CODE_9B8B32
CODE_9B8B2F:
	jmp.w $8A5A
CODE_9B8B32:
	lda.w #$0000
	sta.w $1D97
	bra CODE_9B8B2F
CODE_9B8B3A:
	lda.w #$0001
	sta.w $1D97
	bra CODE_9B8B2F
CODE_9B8B42:
	lda.w $1D97
	cmp.w #$0000
	beq CODE_9B8B4C
	bra CODE_9B8B51
CODE_9B8B4C:
	lda.w #$FFFF
	bra CODE_9B8B5F
CODE_9B8B51:
	jsl.l CODE_9B9334
	jsr.w $89E6
	jsl.l CODE_9B890F
	lda.w #$0000
CODE_9B8B5F:
	rts
CODE_9B8B60:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF072
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
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF077
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b $A5
	dec a
	sta.b $A9
	lda.w #DATA8_9B8C6E
	sta.b $9D
	lda.w #$009B
	sta.b $9F
	lda.w #DATA8_9B8C6A
	sta.b $95
	lda.w #$009B
	sta.b $97
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_9B8BFD
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l CODE_9B9320
	sec
	adc.b $A5
	sta.b $95
	lda.w #DATA8_80D9B3
	sta.b $9D
	lda.w #$0080
	sta.b $9F
	lda.w #$0004
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_9B8BFD
	bmi CODE_9B8BF9
CODE_9B8BF5:
	bvc CODE_9B8BFB
	bra CODE_9B8BFD
CODE_9B8BF9:
	bvc CODE_9B8BFD
CODE_9B8BFB:
	dec.b $A9
CODE_9B8BFD:
	lda.w #$3800
	sta.w $0D0D
	lda.b $A9
	cmp.w $1D8B
	bne CODE_9B8C1A
	lda.w #$2000
	sta.w $0D0D
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.l $7E345A
CODE_9B8C1A:
	lda.w #$0005
	sta.w $0D0F
	lda.b $9D
	sta.b $8D
	lda.b $9F
	sta.b $8F
	jsl.l CODE_9EC7BE
	lda.b $8D
	sta.b $9D
	lda.b $8F
	sta.b $9F
	lda.w #$0008
	sta.w $0D0F
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC372
	jsl.l CODE_9EC7BE
	inc.b $95
	pla
	sta.b $8F
	pla
	sta.b $8D
	inc.w $0D11
	inc.w $0D11
	dec.b $A9
	bmi CODE_9B8C65
	jmp.w $8BFD
CODE_9B8C65:
	jsl.l CODE_9B8970
	rts
DATA8_9B8C6A:
	db $01,$02,$03,$04
DATA8_9B8C6E:		; entries as DATA8_9B8861
	dw $0003 : db "G"
	dw $0003 : db "G"
	dw $0003 : db "G"
	dw $0003 : db "G"
CODE_9B8C7A:
	sta.w $1D8F
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l CODE_9B9320
	sec
	adc.b $A5
	sta.b $A5
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0001
	beq CODE_9B8D0E
	cmp.w #$0002
	beq CODE_9B8CFD
	cmp.w #$0003
	beq CODE_9B8CE1
	cmp.w #$0004
	beq CODE_9B8CC4
	lda.b $A5
	inc a
	inc a
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CBD
	jsr.w $8D4D
	bra CODE_9B8D20
CODE_9B8CBD:
	lda.b $A5
	inc a
	inc a
	inc a
	bra CODE_9B8CFF
CODE_9B8CC4:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CDB
	dec.b $95
	jsr.w $8D32
	bra CODE_9B8D20
CODE_9B8CDB:
	lda.b $A5
	inc a
	inc a
	bra CODE_9B8CFF
CODE_9B8CE1:
	lda.b $A5
	clc
	adc.w #$0004
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8CF6
	jsr.w $8D4D
	bra CODE_9B8D20
CODE_9B8CF6:
	lda.b $A5
	inc a
	inc a
	inc a
	bra CODE_9B8D11
CODE_9B8CFD:
	lda.b $A5
CODE_9B8CFF:
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	jsr.w $8D32
	bra CODE_9B8D20
CODE_9B8D0E:
	lda.b $A5
	inc a
CODE_9B8D11:
	sta.b $95
	jsr.w CODE_808D72
	cmp.w $1D8F
	bne CODE_9B8D20
	dec.b $95
	jsr.w $8D32
CODE_9B8D20:
	lda.b $A5
	clc
	adc.w $1D9F
	sbc.w $1D8B
	sta.b $95
	lda.w $1D8F
	jsr.w $8D7C
	rts
CODE_9B8D32:
	jsr.w CODE_808D72
	sta.w $1D93
	inc.b $95
	jsr.w CODE_808D72
	dec.b $95
	jsr.w $8D7C
	inc.b $95
	lda.w $1D93
	jsr.w $8D7C
	dec.b $95
	rts
CODE_9B8D4D:
	lda.b $A5
CODE_9B8D4F:
	inc a
	inc a
	sta.b $95
	jsr.w CODE_808D72
	sta.w $1D93
	inc.b $95
	inc.b $95
	jsr.w CODE_808D72
	dec.b $95
	dec.b $95
	jsr.w $8D7C
	inc.b $95
	inc.b $95
	lda.w $1D93
	jsr.w $8D7C
	rts
CODE_9B8D72:
	sep #$20
	lda.b [$95]
	rep #$20
	and.w #$00FF
	rts
CODE_9B8D7C:
	and.w #$00FF
	sep #$20
	sta.b [$95]
	rep #$20
	rts
CODE_9B8D86:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF07C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l SpriteFrameStart
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
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
	jsl.l WaitFrame
	jsl.l CODE_808E2D
	jsl.l CODE_9DD938
	jsl.l CODE_9DD962
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0003
	bpl CODE_9B8E3D
	jsl.l CODE_9B9300
	lda.b $A5
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b $A5
	sta.w $1DAB
	jsl.l CODE_9B92DC
	lda.w $1DAB
	clc
	adc.b $A5
	sta.w $1DAB
	bra CODE_9B8E4F
CODE_9B8E3D:
	jsl.l CODE_9B92DC
	lda.b $A5
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b $A5
	sta.w $1DAB
CODE_9B8E4F:
	sta.w $1DA7
	lda.w #$0009
	cmp.w $1DA3
	beq CODE_9B8E5F
	bmi CODE_9B8E5F
	lda.w $1DA3
CODE_9B8E5F:
	sta.w $1DAF
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	jsl.l CODE_9B9320
	lda.b $95
	clc
	adc.b $A5
	clc
	adc.w $1D9F
	sec
	sbc.w $1D8B
	sta.b $95
	jsr.w CODE_808D72
	sta.w $1D9B
	lda.w $1DAF
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl CODE_9B8EAA
	lda.w $1D9B
	sec
	sbc.w $1DAF
	sec
	sbc.w $1DA7
	bmi CODE_9B8EA5
	clc
	adc.w $1DA7
	sta.w $1DA7
CODE_9B8EA5:
	lda.w #$0000
	bra CODE_9B8EB5
CODE_9B8EAA:
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
CODE_9B8EB5:
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8EBC:
	jsl.l CODE_9DD923
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	beq CODE_9B8EE1
	lda.w #$FFFF
	jmp.w $91A1
CODE_9B8EE1:
	bit.w #$8080
	beq CODE_9B8EF4
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
	jmp.w $91A1
CODE_9B8EF4:
	stz.b $A5
	inc.b $A5
	bit.w #$0100
	bne CODE_9B8F2B
	dec.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9B8F2B
	bit.w #$0400
	bne CODE_9B8F14
	inc.b $A5
	inc.b $A5
	bit.w #$0800
	beq CODE_9B8F28
CODE_9B8F14:
	lda.b $A5
	clc
	adc.w $1D9B
	bmi CODE_9B8F3E
	cmp.w $1DAF
	bpl CODE_9B8F5D
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8F28:
	jmp.w $8EBC
CODE_9B8F2B:
	lda.b $A5
	clc
	adc.w $0D47
	sta.b $A5
	bmi CODE_9B8F28
	sta.w $0D47
	jsl.l CODE_9B8F7B
	bra CODE_9B8F28
CODE_9B8F3E:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl CODE_9B8F28
	inc.w $1DA7
	jsl.l CODE_9B8F7B
	lda.w #$FFFF
	sta.w $07E0
	bra CODE_9B8F28
CODE_9B8F5D:
	lda.w $1DA7
	cmp.w $1DAB
	beq CODE_9B8F28
	dec.w $1DA7
	jsl.l CODE_9B8F7B
	lda.w #$FFFF
	sta.w $07E0
	lda.w #$FFFF
	sta.w $07D8
	jmp.w $8F28
CODE_9B8F7B:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF081
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
	jsl.l eraser
	lda.w #$0011
	sta.w $0D0F
	lda.w #$0002
	sta.w $0D11
CODE_9B8FB5:
	lda.w #DATA8_9B906F
	sta.b $8D
	lda.w #$009B
	sta.b $8F
	lda.w $0D47
	sta.b $A5
	lda.w $0D43
	bne CODE_9B8FDF
	lda.w #$D8CD
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	bra CODE_9B8FDF
CODE_9B8FD5:
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
CODE_9B8FDF:
	lda.b [$8D]
	bmi CODE_9B8FE7
	dec.b $A5
	bpl CODE_9B8FD5
CODE_9B8FE7:
	lda.b [$8D]
	bpl CODE_9B8FF0
	dec.w $0D47
	bra CODE_9B8FB5
CODE_9B8FF0:
	lda.w #$3800
	sta.w $0D0D
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
