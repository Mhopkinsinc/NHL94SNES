; Unidentified routine.
CODE_9E82A7:
	lda.w gmclock
	bne CODE_9E82A0
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b
	lda.w seed
	and.w #$0003
	sta.w temp3,x
.1:
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl CODE_9E8321
	adc.w aioff,x
	bpl .3
.2:
	lda.w #$0000
.3:
	sta.w temp1,x
	jsl.l CODE_9EC417
	lda.w $1E8B
	beq .t1
	lda.w Ypos,x
	sta.b d0
	bpl .4
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.4:
	cmp.w #$0090
	bpl .t1
	lda.w #$0010
	sta.b d0
	jsl.l assreplace
	bra CODE_9E8373

.t1:
	jsl.l CODE_9FDBD0
	jsl.l CODE_9EDED4
	lda.w $0B7D,x
	cmp.w #$0011
	bne CODE_9E8321
	jsl.l CODE_9EE89F
CODE_9E8321:
	lda.w #$0006
	clc
	adc.w temp3,x
	sta.b d0
	lda.w #$0080
	sta.b $8B
	lda.w #$D398
	sta.b a0
	lda.w sflags
	bit.w #$8000
	beq .2
.1:
	lda.w position,x
	sta.b d0
.2:
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
	bne .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.3:
	lda.w #$009E
	sta.b $8B
	lda.w #$8374
	sta.b a0
	jml.l CODE_9EA5A4
