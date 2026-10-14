; Unidentified routine.
CODE_9DC9A8:
	sta.b d0
	lda.l $7E3474
	beq .t1
	jmp.w CODE_9DCB9F

.t1:
	phy
	phx
	lda.b a2
	beq .t2
	lda.w #$2400
	sta.w $1E87
	bra .1

.t2:
	lda.w #$3400
	sta.w $1E87
.1:
	lda.b d0
	ldy.b a2
	sta.b d0
	lda.w HomeTeam,y
	ldx.w #$001A
	jsl.l Mul8U
	clc
	adc.b d0
	asl a
	asl a
	tax
	lda.l PlayerPhotoTable,x
	sta.b $0C
	lda.l PlayerPhotoTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $00
	lda.b a2
	beq .t1x
	lda.w #$6900
	sta.b $10
	sta.l $7E3472
	bra .2

.t1x:
	lda.w #$6F00
	sta.b $10
	sta.l $7E3470
.2:
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	jsl.l LinearToPlanar
	jsl.l CODE_9DCB1C
	bne .t1xx
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
	beq .1x
	clc
	adc.w #$0030
.1x:
	plx
	ply
	jsl.l CODE_808E2D
	bra .3

.t1xx:
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
	beq .1xx
	clc
	adc.w #$0030
.1xx:
	plx
	ply
	jsl.l CODE_9DCAB7
.3:
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
	beq .t1xxx
	ldy.w #$0010
	bra .4

.t1xxx:
	ldy.w #$0050
.4:
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	rtl
