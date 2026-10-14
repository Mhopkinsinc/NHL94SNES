; Unidentified routine.
CODE_9E8462:
	lda.w gmclock
	bne CODE_9E8457
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E8456
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
	jmp.w CODE_9E852D

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
	lda.w pfgoal,x
	bne .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3:
	stz.b d2
	lda.b d0
	sec
	sbc.w #$FFA8
	bmi .4
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$0058
	bmi .4
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .4
	asl.b d2
	lda.b d0
	sec
	sbc.w #$0108
	bmi .4
	lda.w #$0018
	sta.b d2
.4:
	lda.b d2
	cmp.w temp5,x
	bne .5
	lda.w $0794
	cmp.w #$0200
	bcs CODE_9E852D
.5:
	lda.b d2
	sta.w temp5,x
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
CODE_9E852D:
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.1:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	jml.l CODE_9EA5A4

.t1:
	rtl
