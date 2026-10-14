; Unidentified routine.
CODE_9EA967:
	lda.b d2
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
	lda.w $1523,x
	bne CODE_9EA9B0
	lda.w $0EC3,x
	sta.b d0
	ora.w $0EE3,x
	beq CODE_9EA9A7
	lda.w $0EE3,x
	sta.b d1
	jsl.l vtoa
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9B0
CODE_9EA9A7:
	inc a
	sta.w $1523,x
	bra CODE_9EA9B0
