; Bank $9D, fifth 4 KB: screen code, with auto labels for now: the player card (DATA8_9DC29E: Forward, Defense, Goalie;
; DATA8_9DC436: the rating names in full, Status ... ) and the code around it, then PlayerPhotoTable: a long pointer to
; each player photo (the packed photos are in banks $85 to $9A), 26 per team in TeamList order; it continues in the
; next file.

org $9DC002
	beq CODE_9DC012
	bmi CODE_9DC012
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC29E
	sta.b $8D
	bra CODE_9DC01C
CODE_9DC012:
	lda.w #$009D
	sta.b $8F
	lda.w #$C2A7
	sta.b $8D
CODE_9DC01C:
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w $0D0F
	lda.w #$000D
	sta.w $0D11
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DC2FB
	ldx.w #$0038
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6C4
	sta.b $8D
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC436
	sta.b $8D
	lda.w $1E79
	sta.b $A5
	bmi CODE_9DC0BB
	jsl.l CODE_9ED323
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC436
	sta.b $8D
	lda.w $1E7D
	sta.b $A5
	bmi CODE_9DC0BB
	lda.w $1E7F
	cmp.w #$0050
	bmi CODE_9DC0BB
	jsl.l CODE_9ED323
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC436
	sta.b $8D
	lda.w $1E81
	sta.b $A5
	bmi CODE_9DC0BB
	lda.w $1E83
	cmp.w #$0050
	bmi CODE_9DC0BB
	jsl.l CODE_9ED323
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
CODE_9DC0BB:
	ldx.w #$0098
	ldy.w #$007A
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6D0
	sta.b $8D
	jsl.l CODE_9C9590
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	ldx.w #$00A0
	ldy.w #$0084
	jsl.l CODE_9C9590
	jmp.w $C208
CODE_9DC0EE:
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DCCBA
	lda.w #$0001
	sta.l $7E3464
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6E0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	ldy.b $91
	lda.w $1C98,y
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.w #$0000
	sta.l $7E3464
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w $1CDC,y
	sta.b $8D
	ldy.w #$0004
	clc
	adc.b [$8D],y
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w $0D0F
	lda.w #$0007
	sta.w $0D11
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w $0D0F
	lda.w #$0009
	sta.w $0D11
	jsl.l CODE_9EC7BE
	lda.w #$0060
	sta.w $0D11
	ldx.w #$0080
	ldy.w #$0004
	jsl.l CODE_9DC2B8
	lda.w $0D11
	clc
	adc.w #$0008
	sta.w $0D11
	ldx.w #$0040
	ldy.w #$0003
	jsl.l CODE_9DC2B8
	ldx.w #$00C0
	ldy.w #$0005
	jsl.l CODE_9DC2B8
	lda.w $0D11
	clc
	adc.w #$000E
	sta.w $0D11
	ldx.w #$0058
	ldy.w #$0001
	jsl.l CODE_9DC2B8
	ldx.w #$00A8
	ldy.w #$0002
	jsl.l CODE_9DC2B8
	lda.w $0D11
	clc
	adc.w #$000E
	sta.w $0D11
	ldx.w #$0080
	ldy.w #$0000
	jsl.l CODE_9DC2B8
	ldx.w #$0066
	ldy.w #$0098
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6E5
	sta.b $8D
	jsl.l CODE_9C9590
	jsl.l CODE_9D87B5
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	ldx.w #$0070
	ldy.w #$00A2
	jsl.l CODE_9C9590
CODE_9DC208:
	lda.w $1DB9
	beq CODE_9DC27C
	lda.w $1D9B
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.l $7E3470
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2000
	tay
	ldx.w #$0600
	jsl.l WaitFrame
	jsl.l CODE_80891F
	lda.w #$007F
	sta.b $0E
	lda.l $7E3472
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2300
	tay
	ldx.w #$0600
	jsl.l CODE_80891F
	jsl.l CODE_9DD923
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #$0400
	sta.w $079C
	ldx.w #$000C
	ldy.w #$0004
	jsl.l CODE_808ADF
	bra CODE_9DC280
CODE_9DC27C:
	jsl.l CODE_9DD94D
CODE_9DC280:
	jsl.l CODE_9DC2DE
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	rtl
DATA8_9DC298:
	db $00,$04,$03,$05,$01,$02
DATA8_9DC29E:		; a word (2 + the text), then the text
	dw $0009 : db "Forward"
	dw $0009 : db "Defense"
	dw $0008 : db "Goalie"
CODE_9DC2B8:
	lda.b [$95],y
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC4D0
	txa
	sta.b $A9
	lda.b [$8D]
	dec a
	dec a
	lsr a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $A9
	tax
	ldy.w $0D11
	jsl.l CODE_9C9590
	rtl
CODE_9DC2DE:
	ldx.w #$00CE
	lda.b $91
	bne CODE_9DC2E8
	ldx.w #$00EE
CODE_9DC2E8:
	lda.l $7F7500,x
	sta.l $7F759C
	inx
	inx
	lda.l $7F7500,x
	sta.l $7F759E
	rtl
CODE_9DC2FB:
	lda.w #$FFFF
	sta.w $1E79
	sta.w $1E7B
	sta.w $1E7D
	sta.w $1E7F
	sta.w $1E81
	sta.w $1E83
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0006
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0008
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000F
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000B
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0009
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000A
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000D
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000E
	sta.b $A9
	jsl.l CODE_9DC3DB
	rtl
CODE_9DC374:
	lda.w #$FFFF
	sta.w $1E79
	sta.w $1E7B
	sta.w $1E7D
	sta.w $1E7F
	sta.w $1E81
	sta.w $1E83
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0006
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	cmp.w #$0032
	bcc CODE_9DC3C8
	lda.w #$0008
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$0009
	sta.b $A9
	jsl.l CODE_9DC3DB
	bra CODE_9DC3DA
CODE_9DC3C8:
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9DC3DB
	lda.w #$000A
	sta.b $A9
	jsl.l CODE_9DC3DB
CODE_9DC3DA:
	rtl
CODE_9DC3DB:
	jsl.l CODE_9DC561
	lda.b $A5
	dec a
	cmp.w $1E7B
	bpl CODE_9DC3F3
	cmp.w $1E7F
	bpl CODE_9DC40F
	cmp.w $1E83
	bpl CODE_9DC42B
	bra CODE_9DC435
CODE_9DC3F3:
	lda.w $1E7B
	sta.b $00
	lda.w $1E79
	sta.b $04
	lda.b $A5
	sta.w $1E7B
	lda.b $A9
	sta.w $1E79
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9DC40F:
	lda.w $1E7F
	sta.b $00
	lda.w $1E7D
	sta.b $04
	lda.b $A5
	sta.w $1E7F
	lda.b $A9
	sta.w $1E7D
	lda.b $00
	sta.b $A5
	lda.b $04
	sta.b $A9
CODE_9DC42B:
	lda.b $A5
	sta.w $1E83
	lda.b $A9
	sta.w $1E81
CODE_9DC435:
	rtl
DATA8_9DC436:		; the rating names in full, as DATA8_9DC29E
	dw $0008 : db "Status"
	dw $0009 : db "Overall"
	dw $0008 : db "Energy"
	dw $0009 : db "Agility"
	dw $0007 : db "Speed"
	dw $000C : db "Handedness"
	dw $000B : db "Offensive"
	dw $000B : db "Defensive"
	dw $000C : db "Shot Power"
	dw $000F : db "Shot Accuracy"
	dw $0009 : db "Passing"
	dw $0010 : db "Stick Handling"
	dw $0008 : db "Weight"
	dw $000B : db "Endurance"
	dw $000C : db "Aggression"
	dw $000A : db "Checking"
	dw $000A : db "Fighting"
	dw $0008 : db "Status"
	dw $0009 : db "Overall"
	dw $0009 : db "Agility"
	dw $0007 : db "Speed"
	dw $000C : db "Glove hand"
	dw $0010 : db "Def. Awareness"
	dw $000E : db "Puck Control"
	dw $000C : db "Stick Side"
	dw $000C : db "Stick Side"
	dw $0007 : db "Glove"
	dw $0007 : db "Glove"
	dw $0008 : db "Weight"
CODE_9DC561:
	stx.b $87
	ldx.w #$0000
CODE_9DC566:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9DC566
	ldx.b $87
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D79B
	sta.b $8D
	stz.b $08
	jsl.l CODE_9ED300
	lda.w $1D9B
	cmp.b $A5
	bpl CODE_9DC5A4
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D8CD
	sta.b $8D
	lda.w #$0010
	sta.b $08
CODE_9DC5A4:
	phx
	ldx.b $A9
CODE_9DC5A7:
	dex
	bmi CODE_9DC5B6
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
	bra CODE_9DC5A7
CODE_9DC5B6:
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	plx
	lda.w $1D9B
	sta.b $A5
	lda.w #$0001
	sta.l $7E35F2
	jsl.l CODE_9F992E
	lda.b $A5
	sta.b $00
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	stx.b $87
	ldx.w #$0012
CODE_9DC5EE:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9DC5EE
	ldx.b $87
	lda.b $00
	sta.b $A5
	rtl
CODE_9DC5FC:
	stx.b $87
	ldx.w #$0000
CODE_9DC601:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9DC601
	ldx.b $87
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D79B
	sta.b $8D
	stz.b $08
	jsl.l CODE_9ED300
	lda.w $1D9B
	cmp.b $A5
	bpl CODE_9DC63F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D8CD
	sta.b $8D
	lda.w #$0010
	sta.b $08
CODE_9DC63F:
	phx
	ldx.b $A9
CODE_9DC642:
	dex
	bmi CODE_9DC651
	lda.b $8D
	clc
	adc.b [$8D]
	adc.w #$0004
	sta.b $8D
	bra CODE_9DC642
CODE_9DC651:
	lda.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	plx
	lda.w $1D9B
	sta.b $A5
	lda.w #$0000
	sta.l $7E35F2
	jsl.l CODE_9F992E
	lda.b $A5
	sta.b $00
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	stx.b $87
	ldx.w #$0012
CODE_9DC689:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9DC689
	ldx.b $87
	lda.b $00
	sta.b $A5
	rtl
CODE_9DC697:
	jsl.l CODE_9F96F7
	lda.w #$0081
	sta.b $0E
	lda.w #TeamLogoSprites
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$7800
	sta.b $10
	jsl.l Decompress
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	sep #$20
	lda.b #$00
	sta.w BG1SC
	lda.b #$04
	sta.w BG2SC
	lda.b #$12
	sta.w BG12NBA
	lda.b #$03
	sta.w OBSEL
	lda.b #$13
	sta.w TM
	rep #$30
	lda.w #$FF00
	sta.l $7E35AA
	sta.l $7E35A8
	stz.w $0CD9
	lda.w #$0000
	sta.l $7E35AC
	jsl.l CODE_9DD977
	jsl.l CODE_9DD992
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96A103
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	lda.l $7E35B6
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	sta.w VMADDL
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A5
	lda.w #$007F
	sta.b $8B
	lda.w #$0000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3D7
	sta.b $8D
	jsl.l CODE_9B854B
	lda.w #$009C
	sta.b $8B
	lda.w #DATA8_9C8000
	sta.b $89
	lda.w #$0080
	sta.b $8F
	lda.w #$D3E7
	sta.b $8D
	lda.w #$0004
	sta.b $A5
	jsl.l CODE_9B854B
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AC1F3
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35CE
	sec
	sbc.w #$0100
	sta.l $7E35D2
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.l $7E35CE
	asl a
	asl a
	asl a
	asl a
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	lda.w #$0000
	sta.l $7E35B2
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93B217
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	txa
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	adc.l $7E35B2
	sta.w $1E85
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.b $10
	sta.b $0C
	tax
	ldy.w #$1000
	jsl.l CODE_80891F
	lda.w #$0091
	sta.b $0E
	lda.w #DATA8_91DDAD
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
	ldy.w #$FFFF
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AEA15
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$7780
	sta.b $10
	jsl.l Decompress
	lda.l $7F7780
	asl a
	sta.b $14
	lda.l $7F7782
	tax
	lda.b $10
	clc
	adc.w #$0006
	sta.b $10
CODE_9DC83B:
	ldy.b $14
	dey
	dey
CODE_9DC83F:
	lda.b [$10],y
	clc
	adc.w $1E85
	clc
	adc.l $7E35AC
	clc
	adc.w #$1000
	sta.b [$10],y
	dey
	dey
	bpl CODE_9DC83F
	lda.b $10
	clc
	adc.b $14
	sta.b $10
	dex
	bne CODE_9DC83B
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96C61F
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
	lda.l $7E35B2
	clc
	adc.l $7E35AC
	clc
	adc.w #$1000
	jsl.l CODE_808E2D
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ADE57
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
	ldy.w #$0000
	ldx.w #$0040
	jsl.l CODE_9DE0BD
	sep #$20
	stz.w CGADD
	stz.w CGDATA
	stz.w CGDATA
	rep #$20
	lda.w #$0089
	sta.b $0E
	lda.w #DATA8_89FFC7
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
	ldy.w #$0040
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AD1B6
	sta.b $0C
	ldy.w #$0080
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$0000
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6F2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9DD94D
	ldx.w #$0000
	ldy.w #$0180
	lda.w #$6000
	jsl.l InitSprites
	jsl.l SpriteFrameStart
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	lda.w #$0004
	sta.w $07D6
	lda.w #$FFFB
	sta.w $07D8
	rtl
CODE_9DC973:
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC9A2
	sta.b $8D
	lda.b [$8D],y
	and.w #$00FF
	pha
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w $1CDC,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	ply
	lda.b [$8D],y
	and.w #$00FF
	dec a
	sta.b $A5
	rtl
DATA8_9DC9A2:
	db $04,$03,$05,$01,$02,$00
CODE_9DC9A8:
	sta.b $A5
	lda.l $7E3474
	beq CODE_9DC9B3
	jmp.w $CB9F
CODE_9DC9B3:
	phy
	phx
	lda.b $91
	beq CODE_9DC9C1
	lda.w #$2400
	sta.w $1E87
	bra CODE_9DC9C7
CODE_9DC9C1:
	lda.w #$3400
	sta.w $1E87
CODE_9DC9C7:
	lda.b $A5
	ldy.b $91
	sta.b $A5
	lda.w $1C98,y
	ldx.w #$001A
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	asl a
	asl a
	tax
	lda.l PlayerPhotoTable,x
	sta.b $0C
	lda.l PlayerPhotoTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $00
	lda.b $91
	beq CODE_9DCA08
	lda.w #$6900
	sta.b $10
	sta.l $7E3472
	bra CODE_9DCA11
CODE_9DCA08:
	lda.w #$6F00
	sta.b $10
	sta.l $7E3470
CODE_9DCA11:
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	jsl.l CODE_9DCB1C
	bne CODE_9DCA56
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b $91
	beq CODE_9DCA4E
	clc
	adc.w #$0030
CODE_9DCA4E:
	plx
	ply
	jsl.l CODE_808E2D
	bra CODE_9DCA85
CODE_9DCA56:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b $91
	beq CODE_9DCA7F
	clc
	adc.w #$0030
CODE_9DCA7F:
	plx
	ply
	jsl.l CODE_9DCAB7
CODE_9DCA85:
	ldy.b $91
	lda.w $1C98,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b $8D
	lda.w #$009D
	sta.b $8F
	lda.b [$8D]
	sta.b $0C
	inc.b $8D
	inc.b $8D
	lda.b [$8D]
	sta.b $0E
	lda.b $91
	beq CODE_9DCAAC
	ldy.w #$0010
	bra CODE_9DCAAF
CODE_9DCAAC:
	ldy.w #$0050
CODE_9DCAAF:
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	rtl
CODE_9DCAB7:
	sta.b $26
	lda.b $12
	sta.b $16
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $18
	iny
	iny
	lda.b [$0C],y
	sta.b $1A
	lda.b $0C
	clc
	adc.w #$0006
	sta.b $0C
CODE_9DCAE6:
	ldx.b $18
	ldy.w #$0000
CODE_9DCAEB:
	tya
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.b $18
	dec a
	asl a
	adc.b $10
	sta.b $14
	lda.b [$0C],y
	clc
	adc.b $26
	ora.w #$4000
	sta.b [$14]
	iny
	iny
	dex
	bne CODE_9DCAEB
	lda.b $24
	asl a
	adc.b $10
	sta.b $10
	lda.b $18
	asl a
	adc.b $0C
	sta.b $0C
	dec.b $1A
	bne CODE_9DCAE6
	rtl
CODE_9DCB1C:
	jsl.l CODE_9DCB72
	beq CODE_9DCB36
	jsl.l CODE_9DCB37
	sta.b $14
	jsl.l CODE_9DCB53
	bne CODE_9DCB31
	lda.b $14
	rtl
CODE_9DCB31:
	lda.b $14
	eor.w #$0001
CODE_9DCB36:
	rtl
CODE_9DCB37:
	jsl.l CODE_9DCB53
	bne CODE_9DCB44
	lda.w #$0005
	sta.b $A9
	bra CODE_9DCB49
CODE_9DCB44:
	lda.w #$0004
	sta.b $A9
CODE_9DCB49:
	jsl.l CODE_9DC561
	lda.b $A5
	and.w #$0001
	rtl
CODE_9DCB53:
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D79B
	sta.b $8D
	stz.b $08
	jsl.l CODE_9ED300
	lda.w $1D9B
	cmp.b $A5
	bpl CODE_9DCB6E
	lda.w #$0001
	rtl
CODE_9DCB6E:
	lda.w #$0000
	rtl
CODE_9DCB72:
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w $1CDC,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
	ldy.w #$0005
CODE_9DCB89:
	lda.b [$95],y
	and.w #$00FF
	dec a
	cmp.w $1D9B
	beq CODE_9DCB9B
	dey
	bpl CODE_9DCB89
	lda.w #$0001
	rtl
CODE_9DCB9B:
	lda.w #$0000
	rtl
CODE_9DCB9F:
	phy
	phx
	ldx.b $91
	jsl.l CODE_9DCC36
	lda.b $A5
	asl a
	tax
	lda.b $91
	beq CODE_9DCBC3
	lda.w #$2400
	sta.w $1E87
	lda.w #$2D00
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3472
	bra CODE_9DCBD5
CODE_9DCBC3:
	lda.w #$3400
	sta.w $1E87
	lda.w #$5100
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3470
CODE_9DCBD5:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b $91
	beq CODE_9DCBFE
	clc
	adc.w #$0030
CODE_9DCBFE:
	plx
	ply
	jsl.l CODE_808E2D
	ldy.b $91
	lda.w $1C98,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b $8D
	lda.w #$009D
	sta.b $8F
	lda.b [$8D]
	sta.b $0C
	inc.b $8D
	inc.b $8D
	lda.b [$8D]
	sta.b $0E
	lda.b $91
	beq CODE_9DCC2B
	ldy.w #$0010
	bra CODE_9DCC2E
CODE_9DCC2B:
	ldy.w #$0050
CODE_9DCC2E:
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	rtl
CODE_9DCC36:
	stx.b $91
	lda.w $1C98,x
	cmp.l $7E346C,x
	bne CODE_9DCC42
	rtl
CODE_9DCC42:
	lda.b $A5
	pha
	ldx.w #$000A
CODE_9DCC48:
	phx
	txa
	lsr a
	jsl.l CODE_9DC973
	ldx.b $91
	lda.w $1C98,x
	sta.l $7E346C,x
	ldx.w #$001A
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	asl a
	asl a
	tax
	lda.l PlayerPhotoTable,x
	sta.b $0C
	lda.l PlayerPhotoTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $00
	lda.b $01,s
	tax
	lda.b $91
	beq CODE_9DCC8D
	lda.w #$2D00
	bra CODE_9DCC90
CODE_9DCC8D:
	lda.w #$5100
CODE_9DCC90:
	clc
	adc.l DATA8_9DCCAE,x
	sta.b $10
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	plx
	dex
	dex
	bpl CODE_9DCC48
	pla
	sta.b $A5
	rtl
DATA8_9DCCAE:
	db $00,$00,$00,$06,$00,$0C,$00,$12,$00,$18,$00,$1E
CODE_9DCCBA:
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	stx.b $14
	tya
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.b $14
	asl a
	adc.b $10
	sta.b $10
	lda.w #$0006
	sta.b $14
CODE_9DCCD8:
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$000C
	jsl.l CODE_808EDF
	lda.b $10
	clc
	adc.w #$0040
	sta.b $10
	dec.b $14
	bne CODE_9DCCD8
	rtl
CODE_9DCCF5:
	sta.w $1DED
	stx.w $1DEF
	lda.w #$00C4
	sta.w $07D4
	lda.w #$CD0F
	ldx.w #$009D
	ldy.w $1DED
	jsl.l CODE_808520
	rtl
	sep #$20
	lda.b #$FC
	sta.w BG1HOFS
	lda.b #$FF
	sta.w BG1HOFS
	lda.b #$FB
	sta.w BG1VOFS
	lda.b #$FF
	sta.w BG1VOFS
	rep #$20
	lda.w #$CD34
	sta.w $078F
	lda.w $1DEF
	sta.w VTIMEL
	rtl
	sep #$20
	stz.w BG1HOFS
	stz.w BG1HOFS
	lda.b #$FF
	sta.w BG1VOFS
	sta.w BG1VOFS
	rep #$20
	lda.w #$CD0F
	sta.w $078F
	lda.w $1DED
	sta.w VTIMEL
	rtl
PlayerPhotoTable:	; per team (TeamList order) 26 long pointers to packed player photos
	dd DATA8_99AC36,DATA8_99C64E,DATA8_99E1E8,DATA8_979931,DATA8_9AB13D,DATA8_98BCF3,DATA8_8FFE74	; Anaheim
	dd DATA8_98D19D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_98CD0A,DATA8_8FFE74,DATA8_99BFD5
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8
	dd DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_97F28A,DATA8_99C64E,DATA8_98F814,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_98E3CD	; Boston
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_999867,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_998000,DATA8_99D102,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74
	dd DATA8_998D5D,DATA8_99C64E,DATA8_99C64E,DATA8_99B2C7,DATA8_989A18,DATA8_99E1E8,DATA8_8FFE74	; Buffalo
	dd DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_99C1FE,DATA8_8FFE74
	dd DATA8_9AB13D,DATA8_99E1E8,DATA8_98A5CD,DATA8_98B16A,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8
	dd DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_97BA0D,DATA8_99C64E,DATA8_99CCBA,DATA8_99E1E8,DATA8_8FFE74,DATA8_99AA05,DATA8_9AB13D	; Calgary
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_97EB52,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_978E95,DATA8_97E8E8,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74
	dd DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8
	dd DATA8_97A600,DATA8_99C64E,DATA8_98EA95,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_98A821	; Chicago
	dd DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_97CDF3,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74
	dd DATA8_9AB13D,DATA8_99E1E8,DATA8_99B4F7,DATA8_998B25,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8
	dd DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_96FD81,DATA8_99C64E,DATA8_97AD8B,DATA8_9A8C2C,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8	; Dallas
	dd DATA8_8FFE74,DATA8_9AB13D,DATA8_97F023,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8
	dd DATA8_8FFE74,DATA8_98ECD6,DATA8_98A120,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D
	dd DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74
	dd DATA8_98F5D7,DATA8_99C64E,DATA8_99C426,DATA8_90FDE2,DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8	; Detroit
	dd DATA8_8FFE74,DATA8_9AB13D,DATA8_99E1E8,DATA8_8FFE74,DATA8_9AB13D,DATA8_979BC5,DATA8_99E1E8
	dd DATA8_8FFE74,DATA8_9AB13D
