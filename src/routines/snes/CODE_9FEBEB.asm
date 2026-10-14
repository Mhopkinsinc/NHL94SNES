; Unidentified routine.
CODE_9FEBEB:
	lda.w #$009F
	sta.b $97
	lda.w #$EC8A
	sta.b a3
	lda.w $1EB7
	asl a
	clc
	adc.b a3
	sta.b a3
	lda.b [a3]
	cmp.b d0
	beq .t2
	jmp.w CODE_9FEBA5

.t2:
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $1C94,y
	beq .t1
	lda.w #$009F
	sta.b $9B
	lda.w #$EC57
	sta.b a4
	bra .1

.t1:
	lda.w #$009F
	sta.b $9B
	lda.w #$EC5B
	sta.b a4
.1:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
