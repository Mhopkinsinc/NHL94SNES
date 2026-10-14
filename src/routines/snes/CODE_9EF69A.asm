; Unidentified routine.
CODE_9EF69A:
	lda.b d0
	sta.b d2
	lda.w puckvx
	phx
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $A7
	lda.b $08
	sta.b d0
	lda.w puckvy
	tax
	jsl.l Mul16S
	plx
	lda.b $08
	clc
	adc.b d0
	sta.b d0
	lda.b $0A
	adc.b $A7
	sta.b $A7
	stz.b d1
	lda.w sflags
	bit.w #$1000
	bne .1
	ldy.b a2
	lda.w $1403,y
	phx
	ldx.w #$02BC
	jsl.l CODE_808F98
	lda.b $08
	sta.b d1
	plx
.1:
	lda.b d1
	clc
	adc.w #$2710
	ldy.w position,x
	beq .2
	cpx.w $0D07
	bne .3
.2:
	adc.w #$0BB8
.3:
	phx
	tax
	jsl.l Mul16U
	plx
	lda.b $08
	cmp.b d0
	lda.b $0A
	sbc.b $A7
	bcs .t2
	lda.w position,x
	beq .t1
	lda.b d2
	cmp.w #$0025
	bcc .t1
	jmp.w CODE_9EF699

.t1:
	ldy.b a2
	lda.w #$0008
	sta.w $1203,y
	jmp.w CODE_9EF68B

.t2:
	jmp.w puckglue
