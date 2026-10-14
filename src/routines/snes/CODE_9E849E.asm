; Unidentified routine.
CODE_9E849E:
	clc
	adc.w $1343,x
	bpl CODE_9E84A7
CODE_9E84A4:
	lda.w #$0000
CODE_9E84A7:
	sta.w $1003,x
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne CODE_9E84BC
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9E84BC:
	stz.b d2
	lda.b d0
	sec
	sbc.w #$FFA8
	bmi CODE_9E84EC
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi CODE_9E84EC
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E84EC
	asl.b d2
	lda.b d0
	sec
	sbc.w #$0108
	bmi CODE_9E84EC
	lda.w #$0018
	sta.b d2
CODE_9E84EC:
	lda.b d2
	cmp.w $1083,x
	bne CODE_9E84FB
	lda.w $0794
	cmp.w #$0200
	bcs CODE_9E852D
CODE_9E84FB:
	lda.b d2
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8553
	sta.b a0
	iny
	iny
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w $1043,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w $1063,x
CODE_9E852D:
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9E8544
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9E8544:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l CODE_9EA5A4
