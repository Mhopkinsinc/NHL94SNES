; Unidentified routine.
CODE_9EBFF4:
	lda.b $A9
	cmp.w #$FFFF
	bne CODE_9EBFDD
CODE_9EBFFB:
	lda.w $0A2C
	sta.b $A5
org $9EC000
CODE_9EC000:
	lda.b $91
	beq CODE_9EC007
	lda.w #$0034
CODE_9EC007:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	cmp.w #$0006
	bpl CODE_9EBFDD
	lda.w tmpdst,y
	bne CODE_9EC01C
	jsl.l releasepl
CODE_9EC01C:
	rtl
