; Bank $9E, fifth 4 KB: game code with auto labels for now, among it the pre-game screen code that prints PregameText
; (bank $97); DATA8_9ECC88 holds words it puts into Ron Barr's lines (extremely, has, have).

org $9EC000
CODE_9EC000:
	lda.b $91
	beq CODE_9EC007
	lda.w #$0034
CODE_9EC007:
	clc
	adc.b $A5
	tay
	lda.w $1852,y
	cmp.w #$0006
	bpl CODE_9EBFDD
	lda.w $1852,y
	bne CODE_9EC01C
	jsl.l releasepl
CODE_9EC01C:
	rtl
CODE_9EC01D:
	dec a
	sta.w $1852,y
	bit.w #$0800
	bne CODE_9EC029
	jmp.w $BF9E
CODE_9EC029:
	bit.w #$1000
	bne CODE_9EC038
	lda.w #$1000
	sta.w $1852,y
	jml.l RemovePlayerFromList
CODE_9EC038:
	lda.w #$0000
	sta.w $1852,y
	jml.l RemovePlayerFromList
CODE_9EC042:
	lda.w $15D4
	bit.w #$0010
	bne CODE_9EC06D
	lda.b $91
	cmp.w $0AD9
	bne CODE_9EC06D
	lda.w $1E8B
	bne CODE_9EC059
	jmp.w $C06D
CODE_9EC059:
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
	bne CODE_9EC068
	jmp.w $C06D
CODE_9EC068:
	lda.w #$FFFF
	bra CODE_9EC070
CODE_9EC06D:
	lda.w #$0000
CODE_9EC070:
	rtl
releasepl:
	stx.b $87
	ldx.w #$0000
CODE_9EC076:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EC076
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9EC087:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EC087
	ldx.b $87
	ldy.b $91
	ldx.w $1766,y
	dex
	dex
CODE_9EC09A:
	inx
	inx
	lda.w $0F43,x
	bpl CODE_9EC09A
	lda.b $A5
	lsr a
	sta.b $B1
	ldy.b $91
	lda.w $17A6,y
	sta.b $A9
	inc a
	sta.w $17A6,y
	lda.w #$0001
	tsb.w $17DE
	tsb.w $17E0
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	lda.w $17AA,y
	bpl CODE_9EC0CB
	inc.b $89
CODE_9EC0CB:
	ldy.b $A9
	lda.b [$89],y
	and.w #$00FF
	sta.w $0F43,x
	stx.b $95
	jsl.l Setplass
	jsl.l CODE_9FCEF6
	lda.w $1283,x
	ora.w #$1000
	sta.w $1283,x
	stx.b $87
	ldx.w #$000E
CODE_9EC0ED:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9EC0ED
	ldx.b $87
	stx.b $87
	ldx.w #$000E
CODE_9EC0FB:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9EC0FB
	ldx.b $87
	ldx.b $95
	rtl
ClearPenaltyBuffer:
	lda.w #$001F
	sta.b $A5
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EC116:
	lda.w #$0000
	sta.b [$89]
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC116
	rtl
CODE_9EC124:
	lda.w #$0014
	sec
	sbc.w $1443,x
	asl a
	asl a
	asl a
	asl a
	sta.b $A5
	lda.w $19D4,x
	bmi CODE_9EC138
	asl.b $A5
CODE_9EC138:
	lda.w $0D55,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi CODE_9EC15C
	cmp.w #$0029
	bpl CODE_9EC15C
	lda.w $0DB7,x
	sec
	sbc.w $0DD3
	cmp.w #$FFD7
	bmi CODE_9EC15C
	cmp.w #$0029
	bpl CODE_9EC15C
	lsr.b $A5
CODE_9EC15C:
	jml.l CODE_9BB39B
CODE_9EC160:
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
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w $15DA
	beq CODE_9EC180
	jmp.w $C265
CODE_9EC180:
	lda.l $7E344C
	beq CODE_9EC1BB
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF72F
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$000E
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0000
	sta.l $7E344C
CODE_9EC1BB:
	lda.b $A5
	bpl CODE_9EC1C2
	jmp.w CODE_80C2AE
CODE_9EC1C2:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF734
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	ldy.b $A5
	lda.l $7E344C
	beq CODE_9EC20E
	cpy.w #$0006
	bne CODE_9EC1F6
	jmp.w CODE_80C2AE
CODE_9EC1F6:
	cpy.w #$0008
	bne CODE_9EC1FE
	jmp.w CODE_80C2AE
CODE_9EC1FE:
	cpy.w #$000C
	bne CODE_9EC206
	jmp.w CODE_80C2AE
CODE_9EC206:
	cpy.w #$0012
	bne CODE_9EC20E
	jmp.w CODE_80C2AE
CODE_9EC20E:
	lda.b [$8D],y
	clc
	adc.b $8D
	inc a
	inc a
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	sta.b $A5
	bne CODE_9EC222
	jmp.w CODE_80C2AE
CODE_9EC222:
	inc a
	lsr a
	sta.b $A5
	lda.w $0D0F
	sec
	sbc.b $A5
	sta.w $0D0F
	bpl CODE_9EC234
	stz.w $0D0F
CODE_9EC234:
	lda.b [$8D]
	sta.b $A5
	tay
	dec.b $8D
	lda.b [$8D],y
	inc.b $8D
	and.w #$00FF
	bne CODE_9EC246
	dec.b $A5
CODE_9EC246:
	lda.w #$0001
	sta.l $7E344C
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	dec.w $0D11
	dec.w $0D11
	inc.w $0D0F
	jsl.l CODE_9EC7BE
	bra CODE_9EC2AE
CODE_9EC265:
	jsl.l CODE_9EC913
	lda.b $A5
	bmi CODE_9EC2AE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF739
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	ldy.b $A5
	lda.b [$8D],y
	clc
	adc.b $8D
	inc a
	inc a
	sta.b $8D
	lda.b [$8D]
	lsr a
	sta.b $A5
	lda.w $0D0F
	sec
	sbc.b $A5
	sta.w $0D0F
	jsl.l CODE_9EC7BE
CODE_9EC2AE:
	pla
	sta.b $8F
	pla
	sta.b $8D
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
	rtl
CODE_9EC2C7:
	dec.w $1626
	bne CODE_9EC2CF
	jmp.w $C35F
CODE_9EC2CF:
	rtl
CODE_9EC2D0:
	ldy.b $91
	lda.w $1283,y
	ora.w #$1000
	sta.w $1283,y
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w #$0004
	jsl.l CODE_9C9A7F
	ldy.b $91
	lda.w $0D55,y
	sta.w $0D4B
	lda.w $0DB7,y
	sta.w $0D4D
	lda.w #$0040
	tsb.w $15D8
	stz.b $A9
	stz.b $89
	lda.w $1503,y
	beq CODE_9EC31A
	lda.w #$8000
	sta.b $A9
	lda.w #$0002
	sta.b $89
CODE_9EC31A:
	lda.w $12A3,y
	and.w #$00FF
	ora.b $A9
	sta.w $1636
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EC330
	ora.w #$FF00
CODE_9EC330:
	asl a
	sta.b $A9
	lda.b $89
	beq CODE_9EC33A
	lda.w #$0034
CODE_9EC33A:
	adc.b $A9
	tay
	lda.w #$FFFD
	sta.w $1852,y
	lda.w #$0007
	jsl.l CODE_9BB385
	cmp.w #$0000
	bne CODE_9EC35E
	lda.w #$FFFC
	sta.w $1852,y
	lda.w $1636
	ora.w #$4000
	sta.w $1636
CODE_9EC35E:
	rtl
CODE_9EC35F:
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
	stx.b $87
	ldx.w #$0000
CODE_9EC376:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9EC376
	ldx.b $87
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF73E
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0012
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF743
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1636
	bit.w #$4000
	beq CODE_9EC3EC
	and.w #$BFFF
	sta.w $1636
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF766
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9EC3EC:
	jsl.l CODE_9FC4A1
	jsl.l CODE_9EC7BE
	stx.b $87
	ldx.w #$0012
CODE_9EC3F9:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9EC3F9
	ldx.b $87
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
	ldx.b $95
	rtl
CODE_9EC417:
	lda.w $15D4
	bit.w #$0020
	bne CODE_9EC422
	jmp.w $C4BB
CODE_9EC422:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w #$0005
	sta.b $A5
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9EC444
	ldy.w #$000C
CODE_9EC444:
	sty.b $89
	lda.w #$005C
	sta.b $A9
	lda.w $14C3,x
	beq CODE_9EC453
	jmp.w $C4D4
CODE_9EC453:
	lda.w #$FFA4
	sta.b $A9
	sec
	sbc.w $0DD3
	beq CODE_9EC460
	bpl CODE_9EC479
CODE_9EC460:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9EC471
	lda.b $A9
	sec
	sbc.w $0DB7,y
	beq CODE_9EC471
	bpl CODE_9EC4BC
CODE_9EC471:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC460
CODE_9EC479:
	lda.w #$0040
	sta.b $A5
	lda.w #$8000
	trb.w $15D8
	beq CODE_9EC4A9
	lda.l $7E344A
	bne CODE_9EC4A9
	lda.w #$0005
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	lda.w #$0002
	sta.w $0D0F
	sta.w $0D11
	jsl.l eraser
CODE_9EC4A9:
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
CODE_9EC4BB:
	rtl
CODE_9EC4BC:
	lda.w #$0006
	sta.b $A5
	lda.w #$8000
	tsb.w $15D8
	bne CODE_9EC4A9
	lda.w $162A
	bpl CODE_9EC4A9
	jsl.l CODE_9EFA36
	bra CODE_9EC4A9
CODE_9EC4D4:
	lda.b $A9
	cmp.w $0DD3
	bmi CODE_9EC479
CODE_9EC4DB:
	ldy.b $89
	lda.w $0F43,y
	bmi CODE_9EC4E9
	lda.b $A9
	cmp.w $0DB7,y
	bmi CODE_9EC4BC
CODE_9EC4E9:
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC4DB
	bra CODE_9EC479
a2touchpuck:
	ldy.b $91
	cpy.w #$0018
	bcc CODE_9EC4FD
	jmp.w $C5A7
CODE_9EC4FD:
	lda.w $0D55,y
	sta.l $7E30F8
	lda.w $0DB7,y
	sta.l $7E30FA
	tya
	lsr a
	sta.l $7E30F6
	stz.b $89
	lda.w $1503,y
	beq CODE_9EC51C
	inc.b $89
	inc.b $89
CODE_9EC51C:
	lda.w $12A3,y
	sta.b $A5
	ldy.b $89
	cmp.w $179A,y
	beq CODE_9EC565
	lda.w $17DE,y
	bit.w #$0004
	beq CODE_9EC549
	and.w #$FFFB
	sta.w $17DE,y
	cpy.w #$0000
	bne CODE_9EC555
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EC547
	sta.w $19BE
CODE_9EC547:
	bra CODE_9EC555
CODE_9EC549:
	lda.w $179E,y
	sta.w $17A2,y
	lda.w $179A,y
	sta.w $179E,y
CODE_9EC555:
	lda.b $A5
	sta.w $179A,y
	cmp.w $17A2,y
	bne CODE_9EC565
	lda.w #$FFFF
	sta.w $17A2,y
CODE_9EC565:
	lda.w #$1000
	trb.w $15D8
	jsl.l CODE_9EC5F0
	ldy.b $91
	lda.w $0CF1
	bit.w #$0004
	beq CODE_9EC5AD
	bit.w #$0001
	beq CODE_9EC5AD
	lda.w $0F43,y
	beq CODE_9EC5AD
	lda.w $0CF1
	bit.w #$0002
	bne CODE_9EC5A8
	lda.w $14C3,y
	beq CODE_9EC5AD
CODE_9EC590:
	phx
	lda.w $0CF2
	and.w #$00FF
	asl a
	sta.b $95
	tax
	lda.w #$000C
	sta.b $A5
	jsl.l CODE_9EB85E
	plx
	stx.b $95
CODE_9EC5A7:
	rtl
CODE_9EC5A8:
	lda.w $14C3,y
	beq CODE_9EC590
CODE_9EC5AD:
	tya
	lsr a
	xba
	sta.w $0CF1
	lda.w $0DD3
	sta.b $A5
	lda.w $14C3,y
	beq CODE_9EC5CB
	lda.w #$0002
	tsb.w $0CF1
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC5CB:
	lda.b $A5
	bmi CODE_9EC5A7
	lda.w $17A6
	sec
	sbc.w $17A8
	sta.b $A5
	lda.w $1503,y
	beq CODE_9EC5E5
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC5E5:
	lda.b $A5
	bmi CODE_9EC5A7
	lda.w #$0004
	tsb.w $0CF1
	rtl
CODE_9EC5F0:
	ldy.b $91
	lda.w $15D4
	bit.w #$0020
	beq CODE_9EC64A
	lda.w $0DD3
	sta.b $A5
	lda.w $14C3,y
	bne CODE_9EC60C
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC60C:
	lda.b $A5
	cmp.w #$0058
	bmi CODE_9EC64A
	stz.b $89
	lda.w $1503,y
	beq CODE_9EC61F
	lda.w #$0002
	sta.b $89
CODE_9EC61F:
	ldy.b $89
	lda.w $17DE,y
	bit.w #$0010
	beq CODE_9EC64A
	lda.w $15D4
	bit.w #$0010
	bne CODE_9EC64A
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$0012
	sta.b $A5
	jsl.l CODE_9EB85E
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
CODE_9EC64A:
	rtl
CODE_9EC64B:
	stz.w $1638
	lda.w $0AD9
	bpl CODE_9EC656
	jmp.w $C6E6
CODE_9EC656:
	lda.w $15D4
	bit.w #$0002
	bne CODE_9EC668
	lda.w $0AD9
	cmp.w #$000C
	bmi CODE_9EC6AA
	bra CODE_9EC672
CODE_9EC668:
	lda.w $0AD9
	cmp.w #$000C
	bmi CODE_9EC672
	bra CODE_9EC6AA
CODE_9EC672:
	ldy.w $0AD9
	lda.w $0DB7,y
	bpl CODE_9EC6E6
	sec
	sbc.w #$0004
	sta.b $A5
	ldy.w #$0000
	lda.w $0AD9
	cmp.w #$000C
	bpl CODE_9EC68E
	ldy.w #$000C
CODE_9EC68E:
	lda.w #$0006
	sta.b $AD
CODE_9EC693:
	lda.w $0F43,y
	bmi CODE_9EC6A2
	beq CODE_9EC6A2
	lda.b $A5
	sec
	sbc.w $0DB7,y
	bpl CODE_9EC6E6
CODE_9EC6A2:
	iny
	iny
	dec.b $AD
	bpl CODE_9EC693
	bra CODE_9EC6E0
CODE_9EC6AA:
	ldy.w $0AD9
	lda.w $0DB7,y
	bmi CODE_9EC6E6
	clc
	adc.w #$0004
	sta.b $A5
	ldy.w #$0000
	lda.w $0AD9
	cmp.w #$000C
	bpl CODE_9EC6C6
	ldy.w #$000C
CODE_9EC6C6:
	lda.w #$0006
	sta.b $AD
CODE_9EC6CB:
	lda.w $0F43,y
	bmi CODE_9EC6DA
	beq CODE_9EC6DA
	lda.b $A5
	sec
	sbc.w $0DB7,y
	bmi CODE_9EC6E6
CODE_9EC6DA:
	iny
	iny
	dec.b $AD
	bpl CODE_9EC6CB
CODE_9EC6E0:
	stz.w $1638
	inc.w $1638
CODE_9EC6E6:
	rtl
CODE_9EC6E7:
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
	beq CODE_9EC72C
	lda.w $1E9B
	bne CODE_9EC704
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
CODE_9EC704:
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9EC710
	sta.w $19BE
CODE_9EC710:
	phy
	ldy.w #$0000
	lda.w $0AD9
	cmp.w #$000C
	bmi CODE_9EC71F
	ldy.w #$0002
CODE_9EC71F:
	lda.w $1E9B
	bne CODE_9EC72B
	lda.w $17C2,y
	inc a
	sta.w $17C2,y
CODE_9EC72B:
	ply
CODE_9EC72C:
	rtl
CODE_9EC72D:
	lda.w $1E9B
	bne CODE_9EC790
	lda.w $1E8D
	cmp.w #$000C
	bmi CODE_9EC745
	lda.w #$0002
	sta.w $1E91
	inc.w $17CC
	bra CODE_9EC74B
CODE_9EC745:
	stz.w $1E91
	inc.w $17CA
CODE_9EC74B:
	phy
	lda.w $1E91
	eor.w #$0002
	tay
	lda.w #$0001
	sta.w $17A6,y
	ldy.w $1E91
	lda.w #$0001
	sta.w $17A6,y
	ply
	phx
	ldx.w $1E8D
	lda.w $12A3,x
	sta.w $1E8F
	plx
	stz.w $1E9B
	inc.w $1E9B
	lda.l $7E3136
	sta.w $1E97
	lda.l $7E3138
	sta.w $1E99
	lda.w #$0000
	sta.l $7E3136
	lda.w #$0000
	sta.l $7E3138
CODE_9EC790:
	rtl
CODE_9EC791:
	lda.w $163A
	beq CODE_9EC7BD
	lda.w $1E9B
	beq CODE_9EC7BD
	phx
	stz.w $1E9B
	lda.w #$FFFF
	sta.w $1E8D
	lda.w #$000A
	sta.b $A5
	jsl.l ShootoutWonBy
	lda.w $1E97
	sta.l $7E30F8
	lda.w $1E99
	sta.l $7E30FA
	plx
CODE_9EC7BD:
	rtl
CODE_9EC7BE:
	phx
	ldy.w #$0002
CODE_9EC7C2:
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
	lda.l $7E35B6
	adc.l $7E35A8
	ora.w $0D0D
	sta.b $14
CODE_9EC7DF:
	tya
	cmp.b [$8D]
	bne CODE_9EC7E7
	jmp.w $C881
CODE_9EC7E7:
	lda.b [$8D],y
	bit.w #$0080
	bne CODE_9EC827
	and.w #$00FF
	cmp.w #$0040
	bne CODE_9EC7F9
	jmp.w $C888
CODE_9EC7F9:
	phx
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	adc.b $14
	plx
CODE_9EC803:
	cmp.l $7E37F4,x
	beq CODE_9EC81F
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9EC817
	sta.w $0CD5
CODE_9EC817:
	cmp.w $0CD7
	bcc CODE_9EC81F
	sta.w $0CD7
CODE_9EC81F:
	inc.w $0D0F
	inx
	inx
	iny
	bra CODE_9EC7DF
CODE_9EC827:
	eor.w #$FFFF
	inc a
	pha
	and.w #$0030
	cmp.w #$0010
	bne CODE_9EC838
	clc
	adc.w #$0050
CODE_9EC838:
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.w $0D0D
	lda.b $01,s
	and.w #$0040
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.w $0D0D
	pla
	and.w #$0003
	pha
	asl a
	tax
	lda.l $7E35A8,x
	sta.l $7E35A8
	pla
	dec a
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	sta.w $0CD9
	iny
	lda.b [$8D],y
	and.w #$007F
	sta.w $0D0F
	iny
	lda.b [$8D],y
	and.w #$007F
	sta.w $0D11
	iny
	jmp.w $C7C2
CODE_9EC881:
	clc
	adc.b $8D
	sta.b $8D
	plx
	rtl
CODE_9EC888:
	lda.l $7E35D0
	clc
	adc.l $7E35A8
	jmp.w $C803
CODE_9EC894:
	phx
	lda.w #$0020
	sta.b $24
	lda.b [$8D]
	dec a
	dec a
	sta.b $22
	inc.b $8D
	inc.b $8D
	lda.b $8F
	sta.b $0E
	lda.b $8D
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldy.w $0D11
	ldx.w $0D0F
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	ora.w $0D0D
	jsl.l CODE_9EC8CE
	plx
	rtl
CODE_9EC8CE:
	sta.b $26
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
CODE_9EC8E7:
	lda.b [$0C]
	and.w #$00FF
	beq CODE_9EC902
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dec.b $22
	bne CODE_9EC8E7
CODE_9EC901:
	rtl
CODE_9EC902:
	dex
	bmi CODE_9EC901
	lda.w #$0020
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	bra CODE_9EC902
CODE_9EC913:
	lda.b $A5
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF776
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0018
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF77B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	pla
	sta.b $A5
	rtl
CODE_9EC95C:
	lda.w $0D45
	sec
	sbc.w #$1000
	beq CODE_9EC96D
	bmi CODE_9EC96B
	bvs CODE_9EC96D
	bra CODE_9EC9B0
CODE_9EC96B:
	bvs CODE_9EC9B0
CODE_9EC96D:
	lda.w $1D5E
	bmi CODE_9EC977
	dec.w $0D45
	bpl CODE_9EC9B0
CODE_9EC977:
	lda.w #$0097
	sta.b $8F
	lda.w #PregameText
	sta.b $8D
	lda.w $0D3F
	sta.b $A5
	bpl CODE_9EC9E2
	stz.w $0D47
	ldy.w $0D43
	inc.w $0D43
	inc.w $0D43
	lda.w #$007E
	sta.b $8B
	lda.w #$347C
	sta.b $89
	lda.b [$89],y
	sta.b $A5
	bpl CODE_9EC9B1
	lda.w #$7FFF
	sta.w $0D45
	lda.w #$01E0
	sta.w $0D41
CODE_9EC9B0:
	rtl
CODE_9EC9B1:
	lda.w $0D49
	cmp.w #$0001
	bmi CODE_9EC9BD
	jsl.l CODE_9ECD9D
CODE_9EC9BD:
	jsl.l CODE_9ECD9D
	lda.b $8F
	sta.b $93
	lda.b $8D
	sta.b $91
	bra CODE_9EC9D7
CODE_9EC9CB:
	lda.b [$91]
	inc.b $91
	and.w #$00FF
	cmp.w #$000D
	bne CODE_9EC9CB
CODE_9EC9D7:
	dec.b $A5
	bpl CODE_9EC9CB
	lda.b $91
	sec
	sbc.b $8D
	sta.b $A5
CODE_9EC9E2:
	lda.b $8D
	clc
	adc.b $A5
	sta.b $91
	lda.b $8F
	sta.b $93
	lda.w #$000A
	sta.w $0D45
	lda.w $0D47
	sta.b $A5
	lda.b [$91]
	and.w #$00FF
	cmp.w #$0025
	beq CODE_9ECA05
	jmp.w $CAB7
CODE_9ECA05:
	inc.b $91
	lda.b [$91]
	inc.w $0D3F
	and.w #$00FF
	cmp.w #$0072
	bne CODE_9ECA17
	jmp.w $CC4B
CODE_9ECA17:
	cmp.w #$0076
	bne CODE_9ECA1F
	jmp.w $CCFE
CODE_9ECA1F:
	cmp.w #$0068
	bne CODE_9ECA27
	jmp.w $CD05
CODE_9ECA27:
	cmp.w #$0056
	bne CODE_9ECA2F
	jmp.w $CCEC
CODE_9ECA2F:
	cmp.w #$0048
	bne CODE_9ECA37
	jmp.w $CCF5
CODE_9ECA37:
	cmp.w #$006D
	bne CODE_9ECA3F
	jmp.w $CC1E
CODE_9ECA3F:
	cmp.w #$006E
	bne CODE_9ECA47
	jmp.w CODE_80CC25
CODE_9ECA47:
	cmp.w #$0074
	bne CODE_9ECA4F
	jmp.w $CCA1
CODE_9ECA4F:
	cmp.w #$0065
	bne CODE_9ECA57
	jmp.w $CC71
CODE_9ECA57:
	cmp.w #$0030
	bne CODE_9ECA5F
	jmp.w $CB99
CODE_9ECA5F:
	cmp.w #$0031
	bne CODE_9ECA67
	jmp.w $CB9E
CODE_9ECA67:
	cmp.w #$0032
	bne CODE_9ECA6F
	jmp.w $CBA3
CODE_9ECA6F:
	cmp.w #$0033
	bne CODE_9ECA77
	jmp.w $CBA8
CODE_9ECA77:
	cmp.w #$0034
	bne CODE_9ECA7F
	jmp.w $CBAD
CODE_9ECA7F:
	cmp.w #$0035
	bne CODE_9ECA87
	jmp.w $CBB2
CODE_9ECA87:
	cmp.w #$0036
	bne CODE_9ECA8F
	jmp.w $CBB7
CODE_9ECA8F:
	cmp.w #$0037
	bne CODE_9ECA97
	jmp.w $CBBC
CODE_9ECA97:
	cmp.w #$0038
	bne CODE_9ECA9F
	jmp.w $CBC1
CODE_9ECA9F:
	cmp.w #$0039
	bne CODE_9ECAA7
	jmp.w $CBC6
CODE_9ECAA7:
	cmp.w #$0061
	bne CODE_9ECAAF
	jmp.w $CBCB
CODE_9ECAAF:
	cmp.w #$0062
	bne CODE_9ECAB7
	jmp.w $CBD0
CODE_9ECAB7:
	lda.w #$FFFF
	sta.w $0D3F
	lda.w #$0000
	sta.b $8B
	lda.w #$0A2C
	sta.b $89
	stz.b $A9
CODE_9ECAC9:
	lda.b [$91]
	and.w #$00FF
	cmp.w #$000D
	beq CODE_9ECB1A
	inc.b $A5
CODE_9ECAD5:
	sep #$20
	lda.b [$91]
	sta.b [$89]
	rep #$30
	inc.b $89
	inc.b $A9
	lda.b [$91]
	and.w #$00FF
	cmp.w #$002C
	beq CODE_9ECAF0
	cmp.w #$002E
	bne CODE_9ECAFA
CODE_9ECAF0:
	lda.w $0D45
	clc
	adc.w #$0028
	sta.w $0D45
CODE_9ECAFA:
	lda.b [$91]
	inc.b $91
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECAC9
	lda.b [$91]
	and.w #$00FF
	cmp.w #$0020
	beq CODE_9ECAD5
	lda.b $91
	sec
	sbc.b $8D
	sta.b $91
	sta.w $0D3F
CODE_9ECB1A:
	lda.b $A9
	inc a
	inc a
	sta.w $0A2A
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
CODE_9ECB2B:
	lda.b $A5
	sec
	sbc.w #$0014
	beq CODE_9ECB3F
	bmi CODE_9ECB3D
	bvs CODE_9ECB3F
CODE_9ECB37:
	jsl.l CODE_9ECD9D
	bra CODE_9ECB3F
CODE_9ECB3D:
	bvs CODE_9ECB37
CODE_9ECB3F:
	lda.w $0D47
	bne CODE_9ECB5D
	ldy.w #$0002
CODE_9ECB47:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECB5D
	lda.b [$8D]
	dec a
	inc.b $8D
	sta.b [$8D]
	dec.b $A9
	iny
	bra CODE_9ECB47
CODE_9ECB5D:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF796
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D47
	clc
	adc.w $0D0F
	sta.w $0D0F
	lda.w $0D49
	clc
	adc.w $0D11
	sta.w $0D11
	jsl.l CODE_9EC7BE
	lda.w $0D47
	clc
	adc.b $A9
	sta.w $0D47
	rtl
CODE_9ECB99:
	lda.w $1E49
	bra CODE_9ECBD5
CODE_9ECB9E:
	lda.w $1E4D
	bra CODE_9ECBD5
CODE_9ECBA3:
	lda.w $1E51
	bra CODE_9ECBD5
CODE_9ECBA8:
	lda.w $1E55
	bra CODE_9ECBD5
CODE_9ECBAD:
	lda.w $1E59
	bra CODE_9ECBD5
CODE_9ECBB2:
	lda.w $1E5D
	bra CODE_9ECBD5
CODE_9ECBB7:
	lda.w $1E4B
	bra CODE_9ECBDD
CODE_9ECBBC:
	lda.w $1E4F
	bra CODE_9ECBDD
CODE_9ECBC1:
	lda.w $1E53
	bra CODE_9ECBDD
CODE_9ECBC6:
	lda.w $1E57
	bra CODE_9ECBDD
CODE_9ECBCB:
	lda.w $1E5B
	bra CODE_9ECBDD
CODE_9ECBD0:
	lda.w $1E5F
	bra CODE_9ECBDD
CODE_9ECBD5:
	ldx.b $A5
	sta.b $A5
	stz.b $91
	bra CODE_9ECBE8
CODE_9ECBDD:
	ldx.b $A5
	sta.b $A5
	lda.w #$0002
	sta.b $91
	bra CODE_9ECBE8
CODE_9ECBE8:
	phx
	lda.b $89
	pha
	jsl.l GetPlayerRecord
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	pla
	sta.b $89
	plx
	stx.b $A5
	jmp.w $CD36
CODE_9ECC1E:
	lda.w $1CDE
	sta.b $8D
	bra CODE_9ECC2A
CODE_9ECC25:
	lda.w $1CDC
	sta.b $8D
CODE_9ECC2A:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.b $A5
	pha
	lda.w #$0002
	sta.b $A5
	jsl.l AdvanceStringPtr
	pla
	sta.b $A5
	jmp.w $CD19
CODE_9ECC4B:
	lda.w $1CDC
	sta.b $8D
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A5
	jsl.l AdvanceStringPtr
	pla
	sta.b $A5
	jmp.w $CD19
CODE_9ECC71:
	inc.b $91
	lda.w $1E43
	bne CODE_9ECC7B
	jmp.w $CAB7
CODE_9ECC7B:
	lda.w #$009E
	sta.b $8F
	lda.w #DATA8_9ECC88
	sta.b $8D
	jmp.w $CD19
DATA8_9ECC88:		; a word (2 + the text), then the text
	dw $000C : db "extremely "
	dw $0006 : db " has"
	dw $0007 : db " have"
CODE_9ECCA1:
	lda.w $1E41
	jsl.l CODE_9BC5AB
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009E
	sta.b $8F
	lda.w #$CC9A
	sta.b $8D
	lda.w $1E41
	cmp.w #$000D
	beq CODE_9ECCDC
	cmp.w #$000E
	beq CODE_9ECCDC
	lda.w #$009E
	sta.b $8F
	lda.w #$CC94
	sta.b $8D
CODE_9ECCDC:
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	bra CODE_9ECD36
CODE_9ECCEC:
	lda.w $1C9A
	jsl.l CODE_9BC5AB
	bra CODE_9ECD19
CODE_9ECCF5:
	lda.w $1C98
	jsl.l CODE_9BC5AB
	bra CODE_9ECD19
CODE_9ECCFE:
	lda.w $1CDE
	sta.b $8D
	bra CODE_9ECD0A
CODE_9ECD05:
	lda.w $1CDC
	sta.b $8D
CODE_9ECD0A:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
CODE_9ECD19:
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
CODE_9ECD36:
	ldy.w #$0003
CODE_9ECD39:
	lda.b [$8D],y
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECD76
	lda.b [$8D]
	pha
	tya
	dec a
	dec a
	sta.b $B5
	tya
	sta.b [$8D]
	lda.b $8D
	pha
	jsl.l CODE_9ECD7C
	dec.w $0D3F
	pla
	sta.b $8D
	lda.b $8D
	clc
	adc.b $B5
	sta.b $8D
	pla
	sec
	sbc.b $B5
	sta.b [$8D]
	lda.b $A5
	cmp.w #$0015
	bmi CODE_9ECD73
	lda.b $B5
	sta.b $A5
CODE_9ECD73:
	ldy.w #$0002
CODE_9ECD76:
	iny
	tya
	cmp.b [$8D]
	bmi CODE_9ECD39
CODE_9ECD7C:
	inc.w $0D3F
	lda.b $A5
	clc
	adc.b [$8D]
	dec a
	sta.b $A5
	lda.b [$8D]
	dec a
	tay
	dec a
	sta.b $A9
	lda.b [$8D],y
	and.w #$00FF
	beq CODE_9ECD98
	jmp.w $CB2B
CODE_9ECD98:
	dec.b $A9
	jmp.w $CB2B
CODE_9ECD9D:
	stz.w $0D47
	inc.w $0D49
	lda.w $0D49
	sec
	sbc.w #$0008
	bmi CODE_9ECDB1
	bvc CODE_9ECDB3
CODE_9ECDAE:
	jmp.w $C9B0
CODE_9ECDB1:
	bvc CODE_9ECDAE
CODE_9ECDB3:
	dec.w $0D49
	lda.w #$0007
	sta.b $14
	lda.w #$007E
	sta.b $12
	lda.w #$3B78
	sta.b $10
	lda.b $12
	sta.b $0E
CODE_9ECDC9:
	ldx.w #$0028
	lda.b $10
	clc
	adc.w #$0040
	sta.b $0C
	jsl.l CODE_808F2F
	lda.b $0C
	sta.b $10
	dec.b $14
	bpl CODE_9ECDC9
	rtl
CODE_9ECDE1:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F79B
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $91
	bne CODE_9ECE05
	lda.w #$0014
	sta.w $0D0F
CODE_9ECE05:
	rtl
CODE_9ECE06:
	lda.b $8D
	sec
	sbc.w #$0A2A
	sta.w $0A2A
	lda.w #$0A2A
	sta.b $8D
	rtl
CODE_9ECE15:
	phx
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
	ldy.w #$0002
CODE_9ECE2B:
	tya
	cmp.b [$8D]
	bne CODE_9ECE33
	jmp.w $CF91
CODE_9ECE33:
	lda.w $0D11
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w $0D0F
	asl a
	sta.b $A9
	lda.b [$8D],y
	bit.w #$0080
	beq CODE_9ECE4B
	jmp.w $CF40
CODE_9ECE4B:
	and.w #$00FF
	bne CODE_9ECE53
	jmp.w $CF0A
CODE_9ECE53:
	cmp.w #$0061
	bcc CODE_9ECE60
	cmp.w #$007B
	bcs CODE_9ECE60
	adc.w #$FFE0
CODE_9ECE60:
	sec
	sbc.w #$0020
	bne CODE_9ECE69
	jmp.w $CF0E
CODE_9ECE69:
	stz.b $AD
	inc.b $AD
	tax
	lda.l DATA8_80D6FE,x
	and.w #$00FF
	bit.w #$0080
	beq CODE_9ECE7D
	ora.w #$FF00
CODE_9ECE7D:
	cmp.w #$0000
	bpl CODE_9ECE88
	eor.w #$FFFF
	inc a
	stz.b $AD
CODE_9ECE88:
	asl a
	sta.b $A5
	tax
	lda.l DATA8_9ABD3D+6,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E37F4,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9ECEAC
	sta.w $0CD5
CODE_9ECEAC:
	clc
	adc.w #$0021
	cmp.w $0CD7
	bcc CODE_9ECEB8
	sta.w $0CD7
CODE_9ECEB8:
	ldx.b $A5
	lda.l $9ABDDB,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E3834,x
	lda.b $AD
	beq CODE_9ECF07
	ldx.b $A5
	lda.l DATA8_9ABD3D+8,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E37F6,x
	ldx.b $A5
	lda.l $9ABDDD,x
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E3836,x
	inc.w $0D0F
CODE_9ECF07:
	inc.w $0D0F
CODE_9ECF0A:
	iny
	jmp.w CODE_80CE2B
CODE_9ECF0E:
	lda.l $9ABD6F
	clc
	adc.l $7E35AE
	adc.l $7E35A8
	ora.w $0D0D
	ldx.b $A9
	sta.l $7E37F4,x
	sta.l $7E3834,x
	txa
	lsr a
	cmp.w $0CD5
	bcs CODE_9ECF32
	sta.w $0CD5
CODE_9ECF32:
	clc
	adc.w #$0020
	cmp.w $0CD7
	bcc CODE_9ECF07
	sta.w $0CD7
	bra CODE_9ECF07
CODE_9ECF40:
	eor.w #$FFFF
	inc a
	pha
	and.w #$0030
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.w $0D0D
	lda.b $01,s
	and.w #$0040
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	tsb.w $0D0D
	pla
	and.w #$0003
	pha
	asl a
	tax
	lda.l $7E35A8,x
	sta.l $7E35A8
	pla
	dec a
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	sta.w $0CD9
	iny
	lda.b [$8D],y
	and.w #$001F
	sta.w $0D0F
	iny
	lda.b [$8D],y
	and.w #$001F
	sta.w $0D11
	iny
	jmp.w CODE_80CE2B
CODE_9ECF91:
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
	plx
	rtl
appstring:
	lda.w #$0002
	sta.b $C5
	lda.b [$95]
	sta.b $C7
CODE_9ECFAE:
	lda.b $C5
	cmp.b [$8D]
	beq CODE_9ECFC1
	tay
	lda.b [$8D],y
	ldy.b $C7
	sta.b [$95],y
	inc.b $C5
	inc.b $C7
	bra CODE_9ECFAE
CODE_9ECFC1:
	lda.b $C7
	sta.b [$95]
	rtl
CODE_9ECFC6:
	lda.b $A5
	sta.b $10
CODE_9ECFCA:
	lda.b $A5
	bne CODE_9ECFD1
	jmp.w $C7BE
CODE_9ECFD1:
	lda.b [$8D]
	clc
	adc.b $8D
	sta.b $8D
	dec.b $A5
	bra CODE_9ECFCA
CODE_9ECFDC:
	lda.w #$E0FE
	sta.b $A9
	lda.b $A5
	and.w #$000F
	sta.b $A5
	cmp.w #$0008
	bcc CODE_9ED009
	ldy.w $19D4,x
	bpl CODE_9ECFF7
	cmp.w #$0009
	bne CODE_9ECFFF
CODE_9ECFF7:
	lda.w $0EC3,x
	ora.w $0EE3,x
	bne CODE_9ED04D
CODE_9ECFFF:
	lda.w $1543,x
