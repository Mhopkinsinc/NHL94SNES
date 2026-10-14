; Unidentified routine.
CODE_9EBFDE:
	lda.w mesarea
	sta.b d0
	lda.b d1
	cmp.w #$0001
	beq .2
	lda.b d1
	bne .t1
	jsl.l .2
	bra .1

.t1:
	lda.b d1
	cmp.w #$FFFF
	bne CODE_9EBFDD
.1:
	lda.w mesarea+2
	sta.b d0
org $9EC000
.2:
	lda.b a2
	beq .1x
	lda.w #$0034
.1x:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$0006
	bpl CODE_9EBFDD
	lda.w tmpdst,y
	bne .rtl
	jsl.l releasepl
.rtl:
	rtl
