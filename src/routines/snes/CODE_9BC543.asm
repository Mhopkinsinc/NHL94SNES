; Unidentified routine.
CODE_9BC543:
	lda.w $1DB9
	asl a
	tax
	lda.l $7E3578,x
	sta.b d0
	lda.l $7E3528,x
	jsr.w CODE_9BC601
	inc.w printy
	lda.l $7E3588,x
	sta.b d0
	lda.l $7E3538,x
	jsr.w CODE_9BC601
	lda.w #$0017
	sta.w printx
	lda.l $7E3568,x
	sta.b d0
	lda.l $7E3578,x
	cmp.l $7E3588,x
	beq .2
	lda.b d0
	cmp.w #$0004
	bne .2
.1:
	inc.b d0
.2:
	lda.w #$0080
	sta.b $8B
	lda.w #$D6E1
	sta.b a0
.loop:
	lda.b $8B
	sta.b $8F
	lda.b a0
	sta.b a1
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	dec.b d0
	bmi .3
	bne .loop
.3:
	jsl.l CODE_9EC894
	inc.w printy
	rts
