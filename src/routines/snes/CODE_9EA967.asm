; Unidentified routine.
CODE_9EA967:
	lda.b $AD
	sec
	sbc.w #$0003
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	jsl.l vtoa
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcs CODE_9EA9AD
CODE_9EA983:
	lda.w pfrev,x
	bne CODE_9EA9B0
	lda.w Xvel,x
	sta.b $A5
	ora.w Yvel,x
	beq CODE_9EA9A7
	lda.w Yvel,x
	sta.b $A9
	jsl.l vtoa
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9B0
CODE_9EA9A7:
	inc a
	sta.w pfrev,x
	bra CODE_9EA9B0
