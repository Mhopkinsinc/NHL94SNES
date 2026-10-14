; Unidentified routine.
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
	lda.w VisTeam
	sta.w HomeTeam
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
	jsr.w CODE_9DAF5B
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
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w VisTeam
	sta.b $A9
	lda.b $AB
	pha
	bne CODE_9DA1C5
	jsr.w CODE_9DAE6D
CODE_9DA1C5:
	pla
	sta.b $AB
	lda.w #$0016
	sta.w printx
	lda.w HomeTeam
	sta.b $A9
	jsr.w CODE_9DAE6D
	jsr.w CODE_9DB0AB
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
