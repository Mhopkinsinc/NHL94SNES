; Unidentified routine.
CODE_9DCB9F:
	phy
	phx
	ldx.b a2
	jsl.l CODE_9DCC36
	lda.b d0
	asl a
	tax
	lda.b a2
	beq .t1
	lda.w #$2400
	sta.w $1E87
	lda.w #$2D00
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3472
	bra CODE_9DCBD5

.t1:
	lda.w #$3400
	sta.w $1E87
	lda.w #$5100
	clc
	adc.l DATA8_9DCCAE,x
	sta.l $7E3470
CODE_9DCBD5:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b a2
	beq .1
	clc
	adc.w #$0030
.1:
	plx
	ply
	jsl.l CODE_808E2D
	ldy.b a2
	lda.w HomeTeam,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b a1
	lda.w #$009D
	sta.b $8F
	lda.b [a1]
	sta.b $0C
	inc.b a1
	inc.b a1
	lda.b [a1]
	sta.b $0E
	lda.b a2
	beq .t1
	ldy.w #$0010
	bra CODE_9DCC2E

.t1:
	ldy.w #$0050
CODE_9DCC2E:
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	rtl
