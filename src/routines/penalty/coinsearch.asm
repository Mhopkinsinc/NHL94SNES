; Unidentified routine.
coinsearch:
	lda.w #$0006
	sta.b $A9
	lda.w #$0032
	sta.b $A5
CODE_9EB701:
	lda.b $91
	beq CODE_9EB708
	lda.w #$0034
CODE_9EB708:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9EB727
	beq CODE_9EB727
	and.w #$DFFF
	sta.w tmpdst,y
	bit.w #$5000
	bne CODE_9EB727
	lda.b $A9
	cmp.w #$0004
	beq CODE_9EB727
	dec.b $A9
CODE_9EB727:
	dec.b $A5
	dec.b $A5
	bpl CODE_9EB701
	ldy.b $91
	lda.b $A9
	sta.w tmap,y
	rtl
