; Bank $9C, third 4 KB: game code with auto labels for now (DATA8_9CA2FB holds a 9-word record per object it sets up),
; then the team database. TeamList points to each team record; team number = index (Anaheim 0 ... Winnipeg 25, then the
; two all-star teams). A record starts with offsets to its parts (.0), then .sr (the scouting report), .sodds, the eight
; lines (.ls: the player number at each position), the players (.pld, the Player macro: name and 16 rating nibbles),
; and four Strings: city, abbreviation, nickname and arena. The records continue in the following files.

org $9CA002
	bpl CODE_9CA02D
	clc
	adc.w #$000B
	sta.w $0C27
	lda.w $0C25
	cmp.w #$0004
	beq CODE_9CA037
	lda.w $0C29
	inc a
	cmp.w #$0006
	bne CODE_9CA03D
	lda.w $0C25
	inc a
	sta.w $0C25
	cmp.w #$0004
	beq CODE_9CA040
	lda.w #$0002
	bra CODE_9CA03D
CODE_9CA02D:
	sta.w $0C27
	bra CODE_9CA040
CODE_9CA032:
	stz.w $0C23
	bra CODE_9CA04D
CODE_9CA037:
	lda.w $0C29
	dec a
	bmi CODE_9CA032
CODE_9CA03D:
	sta.w $0C29
CODE_9CA040:
	lda.w $0C23
	asl a
	asl a
	asl a
	adc.w $0C29
	sta.w $0C29
	rtl
CODE_9CA04D:
	lda.w #$FFFF
	sta.w $0C29
	rtl
CODE_9CA054:
	lda.w $0C29
	bmi CODE_9CA0B1
	lda.w sfhormode
	bne CODE_9CA0B1
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w $0C29
	lsr a
	lsr a
	lsr a
	tax
	lda.w $0C29
	and.w #$0007
	clc
	adc.l DATA8_9CA099-2,x
	sta.b $00
	lda.w $0D37
	sec
	sbc.l DATA8_9CA0A1-2,x
	tay
	lda.l DATA8_9CA0A9-2,x
	pha
	lda.w #$FFE2
	sec
	sbc.w $0CEB
	tax
	pla
	jsl.l DrawSprite
	bra CODE_9CA0B1
DATA8_9CA099:		; read with an index from 1, as DATA8_9CA0A1 and DATA8_9CA0A9
	dw $0394,$0394,$039A,$039A
DATA8_9CA0A1:
	dw $FF31,$FFB9,$FF31,$FFB9
DATA8_9CA0A9:
	dw $2000,$2200,$2000,$2200
CODE_9CA0B1:
	lda.w #$15C3
	sta.b $99
CODE_9CA0B6:
	lda.b ($99)
	and.w #$00FF
	tax
	lda.w #$0000
	cpx.w #$001C
	bne CODE_9CA0C7
	lda.w $0DF9
CODE_9CA0C7:
	cpx.w #$001E
	bne CODE_9CA0CF
	lda.w $0DFB
CODE_9CA0CF:
	sta.b $AD
	cpx.w #$0018
	bcs CODE_9CA107
	lda.l $7E34BC
	cmp.w #$0004
	bne CODE_9CA0E4
	lda.w position,x
	bmi CODE_9CA0FE
CODE_9CA0E4:
	lda.w $0D97,x
	cmp.w #$0170
	beq CODE_9CA0F1
	cmp.w #$0171
	bne CODE_9CA107
CODE_9CA0F1:
	lda.w sfhormode
	bne CODE_9CA101
	lda.w #$0171
	sta.w $0D97,x
	bra CODE_9CA107
CODE_9CA0FE:
	jmp.w $A186
CODE_9CA101:
	lda.w #$0170
	sta.w $0D97,x
CODE_9CA107:
	lda.w Xpos,x
	sta.b $A5
	lda.w Ypos,x
	sta.b $A9
	jsl.l CODE_9BC10F
	cmp.w #$4E20
	beq CODE_9CA186
	sta.w $0CD1
	lda.b $A5
	sta.w $0CCF
	lda.w $0D97,x
	sta.w $0E23,x
	bne CODE_9CA12F
	cpx.w #$0018
	bcs CODE_9CA186
CODE_9CA12F:
	sta.w $0CCD
	lda.w $0D97,x
	cmp.w #$0171
	beq CODE_9CA193
	cmp.w #$0380
	bcs CODE_9CA193
	lda.w $0E03,x
	and.w #$0800
	sta.w $0CC5
	lda.w $0E03,x
	and.w #$1000
	sta.w $0CD3
CODE_9CA151:
	lda.w $0E03,x
	ldx.w #$2000
	lsr a
	bcc CODE_9CA15D
	ldx.w #$2200
CODE_9CA15D:
	stx.w $0CC9
	jsl.l CODE_9BBFB9
	lda.w $0CCD
	cmp.w #$00D9
	bcc CODE_9CA186
	cmp.w #$00E9
	bcs CODE_9CA186
	adc.w #$0007
	sta.b $00
	lda.w $0CC9
	and.w #$F000
	ldx.w $0CCF
	ldy.w $0CD1
	jsl.l DrawSprite
CODE_9CA186:
	inc.b $99
	lda.b $99
	cmp.w #$15D3
	beq CODE_9CA192
	jmp.w $A0B6
CODE_9CA192:
	rtl
CODE_9CA193:
	stz.w $0CC5
	stz.w $0CD3
	bra CODE_9CA151
CODE_9CA19B:
	phx
	phy
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	ldx.w #$0000
	lda.w sfhormode
	bne CODE_9CA1C6
CODE_9CA1B7:
	lda.w Ypos,x
	sta.w $1583,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1B7
	bra CODE_9CA1D3
CODE_9CA1C6:
	lda.w Xpos,x
	sta.w $1583,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1C6
CODE_9CA1D3:
	stz.b $AD
	ldx.w #$0000
CODE_9CA1D8:
	lda.w $15C4,x
	and.w #$00FF
	sta.b $A9
	lda.w $15C3,x
	and.w #$00FF
	sta.b $A5
	tay
	lda.w $1583,y
	ldy.b $A9
	cmp.w $1583,y
	bmi CODE_9CA208
	beq CODE_9CA208
	lda.w $15C3,x
	xba
	sta.w $15C3,x
	txa
	sta.w $15A3,y
	inc a
	ldy.b $A5
	sta.w $15A3,y
	inc.b $AD
CODE_9CA208:
	inx
	cpx.w #$000F
	bne CODE_9CA1D8
	lda.b $AD
	bne CODE_9CA1D3
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ply
	plx
	rtl
CODE_9CA227:
	phb
	phk
	plb
	ldx.w #$0000
CODE_9CA22D:
	stz.w Xpos,x
	inx
	inx
	cpx.w #$076E
	bne CODE_9CA22D
	stz.b $BD
	stz.b $8D
	stz.b $91
	stz.b $95
	stz.b $99
	stz.w $0DF9
CODE_9CA244:
	ldx.b $91
	ldy.b $95
	lda.b $BD
	sta.w $1143,y
	lda.w #$FFFF
	sta.w $0E23,y
	sta.w pnum,y
	lda.w DATA8_9CA2FB,x
	sta.w Xpos,y
	lda.w DATA8_9CA2FB+2,x
	sta.w Ypos,y
	lda.w DATA8_9CA2FB+6,x
	sta.w $0D97,y
	lda.w DATA8_9CA2FB+8,x
	sta.w $0E03,y
	lda.w DATA8_9CA2FB+10,x
	sta.w $10C3,y
	lda.w DATA8_9CA2FB+12,x
	sta.w $10E3,y
	lda.b $BD
	asl a
	asl a
	asl a
	tay
	lda.w DATA8_9CA2FB+14,x
	sta.w $0F83,y
	ldy.b $95
	sta.w $0B7D,y
	lda.w DATA8_9CA2FB+16,x
	sta.w pflags,y
	lda.w #$0000
	sta.w $1563,y
	cpy.w #$001E
	bne CODE_9CA2A2
	lda.w #$0001
	sta.w $1563,y
CODE_9CA2A2:
	cpx.w #$006C
	rol a
	inc a
	and.w #$0001
	sta.w pfgoal,y
	cpx.w #$006C
	bcc CODE_9CA2BD
	cpx.w #$00D8
	bcs CODE_9CA2BD
	lda.w #$0034
	sta.w pfteam,y
CODE_9CA2BD:
	inc.b $95
	inc.b $95
	sep #$20
	lda.b $BD
	asl a
	ldy.b $8D
	sta.w $15C3,y
	inc.b $8D
	rep #$30
	ldy.b $99
	lda.b $BD
	sta.w $15A3,y
	inc.b $99
	inc.b $99
	inc.b $BD
	lda.b $91
	clc
	adc.w #$0012
	sta.b $91
	lda.b $BD
	cmp.w #$0010
	beq CODE_9CA2EE
	jmp.w $A244
CODE_9CA2EE:
	lda.w #$FFFF
	sta.w $0F5B
	sta.w $0F5D
	plb
	jmp.w $A19B
DATA8_9CA2FB:		; a record of 9 words per object, read by CODE_9CA244
	dw $0160,$00C0,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FF9C,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFB0,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFC4,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFD8,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $FF38,$FFEC,$0000,$0001,$0000,$0008,$0004,$0000,$0000
	dw $00C0,$00C0,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0028,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$003C,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0050,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0064,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $FF38,$0078,$0000,$0001,$0001,$0008,$0004,$0000,$0000
	dw $0000,$010C,$0000,$0197,$0000,$0014,$0006,$0000,$0000
	dw $0000,$FEF4,$0000,$0198,$0000,$0014,$0006,$0000,$0000
	dw $0000,$0000,$0000,$018D,$0000,$0005,$0005,$0018,$0001
	dw $0000,$0000,$0000,$018C,$0000,$0003,$0003,$0019,$0000
CODE_9CA41B:
	lda.b $A5
	cmp.w #$0100
	bcs CODE_9CA467
	sep #$30
	phx
	ldx.b #$0E
	lda.b #$00
	xba
	lda.l $7E3517
	sta.b $14
CODE_9CA430:
	lda.l $7E3508,x
	sta.w WRDIVL
	lda.b $14
	sta.w WRDIVH
	lda.b $A5
	sta.w WRDIVB
	nop
	nop
	nop
	nop
	nop
	nop
	xba
	clc
	adc.w RDDIVL
	sta.l $7E3508,x
	lda.w RDDIVH
	adc.b #$00
	xba
	lda.w RDMPYL
	sta.b $14
	dex
	bpl CODE_9CA430
	lda.b $14
	sta.b $A5
	plx
	rep #$30
	clc
	rtl
CODE_9CA467:
	cmp.w #$0200
	bne CODE_9CA49F
	lda.l $7E3508
	and.w #$01FF
	sta.b $A5
	sep #$30
	phx
	phy
	clc
	ldx.b #$0E
	lda.l $7E3517
	sta.b $14
CODE_9CA482:
	ldy.b $14
	lda.l $7E3508,x
	sta.b $14
	tya
	ror a
	sta.l $7E3508,x
	dex
	bpl CODE_9CA482
	lda.b #$00
	sta.l $7E3517
	ply
	plx
	rep #$30
	clc
	rtl
CODE_9CA49F:
	lda.l $7E3508
	and.w #$3FFF
	sta.b $A5
	phx
	ldx.w #$0000
CODE_9CA4AC:
	lda.l $7E3509,x
	asl a
	asl a
	xba
	sep #$20
	sta.l $7E3508,x
	rep #$20
	inx
	cpx.w #$000E
	bcc CODE_9CA4AC
	lda.w #$0000
	sta.l $7E3517
	sta.l $7E3516
	plx
	clc
	rtl
CODE_9CA4CF:
	phx
	ldx.w #$000E
CODE_9CA4D3:
	lda.l $7E3508,x
	sta.b $DD,x
	lda.w #$0000
	sta.l $7E3508,x
	dex
	dex
	bpl CODE_9CA4D3
	lda.b $A5
	sta.b $CD
CODE_9CA4E8:
	lsr.b $CD
	bcc CODE_9CA53D
	lda.l $7E3508
	clc
	adc.b $DD
	sta.l $7E3508
	lda.l $7E350A
	adc.b $DF
	sta.l $7E350A
	lda.l $7E350C
	adc.b $E1
	sta.l $7E350C
	lda.l $7E350E
	adc.b $E3
	sta.l $7E350E
	lda.l $7E3510
	adc.b $E5
	sta.l $7E3510
	lda.l $7E3512
	adc.b $E7
	sta.l $7E3512
	lda.l $7E3514
	adc.b $E9
	sta.l $7E3514
	lda.l $7E3516
	adc.b $EB
	sta.l $7E3516
CODE_9CA53D:
	asl.b $DD
	rol.b $DF
	rol.b $E1
	rol.b $E3
	rol.b $E5
	rol.b $E7
	rol.b $E9
	rol.b $EB
	lda.b $CD
	bne CODE_9CA4E8
	plx
	clc
	rtl
CODE_9CA554:
	cmp.w #$0000
	bpl CODE_9CA55D
	eor.w #$FFFF
	inc a
CODE_9CA55D:
	sta.b $14
	tya
	bpl CODE_9CA566
	eor.w #$FFFF
	inc a
CODE_9CA566:
	ldy.b $14
CODE_9CA568:
	sty.b $14
	cmp.b $14
	bcs CODE_9CA571
	sta.b $14
	tya
CODE_9CA571:
	sta.b $16
	lsr a
	cmp.b $14
	bcc CODE_9CA580
	lda.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl
CODE_9CA580:
	lda.b $14
	lsr a
	clc
	adc.b $14
	lsr a
	lsr a
	clc
	adc.b $16
	rtl
CODE_9CA58C:
	ldx.w #$0000
CODE_9CA58F:
	stx.b $E4
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b $A5
	bpl CODE_9CA5A0
	eor.w #$FFFF
	inc a
CODE_9CA5A0:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	sta.w $0B3D,x
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b $A9
	bpl CODE_9CA5BC
	eor.w #$FFFF
	inc a
CODE_9CA5BC:
	pha
	lsr a
	lsr a
	tax
	jsl.l CODE_808F4C
	ldx.b $E4
	clc
	adc.w $0B3D,x
	sta.w $0B3D,x
	ply
	pla
	jsl.l CODE_9CA568
	ldx.b $E4
	sta.w $0B1D,x
	jsl.l vtoa
	sta.w $0B5D,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA58F
	rtl
TeamList:		; a long pointer to each team record (team number = index)
	dd Anaheim		; 0
	dd Boston		; 1
	dd Buffalo		; 2
	dd Calgary		; 3
	dd Chicago		; 4
	dd Dallas		; 5
	dd Detroit		; 6
	dd Edmonton		; 7
	dd Florida		; 8
	dd Hartford		; 9
	dd LosAngeles		; 10
	dd Montreal		; 11
	dd NewJersey		; 12
	dd NYIslanders		; 13
	dd NYRangers		; 14
	dd Ottawa		; 15
	dd Philadelphia		; 16
	dd Pittsburgh		; 17
	dd Quebec		; 18
	dd SanJose		; 19
	dd StLouis		; 20
	dd TampaBay		; 21
	dd Toronto		; 22
	dd Vancouver		; 23
	dd Washington		; 24
	dd Winnipeg		; 25
	dd AllStarsEast		; 26
	dd AllStarsWest		; 27
AllStarsEast:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $77,$20,$00,$E8,$5B
.sodds:
	db 203,192
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,07,04,16,09,00	; line 1 Sc1
	db 01,19,18,07,04,16,10,00	; line 2 Sc2
	db 01,22,20,11,10,17,07,00	; line 3 Chk
	db 01,23,24,05,12,14,07,00	; line 4 PP1
	db 01,19,22,07,04,16,09,00	; line 5 PP2
	db 01,18,21,08,09,17,07,00	; line 6 PK1
	db 01,19,23,13,05,06,15,00	; line 7 PK2
	db 01,24,25,15,06,05,13,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Patrick Roy", $3366,$4446,$0100,$5566)	; 1
	%Player("Grant Fuhr", $3175,$4555,$0000,$4455)	; 2
	%Player("Tom Barrasso", $35A4,$4554,$0000,$4444)	; 3
	%Player("Mario Lemieux", $66A5,$4644,$3366,$6062)	; 4
	%Player("Mark Messier", $11A5,$4443,$5453,$4053)	; 5
	%Player("Kirk Muller", $1094,$4444,$4444,$4143)	; 6
	%Player("Adam Oates", $1275,$4653,$3154,$5061)	; 7
	%Player("Joe Sakic", $1964,$4544,$2045,$5252)	; 8
	%Player("Pierre Turgeon", $7894,$4534,$3445,$5141)	; 9
	%Player("Pat LaFontaine", $1655,$4643,$3354,$6052)	; 10
	%Player("Kevin Stevens", $25B3,$4533,$3644,$5344)	; 11
	%Player("Jaromir Jagr", $68A5,$4433,$4453,$4142)	; 12
	%Player("Peter Bondra", $1364,$6433,$2044,$4232)	; 13
	%Player("Mike Gartner", $2275,$5445,$2353,$5552)	; 14
	%Player("Rick Tocchet", $2392,$2544,$3735,$4134)	; 15
	%Player("Alexnder Mogilny", $8976,$6634,$2455,$4452)	; 16
	%Player("Mark Recchi", $0865,$4534,$3445,$4143)	; 17
	%Player("Larry Murphy", $55A4,$3454,$3242,$5143)	; 18
	%Player("Ray Bourque", $77A5,$4465,$6055,$6252)	; 19
	%Player("Brian Leetch", $0266,$3444,$2651,$5252)	; 20
	%Player("Steve Duchesne", $2884,$4444,$2442,$4142)	; 21
	%Player("Al Iafrate", $34B4,$4446,$4642,$4444)	; 22
	%Player("Scott Stevens", $04B4,$4344,$5642,$5043)	; 23
	%Player("Zarley Zalapski", $03A5,$4454,$4442,$5133)	; 24
	%Player("Glen Wesley", $2685,$4344,$3641,$4442)	; 25
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("All Stars East")
.ta:		; abbreviation
	%String("ASE")
.tm:		; nickname
	dw 2		; an empty String
.ar:		; arena
	%String("Madison Square Garden")
AllStarsWest:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $77,$20,$00,$E8,$59
.sodds:
	db 237,144
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,20,22,11,04,15,14,00	; line 1 Sc1
	db 01,24,22,11,04,15,13,00	; line 2 Sc2
	db 01,20,23,14,06,13,04,00	; line 3 Chk
	db 01,18,21,10,08,12,04,00	; line 4 PP1
	db 01,20,19,11,09,13,04,00	; line 5 PP2
	db 01,18,22,06,04,15,09,00	; line 6 PK1
	db 01,25,21,08,12,09,17,00	; line 7 PK2
	db 01,23,24,09,17,08,12,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Ed Belfour", $3066,$4665,$0000,$6655)	; 1
	%Player("Tim Cheveldae", $3264,$4444,$0000,$4344)	; 2
	%Player("Felix Potvin", $2964,$4664,$0000,$4444)	; 3
	%Player("Steve Yzerman", $1966,$5644,$1155,$6152)	; 4
	%Player("Mike Modano", $0975,$5445,$2452,$5243)	; 5
	%Player("Jeremy Roenick", $2745,$5445,$2355,$5253)	; 6
	%Player("Brian Bradley", $2344,$3434,$3335,$4233)	; 7
	%Player("Doug Gilmour", $9345,$4554,$4444,$6043)	; 8
	%Player("Wayne Gretzky", $9946,$4542,$2262,$6060)	; 9
	%Player("Gary Roberts", $1174,$4544,$4845,$5134)	; 10
	%Player("Luc Robitaille", $2074,$4534,$2456,$5243)	; 11
	%Player("Theoren Fleury", $1435,$5454,$4743,$6133)	; 12
	%Player("Brett Hull", $1694,$4536,$3353,$4432)	; 13
	%Player("Pavel Bure", $1055,$6544,$2054,$4442)	; 14
	%Player("Teemu Selanne", $1365,$6534,$3345,$5442)	; 15
	%Player("Pat Falloon", $1874,$4323,$1342,$4531)	; 16
	%Player("Jari Kurri", $1784,$3444,$2143,$4132)	; 17
	%Player("Gary Suter", $2275,$4454,$4642,$5243)	; 18
	%Player("Jeff Brown", $2193,$3445,$2343,$5142)	; 19
	%Player("Paul Coffey", $7796,$5434,$2461,$5153)	; 20
	%Player("Chris Chelios", $0774,$4465,$4751,$6245)	; 21
	%Player("Phil Housley", $0666,$5433,$2462,$4062)	; 22
	%Player("Dave Manson", $2494,$4355,$4A41,$5434)	; 23
	%Player("Steve Smith", $05B4,$4344,$4641,$5244)	; 24
	%Player("Steve Chiasson", $0394,$3444,$3641,$4234)	; 25
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("All Stars West")
.ta:		; abbreviation
	%String("ASW")
.tm:		; nickname
	dw 2		; an empty String
.ar:		; arena
	%String("Madison Square Garden")
Boston:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $41,$21,$21,$F7,$4C
.sodds:
	db 180,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,07,03,12,08,00	; line 1 Sc1
	db 01,19,18,08,03,12,05,00	; line 2 Sc2
	db 01,20,21,07,05,13,03,00	; line 3 Chk
	db 01,22,23,09,04,14,03,00	; line 4 PP1
	db 01,20,18,08,03,12,05,00	; line 5 PP2
	db 01,22,21,07,05,13,03,00	; line 6 PK1
	db 01,18,19,09,04,03,06,00	; line 7 PK2
	db 01,20,21,03,06,09,04,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Andy Moog", $3544,$4224,$0000,$4343)	; 1
	%Player("John Blue", $3963,$4553,$0000,$4343)	; 2
	%Player("Adam Oates", $1275,$4653,$3154,$5061)	; 3
	%Player("Dave Poulin", $1974,$3343,$4433,$4142)	; 4
	%Player("Vladimir Ruzicka", $38A4,$4334,$2643,$3332)	; 5
	%Player("Ted Donato", $2143,$4343,$3033,$3332)	; 6
	%Player("Joe Juneau", $4954,$4434,$2043,$4041)	; 7
	%Player("Dmitri Kvartalnov", $1064,$4423,$2043,$4241)	; 8
	%Player("Dave Reid", $1792,$3333,$1424,$4420)	; 9
	%Player("Gregori Pantaleyev", $1364,$4222,$1233,$2431)	; 10
	%Player("Brent Hughes", $4263,$3132,$3632,$2534)	; 11
	%Player("Cam Neely", $08A4,$4544,$4945,$5344)	; 12
	%Player("Stephen Leach", $2763,$3333,$3732,$4533)	; 13
	%Player("Stephen Heinze", $2363,$3333,$3333,$3531)	; 14
	%Player("C.J. Young", $1863,$3223,$2533,$2322)	; 15
	%Player("Darin Kimble", $2991,$1211,$2924,$1315)	; 16
	%Player("Peter Douris", $1683,$4333,$2533,$2421)	; 17
	%Player("Ray Bourque", $77A5,$4465,$6055,$6252)	; 18
	%Player("Don Sweeney", $3244,$4344,$4441,$4142)	; 19
	%Player("Glen Wesley", $2685,$4344,$3641,$4442)	; 20
	%Player("David Shaw", $3492,$2242,$3322,$4523)	; 21
	%Player("Gordie Roberts", $1473,$2231,$3423,$3023)	; 22
	%Player("Glen Feathrston", $06B3,$3222,$4823,$2324)	; 23
	%Player("Jim Wiemer", $36A2,$1221,$2820,$2324)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Boston")
.ta:		; abbreviation
	%String("BOS")
.tm:		; nickname
	%String("Bruins")
.ar:		; arena
	%String("Boston Garden")
Buffalo:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $64,$10,$21,$D8,$49
.sodds:
	db 178,80
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,17,18,05,04,13,06,00	; line 1 Sc1
	db 01,17,19,09,04,13,05,00	; line 2 Sc2
	db 01,18,21,11,05,15,04,00	; line 3 Chk
	db 01,20,22,08,06,14,04,00	; line 4 PP1
	db 01,17,18,05,04,13,06,00	; line 5 PP2
	db 01,20,21,08,06,15,04,00	; line 6 PK1
	db 01,19,21,09,06,08,04,00	; line 7 PK2
	db 01,17,18,08,04,09,06,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Grant Fuhr", $3175,$4555,$0100,$4455)	; 1
	%Player("Tom Draper", $3562,$3332,$0000,$2222)	; 2
	%Player("Dominik Hasek", $3943,$3552,$0000,$2222)	; 3
	%Player("Pat LaFontaine", $1655,$4643,$3354,$6052)	; 4
	%Player("Dale Hawerchuk", $1065,$4443,$2051,$3052)	; 5
	%Player("Bob Sweeney", $2094,$2353,$4734,$4233)	; 6
	%Player("Dave Hannan", $1462,$2232,$2623,$2022)	; 7
	%Player("Randy Wood", $1981,$5332,$3622,$3423)	; 8
	%Player("Yuri Khmylev", $1374,$3344,$3134,$3332)	; 9
	%Player("Brad May", $2792,$2222,$3A23,$2514)	; 10
	%Player("Bob Errey", $1264,$4242,$4432,$4523)	; 11
	%Player("Rob Ray", $32A3,$4111,$3A22,$1514)	; 12
	%Player("Alexnder Mogilny", $8976,$6634,$2455,$4452)	; 13
	%Player("Wayne Presley", $1863,$3334,$2723,$3323)	; 14
	%Player("Donald Audette", $2853,$3333,$2933,$3523)	; 15
	%Player("Colin Patterson", $1784,$4231,$3523,$2522)	; 16
	%Player("Doug Bodger", $08A2,$3342,$3621,$4133)	; 17
	%Player("Petr Svoboda", $0754,$4343,$3640,$4033)	; 18
