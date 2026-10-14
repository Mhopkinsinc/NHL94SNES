; Unidentified routine.
CODE_9E8A90:
	lda.w gmclock
	bne CODE_9E8A85
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E8A84
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w temp5,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.1:
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .t1
	jmp.w CODE_9E8B79

.t1:
	clc
	adc.w aidef,x
	bpl .2
.1x:
	lda.w #$0000
.2:
	sta.w temp1,x
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
	beq .3
	ora.w #$FC00
.3:
	clc
	adc.b d0
	sta.b d3
	lda.w pfgoal,x
	bne .4
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
.4:
	stz.b d2
	lda.b d3
	sec
	sbc.w #$FFA8
	bmi .5
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi .5
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .5
	asl.b d2
	lda.b d3
	sec
	sbc.w #$0108
	bmi .5
	lda.w #$0018
	sta.b d2
.5:
	lda.b d2
	cmp.w temp5,x
	bne .6
	lda.w seed
	cmp.w #$0200
	bcs CODE_9E8B79
.6:
	lda.b d2
	sta.w temp5,x
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
	sta.w temp3,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w temp4,x
CODE_9E8B79:
	lda.w temp3,x
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	beq .1
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.1:
	lda.w temp4,x
	sta.b d1
	lda.w pfgoal,x
	bne .2
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.2:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l CODE_9EA5A4

.t1:
	rtl
