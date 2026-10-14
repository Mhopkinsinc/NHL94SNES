; Unidentified routine.
CODE_9EBFF4:
	lda.b d1
	cmp.w #$FFFF
	bne CODE_9EBFDD
CODE_9EBFFB:
	lda.w mesarea+2
	sta.b d0
org $9EC000
CODE_9EC000:
	lda.b a2
	beq CODE_9EC007
	lda.w #$0034
CODE_9EC007:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$0006
	bpl CODE_9EBFDD
	lda.w tmpdst,y
	bne CODE_9EC01C
	jsl.l releasepl
CODE_9EC01C:
	rtl
