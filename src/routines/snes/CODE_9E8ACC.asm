; Unidentified routine.
CODE_9E8ACC:
	clc
	adc.w $1343,x
	bpl CODE_9E8AD5
CODE_9E8AD2:
	lda.w #$0000
CODE_9E8AD5:
	sta.w $1003,x
	lda.w pucky
	sta.b d0
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8AEE
	ora.w #$FC00
CODE_9E8AEE:
	clc
	adc.b d0
	sta.b d3
	lda.w pfgoal,x
	bne CODE_9E8B08
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
CODE_9E8B08:
	stz.b d2
	lda.b d3
	sec
	sbc.w #$FFA8
	bmi CODE_9E8B38
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi CODE_9E8B38
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8B38
	asl.b d2
	lda.b d3
	sec
	sbc.w #$0108
	bmi CODE_9E8B38
	lda.w #$0018
	sta.b d2
CODE_9E8B38:
	lda.b d2
	cmp.w $1083,x
	bne CODE_9E8B47
	lda.w $0792
	cmp.w #$0200
	bcs CODE_9E8B79
CODE_9E8B47:
	lda.b d2
	sta.w $1083,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8BB7
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
CODE_9E8B79:
	lda.w $1043,x
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	beq CODE_9E8B8E
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9E8B8E:
	lda.w $1063,x
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9E8BA8
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9E8BA8:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l CODE_9EA5A4
