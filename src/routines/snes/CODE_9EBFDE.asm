; Unidentified routine.
CODE_9EBFDE:
	lda.w mesarea
	sta.b d0
	lda.b d1
	cmp.w #$0001
	beq CODE_9EC000
	lda.b d1
	bne .t1
	jsl.l CODE_9EC000
	bra CODE_9EBFFB

.t1:
	lda.b d1
	cmp.w #$FFFF
	bne CODE_9EBFDD
CODE_9EBFFB:
	lda.w mesarea+2
	sta.b d0
org $9EC000
CODE_9EC000:
	lda.b a2
	beq .1
	lda.w #$0034
.1:
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
