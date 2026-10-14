; Unidentified routine.
CODE_9FF8F3:
	ldy.w #$0006
	stz.b $A7
.loop:
	lda.b $A7
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$0037
	asl a
	tax
	stz.b d0
	sep #$20
.loop2:
	lda.b d1
	beq .1
	lda.b [$0C],y
.1:
	sta.l $7F4040,x
	iny
	inx
	inx
	inc.b d0
	lda.b d0
	cmp.b #$12
	bmi .loop2
	rep #$20
	inc.b $A7
	lda.b $A7
	cmp.w #$000A
	bmi .loop
	rts

.t1:
	rep #$30
CODE_9FF92E:
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.w #$4040
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	ldx.w #$1C00
	lda.w #$0A00
	jsl.l .t1
	pla
	sta.b $0E
	pla
	sta.b $0C
	rtl

.t1:
	php
	sta.w DAS0L
	lda.b $0C
	sta.w A1T0L
	stx.w VMADDL
	sep #$20
	lda.b $0E
	sta.w A1B0
	lda.b #$01
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.b #$01
	sta.w MDMAEN
	rep #$30
	plp
	rtl
