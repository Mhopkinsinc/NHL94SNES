; Fill the other-scores rows, skipping this game.
FillOtherScores:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l printfontset
	jsl.l MemFill
	lda.w $1DC1
	cmp.w #$0001
	beq .4
	lda.w #$2400
	sta.w $0D0D
	lda.w #$0000
	sta.w printy
	lda.b $00
	sta.w $1DB9
	stz.w $1DE9
.2:
	cmp.l $7E35D6
	bne .t1
.1:
	inc.w $1DE9
	bra .3

.t1:
	lda.w $1DB9
	cmp.w $1DC1
	beq .4
	jsr.w PrintOtherScore
	inc.w printy
.3:
	lda.w $1DB9
	inc a
	sta.w $1DB9
	bra .2
.4:
	rtl
