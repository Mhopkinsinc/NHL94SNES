; Bank $9D, third 4 KB: screen code, with auto labels for now: the line editor (DATA8_9DA05D holds the line names,
; Goalies to Pen. Kill 2), more menu code, and the Game Setup screen. DATA8_9DACED holds its option texts (Regular
; Season, Cont. Playoffs ... Automatic, Manual) and setting names (Play Mode, Home, Visitor, Period, Penalties, Line
; Changes, Goalie); DATA8_9DAC7F, DATA8_9DACD1 and DATA8_9DACDF are tables of words its code reads.

org $9DA000
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
	lda.w #$0004
	sta.w $0D0F
	lda.b [$95]
	inc.b $95
	and.w #$00FF
	dec a
	sta.b $A5
	sta.b $04
	stz.b $08
	jsl.l CODE_9ED300
	lda.b $04
	cmp.b $A5
	bpl CODE_9DA03A
	lda.w #$0010
	sta.b $08
CODE_9DA03A:
	lda.b $04
	sta.b $A5
	jsl.l CODE_9F9745
	inc.w $0D11
	inc.w $0D11
	dec.b $A9
	bpl CODE_9D9FFD
CODE_9DA04C:
	rtl
DATA8_9DA04D:
	db $01,$02,$03,$04
DATA8_9DA051:
	dw $0003 : db "G"
	dw $0003 : db "G"
	dw $0003 : db "G"
	dw $0003 : db "G"
DATA8_9DA05D:		; the line names: a word (2 + the text), then the text
	dw $000F : db "  Goalies   }"
	dw $000F : db "{Scoring  1 }"
	dw $000F : db "{Scoring  2 }"
	dw $000F : db "{ Checking  }"
	dw $000F : db "{Pwr. Play 1}"
	dw $000F : db "{Pwr. Play 2}"
	dw $000F : db "{Pen. Kill 1}"
	dw $000F : db "{Pen. Kill 2 "
CODE_9DA0D5:
	stz.w $1C84
	stz.w $1C86
	stz.w $1C88
	stz.w $1C8A
	stz.w $1C8C
	lda.l $7E34CC
	bne CODE_9DA0EB
	rtl
CODE_9DA0EB:
	lda.w #$FFFF
	sta.w $0AD7
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	sep #$20
	lda.b #$09
	sta.w BGMODE
	lda.b #$08
	sta.w BG3SC
	lda.b #$04
	sta.w BG34NBA
	lda.b #$17
	sta.w TM
	rep #$20
	lda.w #$FFFC
	sta.w $07E0
	lda.w #$007E
	sta.b $12
	lda.w #$A676
	sta.b $10
	lda.w #$0000
	ldx.w #$0800
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $0E
	lda.w #$A676
	sta.b $0C
	lda.w #$0000
	ldx.w #$0800
	ldy.w #$0800
	jsl.l CODE_80891F
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
	stz.b $A9
	stz.b $AB
	lda.l $7E34BC
	cmp.w #$0001
	bcc CODE_9DA184
	cmp.w #$0004
	bcs CODE_9DA184
	lda.w #$0001
	sta.w $1C84
	jsl.l CODE_9D995D
	lda.w $1C84
	dec a
	beq CODE_9DA180
	lda.w $1C9A
	sta.w $1C98
CODE_9DA180:
	dec.b $A9
	inc.b $AB
CODE_9DA184:
	lda.w #$0001
	sta.w $1C84
CODE_9DA18A:
	lda.b $A9
	pha
	jsl.l CODE_9DB0FD
	jsr.w $AF5B
	ldx.w #$0000
	lda.w #$0000
CODE_9DA19A:
	sta.l $7E4EF4,x
	inx
	inx
	cpx.w #$0290
	bcc CODE_9DA19A
	lda.w #$FFFF
	sta.l $7E3460
	lda.w #$0001
	sta.w $0D0F
	lda.w #$000A
	sta.w $0D11
	lda.w $1C9A
	sta.b $A9
	lda.b $AB
	pha
	bne CODE_9DA1C5
	jsr.w $AE6D
CODE_9DA1C5:
	pla
	sta.b $AB
	lda.w #$0016
	sta.w $0D0F
	lda.w $1C98
	sta.b $A9
	jsr.w $AE6D
	jsr.w $B0AB
	jsl.l CODE_9DD923
	pla
	sta.b $A9
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACEB6
	sta.b $0C
	ldy.w #$0090
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.b $AB
	beq CODE_9DA22E
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF481
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
	lda.w #DATA8_9CF489
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9DA264
CODE_9DA22E:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF495
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
	lda.w #DATA8_9CF49D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9DA264
CODE_9DA264:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4A9
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
	lda.w #DATA8_9CF4C3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9DA29C:
	jsl.l WaitFrame
	ldx.w $1A0E
	txa
	eor.b $AD
	bne CODE_9DA2AB
	jmp.w $A2E6
CODE_9DA2AB:
	stx.b $AD
	txa
	beq CODE_9DA2DF
	bit.w #$0001
	bne CODE_9DA2C1
	bit.w #$0002
	bne CODE_9DA2CB
	bit.w #$0004
	bne CODE_9DA2D5
	bra CODE_9DA2E6
CODE_9DA2C1:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DAFB2
	bra CODE_9DA2E6
CODE_9DA2CB:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DB005
	bra CODE_9DA2E6
CODE_9DA2D5:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DB058
	bra CODE_9DA2E6
CODE_9DA2DF:
	jsl.l Multi5Init
	jmp.w $A18A
CODE_9DA2E6:
	lda.w $1A0E
	beq CODE_9DA2EE
	jmp.w $A29C
CODE_9DA2EE:
	jsl.l CODE_9B8017
	ldx.w #$0000
CODE_9DA2F5:
	lda.w $1A0E
	bne CODE_9DA302
	lda.w $0776,x
	and.w #$000F
	beq CODE_9DA30B
CODE_9DA302:
	lda.w #$0000
	sta.w $1C84,x
	jmp.w $A486
CODE_9DA30B:
	lda.w $0AB8,x
	bit.w #$1000
	bne CODE_9DA316
	jmp.w $A44B
CODE_9DA316:
	lda.b $AB
	beq CODE_9DA333
	ldx.w #$0000
	lda.w #$0000
CODE_9DA320:
	ora.w $1C84,x
	inx
	inx
	cpx.w #$000A
	bcc CODE_9DA320
	bit.w #$0001
	beq CODE_9DA363
	jsl.l CODE_9D995D
CODE_9DA333:
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA35F
	ldx.w #$0005
CODE_9DA33F:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq CODE_9DA35C
	sta.b $14
	txa
	dec a
	sta.b $16
CODE_9DA34D:
	lda.b $16
	asl a
	tay
	lda.w $1C84,y
	cmp.b $14
	beq CODE_9DA3A1
	dec.b $16
	bpl CODE_9DA34D
CODE_9DA35C:
	dex
	bne CODE_9DA33F
CODE_9DA35F:
	stz.w $0AD7
	rtl
CODE_9DA363:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4DD
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
	lda.w #DATA8_9CF4FA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	jsl.l CODE_9B8682
	bra CODE_9DA3DD
CODE_9DA3A1:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF515
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
	lda.w #DATA8_9CF532
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	jsl.l CODE_9B8682
CODE_9DA3DD:
	jsl.l CODE_9B8017
	ldx.w #$0008
CODE_9DA3E4:
	lda.w $1A0E
	bne CODE_9DA3F6
	lda.w $0776,x
	bit.w #$000F
	bne CODE_9DA3F6
	and.w #$FFF0
	bne CODE_9DA3FC
CODE_9DA3F6:
	dex
	dex
	bpl CODE_9DA3E4
	bra CODE_9DA3DD
CODE_9DA3FC:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF54E
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
	lda.w #DATA8_9CF56B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9DA434:
	ldx.w #$0008
CODE_9DA437:
	lda.w $0776,x
	bit.w #$000F
	bne CODE_9DA444
	bit.w #$1000
	bne CODE_9DA434
CODE_9DA444:
	dex
	dex
	bpl CODE_9DA437
	jmp.w $A29C
CODE_9DA44B:
	bit.w #$0200
	beq CODE_9DA46E
	lda.w $1C84,x
	beq CODE_9DA462
	cmp.w #$0001
	bne CODE_9DA486
CODE_9DA45A:
	lda.w #$0000
	sta.w $1C84,x
	bra CODE_9DA486
CODE_9DA462:
	lda.b $AB
	bne CODE_9DA486
	lda.w #$0002
	sta.w $1C84,x
	bra CODE_9DA486
CODE_9DA46E:
	bit.w #$0100
	beq CODE_9DA486
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9DA486
	cmp.w #$0002
	beq CODE_9DA45A
	lda.w #$0001
	sta.w $1C84,x
CODE_9DA486:
	inx
	inx
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA496
	cpx.w #$0004
	bcs CODE_9DA49E
CODE_9DA496:
	cpx.w #$000A
	bcs CODE_9DA49E
	jmp.w $A2F5
CODE_9DA49E:
	jsl.l SpriteFrameStart
	lda.w $1C9A
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	lda.b $AB
	beq CODE_9DA4BB
	lda.w #$001C
	sta.l $7E3454
CODE_9DA4BB:
	ldx.w #$0047
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF588
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l CODE_9DE0D4
	lda.b $10
	pha
	lda.b $12
	pha
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
CODE_9DA4EA:
	phy
	lda.w $1A0E
	bne CODE_9DA549
	lda.w $0776,y
	and.w #$000F
	bne CODE_9DA549
	tya
	lsr a
	clc
	adc.w #$0185
	sta.b $00
	lda.b $AB
	asl a
	asl a
	clc
	adc.w $1C84,y
	asl a
	tax
	lda.l DATA8_9DA570,x
	pha
	tyx
	lda.l DATA8_9DA580,x
	tay
	plx
	lda.w #$2600
	jsl.l DrawSprite
	ply
	phy
	tya
	lsr a
	clc
	adc.w #$01B1
	sta.b $00
	lda.b $AB
	asl a
	asl a
	clc
	adc.w $1C84,y
	asl a
	tax
	lda.l DATA8_9DA570,x
	pha
	tyx
	lda.l DATA8_9DA580,x
	tay
	plx
	dey
	dey
	dex
	dex
	dex
	lda.w #$2000
	jsl.l DrawSprite
CODE_9DA549:
	ply
	iny
	iny
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9DA55A
	cpy.w #$0004
	bcs CODE_9DA55F
CODE_9DA55A:
	cpy.w #$000A
	bcc CODE_9DA4EA
CODE_9DA55F:
	pla
	sta.b $12
	pla
	sta.b $10
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jmp.w $A29C
DATA8_9DA570:
	dw $0080,$00D0,$0030,$0000,$0030,$00D0,$009C,$0000
DATA8_9DA580:
	dw $0068,$007C,$0090,$00A4,$00B8,$0100,$0100,$0100
	dw $0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100
	dw $0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100
	dw $0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100
	dw $0100,$0100,$0100,$0100,$0100
CODE_9DA5CA:
	jsl.l CODE_9F96F7
	lda.w #$0001
	sta.l $7E3474
	lda.w #$0000
	sta.l $7E3478
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0001
	sta.l $7E3460
	sta.l $7E3458
	sta.l $7E3456
	lda.w #$0005
	sta.l $7E345E
	jsl.l CODE_8086A9
	jsl.l CODE_9DD977
	jsl.l CODE_9DE074
	lda.l $7E34BE
	sta.w $1C98
	lda.l $7E34C0
	sta.w $1C9A
	jsl.l setteams
	lda.w $1C9A
	clc
	adc.w #$0021
	sta.l $7E3454
	lda.w $1C98
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	sep #$20
	lda.b #$01
	sta.w BGMODE
	rep #$20
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF597
	sta.b $8D
	jsl.l CODE_9C936C
	lda.w #$1D47
	sta.l $7F750A
	lda.w #$FFFF
	sta.l $7F750E
	lda.w #$14A5
	sta.l $7F7682
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l CODE_9DE0D4
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DD923
	jsl.l CODE_9B8017
	jsl.l CODE_9B8526
	lda.w #$0000
	sta.w $0CCB
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5A3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9CA227
	lda.w #$0028
	sta.w $0E43
	sta.w $0E4F
	lda.w #$FFFF
	sta.l $7E34CC
	lda.b $91
	pha
	lda.w #$0000
	sta.b $91
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b $91
	jsl.l CODE_9B9334
	pla
	sta.b $91
	stz.b $C1
	stz.b $A5
	jsr.w $AC4F
	jsr.w $A973
	jsr.w $AA83
	jsl.l CODE_9B8017
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0008
	ldx.w #$0040
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DD923
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
CODE_9DA6FF:
	lda.w #$12C0
	sta.b $BD
CODE_9DA704:
	jsl.l WaitFrame
	lda.w $0766
	bne CODE_9DA704
	inc.w $0792
	bne CODE_9DA715
	inc.w $0794
CODE_9DA715:
	jsl.l WaitFrame
	ldx.w $1A0E
	txa
	eor.b $AF
	bne CODE_9DA724
	jmp.w $A768
CODE_9DA724:
	stx.b $AF
	txa
	beq CODE_9DA758
	bit.w #$0001
	bne CODE_9DA73A
	bit.w #$0002
	bne CODE_9DA744
	bit.w #$0004
	bne CODE_9DA74E
	bra CODE_9DA768
CODE_9DA73A:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DAFB2
	bra CODE_9DA768
CODE_9DA744:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DB005
	bra CODE_9DA768
CODE_9DA74E:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DB058
	bra CODE_9DA768
CODE_9DA758:
	jsl.l Multi5Init
	jsl.l CODE_9DB0FD
	jsr.w $A973
	stz.b $A9
	jmp.w $A869
CODE_9DA768:
	lda.w $1A0E
	beq CODE_9DA770
	jmp.w $A704
CODE_9DA770:
	jsl.l CODE_9B8017
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	jsl.l CODE_9B84F5
	dec.w $0AC4
	jsl.l CODE_9B852C
	lda.b $A9
	and.w #$FFF0
	sta.b $A9
	beq CODE_9DA793
	jmp.w $A869
CODE_9DA793:
	jsr.w $AA83
	jsl.l CODE_9FBF75
	dec.b $BD
	dec.b $BD
	bmi CODE_9DA7A3
	jmp.w $A704
CODE_9DA7A3:
	lda.w #$001C
	jsl.l CODE_9BB385
	sta.l $7E34BE
	sta.w $1C98
CODE_9DA7B1:
	lda.w #$001C
	jsl.l CODE_9BB385
	cmp.l $7E34BE
	beq CODE_9DA7B1
	sta.l $7E34C0
	sta.w $1C9A
	lda.w #$0000
	sta.l $7E34CC
	lda.w #$0000
	sta.l $7E34BC
	sta.l $7E34CA
CODE_9DA7D7:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AB610
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	jsl.l Decompress
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.w #$0000
	sta.l $7E3474
	lda.l $7E34BC
	cmp.w #$0002
	beq CODE_9DA81E
	cmp.w #$0003
	bne CODE_9DA822
CODE_9DA81E:
	jsl.l CODE_9D98D3
CODE_9DA822:
	lda.w #$0001
	sta.l $7E34CA
	lda.l $7E34BC
	cmp.w #$0001
	bcc CODE_9DA83E
	cmp.w #$0004
	bcs CODE_9DA83E
	lda.w #$0005
	sta.l $7E34CA
CODE_9DA83E:
	lda.l $7E34CA
	sec
	sbc.w #$0005
	sta.l $7E34CE
	lda.l $7E34BC
	cmp.w #$0001
	bne CODE_9DA857
	jsl.l CODE_9BC7FB
CODE_9DA857:
	lda.w #$0080
	ora.l $7E34F4
	sta.l $7E34F4
	jsl.l CODE_9D9783
	jmp.w $A0D5
CODE_9DA869:
	lda.b $A9
	bit.w #$1000
	beq CODE_9DA873
	jmp.w $A7D7
CODE_9DA873:
	bit.w #$0400
	beq CODE_9DA886
	lda.w #$0002
	sta.b $A5
	jsr.w $AC4F
	jsr.w $A973
	jmp.w $A6FF
CODE_9DA886:
	bit.w #$0800
	beq CODE_9DA899
	lda.w #$FFFE
	sta.b $A5
	jsr.w $AC4F
	jsr.w $A973
CODE_9DA896:
	jmp.w $A6FF
CODE_9DA899:
	lda.w #$0001
	sta.b $AD
	lda.b $A9
	bit.w #$0100
	bne CODE_9DA8AF
	bit.w #$0200
	beq CODE_9DA896
	lda.w #$FFFF
	sta.b $AD
CODE_9DA8AF:
	jsr.w $A8B8
	jsr.w $A973
	jmp.w $A6FF
CODE_9DA8B8:
	lda.b $C1
	cmp.w #$0000
	beq CODE_9DA8C9
	cmp.w #$0002
	beq CODE_9DA8C9
	cmp.w #$0004
	bne CODE_9DA8DF
CODE_9DA8C9:
	lda.b $AD
	beq CODE_9DA8DF
	lda.w #$0005
	sta.l $7E345E
	lda.w #$0001
	sta.l $7E3456
	sta.l $7E3458
CODE_9DA8DF:
	lda.w #$007E
	sta.b $93
	lda.w #$34BC
	sta.b $91
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DACD1
	sta.b $95
	stz.b $B9
	ldy.b $C1
	lda.b [$95],y
	sta.b $B5
	lda.b [$91],y
	sta.b $B1
	lda.l $7E34BC
	cmp.w #$0002
	bcc CODE_9DA917
	cmp.w #$0004
	beq CODE_9DA917
	cpy.w #$0002
	bne CODE_9DA917
	lda.w #$001A
	sta.b $B5
CODE_9DA917:
	jsr.w $A921
	lda.b $B1
	sta.b [$91],y
	lda.b $AD
CODE_9DA920:
	rts
CODE_9DA921:
	lda.b $B1
	clc
	adc.b $AD
	sta.b $B1
	sec
	sbc.b $B9
	bmi CODE_9DA931
	bvs CODE_9DA933
	bra CODE_9DA938
CODE_9DA931:
	bvs CODE_9DA938
CODE_9DA933:
	lda.b $B5
	dec a
	sta.b $B1
CODE_9DA938:
	lda.b $B1
	sec
	sbc.b $B5
	bmi CODE_9DA943
	bvc CODE_9DA945
	bra CODE_9DA920
CODE_9DA943:
	bvc CODE_9DA920
CODE_9DA945:
	lda.b $B9
	sta.b $B1
	rts
CODE_9DA94A:
	lda.b $B1
	clc
	adc.b $AD
	cmp.w #$0000
	beq CODE_9DA966
	cmp.w #$0003
	beq CODE_9DA966
	cmp.w #$0005
	beq CODE_9DA966
CODE_9DA95E:
	sta.b $B1
	lda.b $B1
	sta.b [$91],y
	bra CODE_9DA920
CODE_9DA966:
	inc a
	cmp.w #$0005
	bcc CODE_9DA95E
	lda.w #$0001
	sta.b $B1
	bra CODE_9DA95E
CODE_9DA973:
	lda.l $7E3456
	beq CODE_9DA992
	lda.l $7E34BE
	sta.w $1C98
	lda.l $7E34C0
	sta.w $1C9A
	jsl.l setteams
	lda.w #$0000
	sta.l $7E3456
CODE_9DA992:
	lda.l $7E35D0
	sta.b $AD
	lda.w #$0020
	sta.b $A5
	lda.w #$000E
	sta.b $A9
	lda.w #$000E
	sta.w $0D11
	stz.w $0D0F
	jsl.l CODE_9FBD9C
	lda.b $C1
	sta.b $BD
	lda.w #$000E
	sta.w $0D11
	stz.b $AD
	ldx.w #$0000
CODE_9DA9BE:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DADFD
	sta.b $8D
	stx.b $A5
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b $A5
	tax
	lda.l DATA8_9DAC7F,x
	ldx.b $A5
	cmp.w #$0000
	beq CODE_9DAA5A
	bpl CODE_9DA9F2
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DAE40
	sta.b $8D
CODE_9DA9F2:
	lda.w #$0003
	sta.w $0D0F
	txa
	lsr a
	sta.b $A5
	jsl.l CODE_9ECFC6
	lda.w #$0011
	sta.w $0D0F
	stx.b $C1
	jsr.w $A8B8
	txy
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b $89
	lda.b [$89],y
	sta.b $B1
	lda.w #$009D
	sta.b $8B
	lda.w #DATA8_9DACDF
	sta.b $89
	clc
	adc.b [$89],y
	sta.b $89
CODE_9DAA29:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	clc
	adc.b [$89]
	sta.b $89
	dec.b $B1
	bpl CODE_9DAA29
	cpx.b $BD
	bne CODE_9DAA44
	lda.w #$2000
	sta.w $0D0D
CODE_9DAA44:
	stx.b $C1
	cpx.w #$0002
	beq CODE_9DAA69
	cpx.w #$0004
	beq CODE_9DAA69
	jsl.l CODE_9EC7BE
CODE_9DAA54:
	inc.w $0D11
	inc.w $0D11
CODE_9DAA5A:
	inx
	inx
	cpx.w #$000E
	bcs CODE_9DAA64
	jmp.w $A9BE
CODE_9DAA64:
	lda.b $BD
	sta.b $C1
	rts
CODE_9DAA69:
	ldy.b $C1
	lda.w #$007E
	sta.b $8F
	lda.w #$34BC
	sta.b $8D
	lda.b [$8D],y
	sta.b $B1
	jsl.l CODE_9BC5AB
	jsl.l CODE_9EC7BE
	bra CODE_9DAA54
CODE_9DAA83:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.w #$0004
	tax
	lda.l DATA8_9DAC7F,x
	bne CODE_9DAAC5
	lda.w #$001C
	sta.l $7E3454
	lda.w #$0001
	sta.w $0D0F
	lda.w #$000A
	sta.w $0D11
	lda.w #$000A
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.w #$0001
	sta.l $7E3460
	bra CODE_9DAACC
CODE_9DAAC5:
	lda.w $1C9A
	sta.l $7E3454
CODE_9DAACC:
	dex
	dex
	lda.l DATA8_9DAC7F,x
	bne CODE_9DAB04
	lda.w #$001D
	sta.l $7E3452
	lda.w #$0016
	sta.w $0D0F
	lda.w #$000A
	sta.w $0D11
	lda.w #$000A
	sta.b $A5
	lda.w #$0002
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l CODE_9FBD9C
	lda.w #$0001
	sta.l $7E3460
	bra CODE_9DAB0B
CODE_9DAB04:
	lda.w $1C98
	sta.l $7E3452
CODE_9DAB0B:
	lda.l $7E3458
	dec a
	dec a
	sta.l $7E3458
	bmi CODE_9DAB18
	rts
CODE_9DAB18:
	jsl.l SpriteFrameStart
	jsr.w $ABC1
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5A8
	sta.b $8D
	jsl.l CODE_9C936C
	lda.l $7E3454
	cmp.w #$001C
	bpl CODE_9DAB51
	lda.w #$0001
	sta.w $0D0F
	lda.w #$000A
	sta.w $0D11
	lda.w $1C9A
	sta.b $A9
	jsl.l CODE_9FBE08
CODE_9DAB51:
	lda.l $7E3452
	cmp.w #$001C
	bpl CODE_9DAB6F
	lda.w #$0016
	sta.w $0D0F
	lda.w #$000A
	sta.w $0D11
	lda.w $1C98
	sta.b $A9
	jsl.l CODE_9FBE08
CODE_9DAB6F:
	lda.l $7E3452
	bpl CODE_9DAB90
	lda.w #$0000
	sta.b $8F
	lda.w #$0A5C
	sta.b $8D
	stz.b $91
	lda.w #$FFFF
	sta.b $A9
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
CODE_9DAB90:
	lda.l $7E3454
	bpl CODE_9DABB4
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b $91
	lda.w #$FFFF
	sta.b $A9
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
CODE_9DABB4:
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	rts
CODE_9DABC1:
	lda.w #$0078
	sta.l $7E3458
	lda.l $7E345E
	inc a
	cmp.w #$0007
	bcc CODE_9DABD5
	lda.w #$0000
CODE_9DABD5:
	sta.l $7E345E
	cmp.w #$0006
	beq CODE_9DAC21
	lda.l $7E3452
	cmp.w #$001C
	bpl CODE_9DABF4
	lda.w #$FFFF
	sta.l $7E3452
	ldx.w #$0000
	jsr.w $AC22
CODE_9DABF4:
	lda.l $7E3454
	cmp.w #$001C
	bpl CODE_9DAC0A
	lda.w #$FFFF
	sta.l $7E3454
	ldx.w #$0002
	jsr.w $AC22
CODE_9DAC0A:
	stz.b $91
	lda.l $7E345E
	sta.l $7E345A
	lda.w #$0002
	sta.b $91
	lda.l $7E345E
	sta.l $7E345C
CODE_9DAC21:
	rts
CODE_9DAC22:
	stx.b $91
	lda.l $7E345E
	jsl.l CODE_9DC973
	jsl.l CODE_9FC4D0
	cpx.w #$0000
	bne CODE_9DAC4E
	lda.b $8F
	sta.b $0E
	lda.b $8D
	sta.b $0C
	lda.w #$0000
	sta.b $12
	lda.w #$0A5C
	sta.b $10
	ldx.w #$0031
	jsl.l CODE_808F2F
CODE_9DAC4E:
	rts
CODE_9DAC4F:
	phx
	lda.b $C1
	sta.b $B1
CODE_9DAC54:
	lda.b $C1
	clc
	adc.b $A5
	sta.b $C1
	bpl CODE_9DAC5F
	stz.b $C1
CODE_9DAC5F:
	lda.b $C1
	cmp.w #$000E
	bcc CODE_9DAC6C
	lda.b $B1
	sta.b $C1
	bra CODE_9DAC7D
CODE_9DAC6C:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b $C1
	tax
	lda.l DATA8_9DAC7F,x
	beq CODE_9DAC54
CODE_9DAC7D:
	plx
	rts
DATA8_9DAC7F:
	dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0000
	dw $0001,$0000,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$FFFF,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$FFFF,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$0001,$0001,$0000,$0000,$0000,$0001,$0000
	dw $0000
DATA8_9DACD1:
	dw $0005,$001C,$001C,$0003,$0003,$0003,$0002
DATA8_9DACDF:
	dw $000E,$005E,$005E,$005E,$009E,$00CE,$00FE
DATA8_9DACED:		; Game Setup option texts: a word (2 + the text), then the text
	dw $0010 : db "Regular Season"
	dw $0010 : db "Cont. Playoffs"
	dw $0010 : db "New Playoffs  "
	dw $0010 : db "Best of 7     "
	dw $0010 : db "Shootout      "
	dw $0010 : db "5 Minutes     "
	dw $0010 : db "10 Minutes    "
	dw $0010 : db "20 Minutes    "
	dw $0010 : db "30 Seconds    "
	dw $0010 : db "Off           "
	dw $0010 : db "On            "
	dw $0010 : db "On, No Offside"
	dw $0010 : db "Off           "
	dw $0010 : db "On            "
	dw $0010 : db "Automatic     "
	dw $0010 : db "Automatic     "
	dw $0010 : db "Manual        "
DATA8_9DADFD:		; Game Setup setting names
	dw $000B : db "Play Mode"
	dw $0006 : db "Home"
	dw $0009 : db "Visitor"
	dw $0008 : db "Period"
	dw $000B : db "Penalties"
	dw $000E : db "Line Changes"
	dw $0008 : db "Goalie"
DATA8_9DAE40:
	dw $000B : db "Play Mode"
	dw $0006 : db "Team"
	dw $0005 : db "N/A"
	dw $0005 : db "N/A"
	dw $0005 : db "N/A"
	dw $0005 : db "N/A"
	dw $0008 : db "Goalie"
CODE_9DAE6D:
	lda.b $91
	pha
	phx
	lda.w #$0001
	sta.l $7E3466
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b $A9
	cmp.w $1C98
	bne CODE_9DAE96
	ldx.w #$1C00
	stx.b $14
	ldy.w #$0070
	lda.w #$0018
	sta.l $7E3466
CODE_9DAE96:
	lda.b $A9
	asl a
	asl a
	tax
	lda.l DATA8_9C850F+2,x
	sta.b $0E
	lda.l DATA8_9C850F,x
	sta.b $0C
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w $1C98
	cmp.w $1C9A
	bne CODE_9DAEC9
	lda.b $14
	cmp.w #$1800
	beq CODE_9DAEC9
	lda.w #$1800
	sta.b $14
	ldy.w #$0060
	lda.b $A9
	bra CODE_9DAE96
CODE_9DAEC9:
	lda.l $7E3460
	beq CODE_9DAF29
	ldy.w #$0000
	lda.w #$009A
	sta.b $93
	lda.w #$E9A3
	sta.b $91
	lda.w $0D11
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $0D0F
	asl a
	adc.w $0CD9
	tax
	lda.w #$0009
	sta.b $C5
	sta.b $C7
CODE_9DAEF3:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E37F4,x
	iny
	iny
	inx
	inx
	dec.b $C5
	bne CODE_9DAEF3
CODE_9DAF0E:
	lda.b [$91],y
	clc
	adc.l $7E35CE
	clc
	adc.l $7E35A8
	clc
	adc.b $14
	sta.l $7E3822,x
	iny
	iny
	inx
	inx
	dec.b $C7
	bne CODE_9DAF0E
CODE_9DAF29:
	lda.b $A9
	asl a
	tax
	lda.l TeamPlaceNames,x
	sta.b $0C
	lda.w #$009C
	sta.b $0E
	lda.w $0D0F
	pha
	lda.w #$005C
	sta.w $1D59
	lda.w #$9C76
	sta.w $1D5A
	lda.w #$009D
	sta.w $1D5C
	jsl.l CODE_9D9A5C
	pla
	sta.w $0D0F
	plx
	pla
	sta.b $91
	rts
CODE_9DAF5B:
	lda.w #$007E
	sta.b $12
	lda.w #$4EF5
	sta.b $10
	lda.w #$0000
	ldx.w #$0300
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $12
	lda.w #$A8FC
	sta.b $10
	ldx.w #$0080
	lda.w #$0000
	jsl.l CODE_808EDF
	rts
CODE_9DAF84:
	jsl.l CODE_9DB0FD
	jsl.l SpriteFrameStart
	ldx.w #$0047
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5B4
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
CODE_9DAFAD:
	jsl.l CODE_9DB0FD
	rtl
CODE_9DAFB2:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5C3
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
	lda.w #DATA8_9CF5E1
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
	lda.w #DATA8_9CF5FD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
