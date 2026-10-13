; Unidentified routine.
CODE_9BC543:
	lda.w $1DB9
	asl a
	tax
	lda.l $7E3578,x
	sta.b $A5
	lda.l $7E3528,x
	jsr.w $C601
	inc.w printy
	lda.l $7E3588,x
	sta.b $A5
	lda.l $7E3538,x
	jsr.w $C601
	lda.w #$0017
	sta.w printx
	lda.l $7E3568,x
	sta.b $A5
	lda.l $7E3578,x
	cmp.l $7E3588,x
	beq CODE_9BC584
	lda.b $A5
	cmp.w #$0004
	bne CODE_9BC584
CODE_9BC582:
	inc.b $A5
CODE_9BC584:
	lda.w #$0080
	sta.b $8B
	lda.w #$D6E1
	sta.b $89
CODE_9BC58E:
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.b [$89]
	clc
	adc.b $89
	sta.b $89
	dec.b $A5
	bmi CODE_9BC5A3
	bne CODE_9BC58E
CODE_9BC5A3:
	jsl.l CODE_9EC894
	inc.w printy
	rts
