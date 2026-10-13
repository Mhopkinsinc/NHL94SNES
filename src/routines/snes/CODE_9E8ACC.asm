; Unidentified routine.
CODE_9E8ACC:
	clc
	adc.w aidef,x
	bpl CODE_9E8AD5
CODE_9E8AD2:
	lda.w #$0000
CODE_9E8AD5:
	sta.w temp1,x
	lda.w pucky
	sta.b $A5
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
	adc.b $A5
	sta.b $B1
	lda.w pfgoal,x
	bne CODE_9E8B08
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $B1
	sta.b $B1
CODE_9E8B08:
	stz.b $AD
	lda.b $B1
	sec
	sbc.w #$FFA8
	bmi CODE_9E8B38
	lda.w #$0008
	sta.b $AD
	lda.b $A5
	sec
	sbc.w #$0058
	bmi CODE_9E8B38
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8B38
	asl.b $AD
	lda.b $B1
	sec
	sbc.w #$0108
	bmi CODE_9E8B38
	lda.w #$0018
	sta.b $AD
CODE_9E8B38:
	lda.b $AD
	cmp.w temp5,x
	bne CODE_9E8B47
	lda.w seed
	cmp.w #$0200
	bcs CODE_9E8B79
CODE_9E8B47:
	lda.b $AD
	sta.w temp5,x
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9E8BB7
	sta.b $89
	iny
	iny
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w temp3,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [$89],y
	dey
	dey
	jsl.l CODE_9BB3A4
	adc.b [$89],y
	sta.w temp4,x
CODE_9E8B79:
	lda.w temp3,x
	sta.b $A5
	lda.w position,x
	cmp.w #$0005
	beq CODE_9E8B8E
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E8B8E:
	lda.w temp4,x
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9E8BA8
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9E8BA8:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	jml.l CODE_9EA5A4
