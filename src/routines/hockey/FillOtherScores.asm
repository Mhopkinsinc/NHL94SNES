; Fill the other-scores rows, skipping this game.
FillOtherScores:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l smallfontchars
	clc
	adc.l printfontset
	jsl.l MemFill
	lda.w listend
	cmp.w #$0001
	beq .4
	lda.w #$2400
	sta.w printa
	lda.w #$0000
	sta.w printy
	lda.b $00
	sta.w curitem
	stz.w otherskip
.2:
	cmp.l gamenum
	bne .t1
.1:
	inc.w otherskip
	bra .3

.t1:
	lda.w curitem
	cmp.w listend
	beq .4
	jsr.w PrintOtherScore
	inc.w printy
.3:
	lda.w curitem
	inc a
	sta.w curitem
	bra .2
.4:
	rtl
