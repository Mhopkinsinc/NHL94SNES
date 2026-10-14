; Unidentified routine.
CODE_9BC5AB:
	cmp.w #$000D
	beq CODE_9BC5D0
	cmp.w #$000E
	beq CODE_9BC5DC
	asl a
	asl a
	tay
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b a1
	lda.b [a1],y
	sta.b a1
	ldy.w #$0004
	clc
	adc.b [a1],y
	sta.b a1
	bra CODE_9BC5E6
