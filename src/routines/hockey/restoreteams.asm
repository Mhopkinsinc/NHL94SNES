; Unidentified routine.
restoreteams:
	stz.b $91
	jsl.l CODE_9FC70D
	lda.w #$0002
	sta.b $91
CODE_9FC70D:
	ldy.b $91
	lda.w #$0006
	sta.w tmap,y
	lda.w #$0032
	sta.b $A5
CODE_9FC71A:
	lda.b $91
	beq CODE_9FC721
	lda.w #$0034
CODE_9FC721:
	clc
	adc.b $A5
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	dec.b $A5
	dec.b $A5
	bpl CODE_9FC71A
	rtl
