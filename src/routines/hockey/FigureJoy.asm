; Set which team each controller plays
FigureJoy:
	lda.l $7E34CC
	bne .t2
	jmp.w .4

.t2:
	lda.l $7E34BC
	bne .t1
	jmp.w .3

.t1:
	cmp.w #$0004
	bne .t3
	jmp.w .3

.t3:
	jsl.l GetShifter
	lda.w #$007E
	sta.b $8B
	lda.w #$34D2
	sta.b a0
	lda.l $7E34F2
	tay
	lda.b [a0],y
	and.w #$00FF
	sta.b d2
	lda.b d1
	asl a
	sta.b a1
	lda.w #$FFFF
	sta.l $7E35D6
	stz.b d0
.loop:
	lda.b d2
	ldx.b a1
	cmp.l $7E3528,x
	beq .t2x
	cmp.l $7E3538,x
	beq .t1x
	dec.b a1
	dec.b a1
	dec.b d1
	bpl .loop
	rtl

.t1x:
	lda.w #$0004
	sta.b d0
	lda.l $7E3528,x
	sta.l $7E34C0
	bra .2

.t2x:
	stz.b d0
	lda.l $7E3538,x
	sta.l $7E34C0
.2:
	lda.b d0
	clc
	adc.l $7E34CE
	sta.b d0
	lda.b d1
	sta.l $7E35D6
	lda.l $7E3528,x
	sta.w HomeTeam
	lda.l $7E3538,x
	sta.w VisTeam
	asl.b d0
	asl.b d0
	phb
	phk
	plb
	ldy.b d0
	ldx.w #$0000
.loopx:
	lda.w $1C84,x
	beq .1
	lda.w .5,y
	sta.w $1C84,x
.1:
	inx
	inx
	cpx.w #$000A
	bcc .loopx
	plb
	rtl
.3:
	lda.l $7E34CA
	asl a
	asl a
	sta.b d0
	tay
	lda.w #$009D
	sta.b $8B
	lda.w #.5+32
	sta.b a0
	iny
	iny
.4:
	jsl.l InitializeGameStructures
	rtl
.5:
	dw $0001,$0000,$0001,$0001,$0001,$0002,$0002,$0001,$0002,$0000,$0002,$0002,$0002
	dw $0001,$0001,$0002,$0000,$0000,$0001,$0000,$0002,$0000,$0001,$0001,$0001,$0002
