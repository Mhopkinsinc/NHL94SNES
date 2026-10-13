; Bank $9C, third 4 KB: game code with auto labels for now (DATA8_9CA2FB holds a 9-word record per object it sets up),
; then the team database, src/data/teamdata94s.asm (TeamList, the team records and playoffseats).

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
	lda.w Vpos
	sec
	sbc.l DATA8_9CA0A1-2,x
	tay
	lda.l DATA8_9CA0A9-2,x
	pha
	lda.w #$FFE2
	sec
	sbc.w Hpos
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
	lda.w attribute,x
	and.w #$0800
	sta.w $0CC5
	lda.w attribute,x
	and.w #$1000
	sta.w $0CD3
CODE_9CA151:
	lda.w attribute,x
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
SprSort:
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
	sta.w Ylist,x
	inx
	inx
	cpx.w #$0020
	bne CODE_9CA1B7
	bra CODE_9CA1D3
CODE_9CA1C6:
	lda.w Xpos,x
	sta.w Ylist,x
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
	lda.w OOlist,x
	and.w #$00FF
	sta.b $A5
	tay
	lda.w Ylist,y
	ldy.b $A9
	cmp.w Ylist,y
	bmi CODE_9CA208
	beq CODE_9CA208
	lda.w OOlist,x
	xba
	sta.w OOlist,x
	txa
	sta.w OOlistpos,y
	inc a
	ldy.b $A5
	sta.w OOlistpos,y
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
	sta.w attribute,y
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
	sta.w pfnc,y
	cpy.w #$001E
	bne CODE_9CA2A2
	lda.w #$0001
	sta.w pfnc,y
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
	sta.w OOlist,y
	inc.b $8D
	rep #$30
	ldy.b $99
	lda.b $BD
	sta.w OOlistpos,y
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
	lda.w puckx
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
incsrc "data/teamdata94s.asm"
