; Unidentified routine.
noturn0:
	lda.w #$0002
	sta.b $B5
	lda.w pfrev,x
	beq CODE_9EAAC9
	lda.w #$0006
	sta.b $B5
	lda.b $A5
	eor.w #$0008
	sta.b $A5
CODE_9EAAC9:
	lda.b $A5
	beq CODE_9EAB25
	lda.w Xvel,x
	sta.b $A5
	lda.w Yvel,x
	sta.b $A9
	jsl.l vtoa
	bit.w #$0008
	bne CODE_9EAAF4
	sec
	sbc.w facedir,x
	clc
	adc.b $B5
	and.w #$0007
	sta.b $A5
	cmp.w #$0004
	bcs CODE_9EAAF4
	jmp.w $A4F7
