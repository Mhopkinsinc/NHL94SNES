; Unidentified routine.
CODE_9E830D:
	jsl.l CODE_9FDBD0
	jsl.l CODE_9EDED4
	lda.w $0B7D,x
	cmp.w #$0011
	bne CODE_9E8321
	jsl.l CODE_9EE89F
CODE_9E8321:
	lda.w #$0006
	clc
	adc.w $1043,x
	sta.b d0
	lda.w #$0080
	sta.b $8B
	lda.w #$D398
	sta.b a0
	lda.w sflags
	bit.w #$8000
	beq CODE_9E8341
CODE_9E833C:
	lda.w position,x
	sta.b d0
CODE_9E8341:
	lda.b d0
	asl a
	asl a
	tay
	lda.b [a0],y
	sta.b d0
	iny
	iny
	lda.b [a0],y
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9E8365
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9E8365:
	lda.w #$009E
	sta.b $8B
	lda.w #$8374
	sta.b a0
	jml.l CODE_9EA5A4
