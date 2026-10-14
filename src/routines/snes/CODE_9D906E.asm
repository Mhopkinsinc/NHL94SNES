; Unidentified routine.
CODE_9D906E:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $AF
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b $A7
	stz.b $B3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $0ACF
	cmp.w #$0007
	beq .1
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.b d4
	beq .1
	stz.b a2
.loop:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	sta.w printx
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	asl a
	asl a
	sta.w printy
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0005
	sta.w mesarea
	ldx.b a2
	lda.l $7E3548,x
	adc.w #$0030
	sta.w mesarea+2
	lda.w #$002D
	sta.w $0A2D
	lda.l $7E3558,x
	adc.w #$0030
	sta.w $0A2E
	lda.w #$6E82
	sta.w printm
	jsl.l print
	inc.b a2
	inc.b a2
	dec.b d4
	bne .loop
.1:
	lda.w #DATA8_95FF9B>>16
	sta.b $0E
	lda.w #DATA8_95FF9B
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
	lda.w #$A676
	sta.b $10
	lda.w #$0080
	sta.b $24
	ldx.w #$003D
	ldy.w #$0008
	lda.l $7E35C6
	ora.w #$0C00
	jsl.l CODE_808E2D
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF41F
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$6E82
	sta.w printm
	jsl.l CODE_9BC6C9
	lda.w #$0080
	sta.l $7EA670
	sta.l $7EC676
	lda.w #$0020
	sta.l $7EA672
	sta.l $7EC678
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	lda.w #$0020
	sta.b $24
	stz.b $26
	lda.w #$0040
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	lda.w #$0020
	sta.b $24
	stz.b $26
	lda.w #$0040
	sta.b $18
	lda.w #$001C
	sta.b $1A
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$0180
	sta.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	lda.w #$FFFC
	sta.w $07E0
	lda.w #$1D47
	sta.l $7E3616
	sta.l $7E361E
	lda.w #$FFFF
	sta.l $7E361A
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0070
	jsl.l CODE_808723
	jsl.l CODE_8086BD
CODE_9D9221:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	lda.w $0AB8
	ora.w $0ABA
	cmp.w #$1000
	bne .t2
	jmp.w CODE_9D9064

.t2:
	lda.b $83
	cmp.b d7
	beq CODE_9D9221
	sta.b d7
	ldx.w #$3622
	ldy.w #$007E
	jsl.l CODE_9D96A9
	lda.w #$007E
	sta.b $0E
	lda.w #$3614
	sta.b $0C
	ldy.w #$0010
	ldx.w #$0010
	jsl.l CODE_808723
	lda.w JoyPad
	ora.w $0778
	bit.w #$0200
	bne .t1
	bit.w #$0100
	bne .t3
	lda.b $B3
	bne CODE_9D9281
	jmp.w CODE_9D9221

.t1:
	lda.w #$FFFE
	sta.b $B3
	jmp.w CODE_9D9281

.t3:
	lda.w #$0002
	sta.b $B3
CODE_9D9281:
	lda.w Hscroll
	clc
	adc.b $B3
	cmp.b $AF
	bcs .t2
	jmp.w CODE_9D9394

.t2:
	cmp.b $A7
	bcc .t1
	jmp.w CODE_9D9394

.t1:
	sta.w Hscroll
	and.w #$0007
	beq .t3
	jmp.w CODE_9D936E

.t3:
	lda.b $B3
	bmi .t2x
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	clc
	adc.w #$002F
	cmp.w #$0080
	bcc .t1x
	jmp.w CODE_9D936E

.t1x:
	sta.b $24
	pha
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.b $24
	sec
	sbc.w #$0020
	and.w #$003F
	tax
	phx
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	plx
	pla
	sta.b $24
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldy.w #$0000
	jsl.l CODE_808BED
	bra CODE_9D936E

.t2x:
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	sec
	sbc.w #$0010
	bcc CODE_9D936E
	sta.b $24
	pha
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.b $24
	sec
	sbc.w #$0020
	and.w #$003F
	tax
	phx
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	plx
	pla
	sta.b $24
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldy.w #$0000
	jsl.l CODE_808BED
CODE_9D936E:
	lda.w Hscroll
	cmp.w #$0058
	beq CODE_9D9394
	cmp.w #$00B0
	beq CODE_9D9394
	cmp.w #$0108
	beq CODE_9D9394
	cmp.w #$0180
	beq CODE_9D9394
	cmp.w #$01F8
	beq CODE_9D9394
	cmp.w #$0250
	beq CODE_9D9394
	cmp.w #$02A8
	bne CODE_9D9396
CODE_9D9394:
	stz.b $B3
CODE_9D9396:
	lda.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	jmp.w CODE_9D9221
