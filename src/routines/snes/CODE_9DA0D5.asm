; Unidentified routine.
CODE_9DA0D5:
	stz.w $1C84
	stz.w $1C86
	stz.w $1C88
	stz.w $1C8A
	stz.w $1C8C
	lda.l $7E34CC
	bne .t1
	rtl

.t1:
	lda.w #$FFFF
	sta.w $0AD7
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l forceblack
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
	jsl.l ScreenOn
	jsl.l CODE_9F96E6
	lda.w #$000A
	sta.w $0AD1
	stz.b d1
	stz.b $AB
	lda.l $7E34BC
	cmp.w #$0001
	bcc .2
	cmp.w #$0004
	bcs .2
	lda.w #$0001
	sta.w $1C84
	jsl.l FigureJoy
	lda.w $1C84
	dec a
	beq .1
	lda.w VisTeam
	sta.w HomeTeam
.1:
	dec.b d1
	inc.b $AB
.2:
	lda.w #$0001
	sta.w $1C84
CODE_9DA18A:
	lda.b d1
	pha
	jsl.l CODE_9DB0FD
	jsr.w CODE_9DAF5B
	ldx.w #$0000
	lda.w #$0000
.loop:
	sta.l $7E4EF4,x
	inx
	inx
	cpx.w #$0290
	bcc .loop
	lda.w #$FFFF
	sta.l $7E3460
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w VisTeam
	sta.b d1
	lda.b $AB
	pha
	bne .1
	jsr.w CODE_9DAE6D
.1:
	pla
	sta.b $AB
	lda.w #$0016
	sta.w printx
	lda.w HomeTeam
	sta.b d1
	jsr.w CODE_9DAE6D
	jsr.w CODE_9DB0AB
	jsl.l CODE_9DD923
	pla
	sta.b d1
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACEB6
	sta.b $0C
	ldy.w #$0090
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.b $AB
	beq .t1
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF481
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF489
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .t2

.t1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF495
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF49D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .t2

.t2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4A9
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4C3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
CODE_9DA29C:
	jsl.l WaitFrame
	ldx.w $1A0E
	txa
	eor.b d2
	bne .t5
	jmp.w .t6

.t5:
	stx.b d2
	txa
	beq .t4
	bit.w #$0001
	bne .t1
	bit.w #$0002
	bne .t2
	bit.w #$0004
	bne .t3
	bra .t6

.t1:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DAFB2
	bra .t6

.t2:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DB005
	bra .t6

.t3:
	jsl.l CODE_9DAF84
	jsl.l CODE_9DB058
	bra .t6

.t4:
	jsl.l Multi5Init
	jmp.w CODE_9DA18A

.t6:
	lda.w $1A0E
	beq .t1x
	jmp.w CODE_9DA29C

.t1x:
	jsl.l CODE_9B8017
	ldx.w #$0000
CODE_9DA2F5:
	lda.w $1A0E
	bne .1
	lda.w JoyPad,x
	and.w #$000F
	beq .t1
.1:
	lda.w #$0000
	sta.w $1C84,x
	jmp.w CODE_9DA486

.t1:
	lda.w $0AB8,x
	bit.w #$1000
	bne .t3
	jmp.w CODE_9DA44B

.t3:
	lda.b $AB
	beq .1x
	ldx.w #$0000
	lda.w #$0000
.loop:
	ora.w $1C84,x
	inx
	inx
	cpx.w #$000A
	bcc .loop
	bit.w #$0001
	beq .t1x
	jsl.l FigureJoy
.1x:
	lda.l $7E34BC
	cmp.w #$0004
	bne .3
	ldx.w #$0005
.loop2:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq .2
	sta.b $14
	txa
	dec a
	sta.b $16
.loop3:
	lda.b $16
	asl a
	tay
	lda.w $1C84,y
	cmp.b $14
	beq .t2
	dec.b $16
	bpl .loop3
.2:
	dex
	bne .loop2
.3:
	stz.w $0AD7
	rtl

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4DD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF4FA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	jsl.l CODE_9B8682
	bra .4

.t2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF515
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF532
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	jsl.l CODE_9B8682
.4:
	jsl.l CODE_9B8017
	ldx.w #$0008
.loopx:
	lda.w $1A0E
	bne .1xx
	lda.w JoyPad,x
	bit.w #$000F
	bne .1xx
	and.w #$FFF0
	bne .t1xx
.1xx:
	dex
	dex
	bpl .loopx
	bra .4

.t1xx:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF54E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF56B
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
.loopxx:
	ldx.w #$0008
.loop2x:
	lda.w JoyPad,x
	bit.w #$000F
	bne .1xxx
	bit.w #$1000
	bne .loopxx
.1xxx:
	dex
	dex
	bpl .loop2x
	jmp.w CODE_9DA29C
