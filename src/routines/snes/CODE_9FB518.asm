; Unidentified routine.
CODE_9FB518:
	stz.w $1E9D
	stz.b d0
	jsl.l .t1
	lda.w #$0020
	sta.b d0
	jsl.l .t1
	ldx.b a3
	lda.w $1003,x
	bpl CODE_9FB517
	lda.w $1023,x
	bpl CODE_9FB517
	stz.b a2
	lda.w #$0001
	sta.b d0
	inc a
	sta.b a1
	jsl.l CODE_9FB44C
	lda.w #$001C
	sta.b d0
	ldx.b a3
	jml.l assreplace

.t1:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	bmi CODE_9FB517
.1:
	lda.w $1043,y
	asl a
	sta.b d1
	tay
	stz.b a0
	stz.b a2
	lda.w pfteam,y
	beq .2
	lda.w #$0002
	sta.b a2
.2:
	phy
	ldy.b a2
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne .t2
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	ora.w #$FF00
	sta.w $1003,y
	ldx.b a3
	jmp.w SetLCmode2

.t2:
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w $1003,y
	sec
	sbc.b d7
	sta.w $1003,y
	bmi .t1x
	jmp.w CODE_9FB517

.t1x:
	ldx.b a3
	phx
	ldx.b d1
	stx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1x
	ldy.w #$0002
.1x:
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq .2x
	stz.b d2
	jsl.l lcfound
	jsl.l SetLCmode2
.2x:
	plx
	stx.b a3
	rtl
