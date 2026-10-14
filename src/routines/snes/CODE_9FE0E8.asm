; Unidentified routine.
CODE_9FE0E8:
	ldx.w #$026F
.2:
	lda.w #$000E
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc .1
	lda.w #$000C
.1:
	sta.b $14
	lda.w $0792
	and.w #$0010
	beq .4
	sep #$20
	lda.b $14
	sta.w $1A12,x
.3:
	rep #$20
	dex
	bpl .2
	rtl
.4:
	sep #$20
	lda.b #$00
	sec
	sbc.b $14
	sta.w $1A12,x
	bra .3
