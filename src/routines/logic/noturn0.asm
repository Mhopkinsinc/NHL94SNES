; The wanted direction needs no turn
noturn0:
	lda.w #$0002
	sta.b d4
	lda.w $1523,x
	beq CODE_9EAAC9
	lda.w #$0006
	sta.b d4
	lda.b d0
	eor.w #$0008
	sta.b d0
CODE_9EAAC9:
	lda.b d0
	beq CODE_9EAB25
	lda.w $0EC3,x
	sta.b d0
	lda.w $0EE3,x
	sta.b d1
	jsl.l vtoa
	bit.w #$0008
	bne CODE_9EAAF4
	sec
	sbc.w facedir,x
	clc
	adc.b d4
	and.w #$0007
	sta.b d0
	cmp.w #$0004
	bcs CODE_9EAAF4
	jmp.w CODE_9EA4F7
