; Assignment: the puck carrier
asspuckc:
	cpx.w shotPlIdx
	bne .1
	lda.w $19D4,x
	bmi .clk
.1:
	jmp.w assexit

.t1:
	rtl
.2:
	jsl.l CODE_9E8000
	jmp.w assnothing
.clk:
	lda.w gmclock
	bne .2
	lda.w pflags,x
	bit.w #$0002
	beq .1x
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
.1x:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .3
	adc.w $1323,x
	bpl .3x
.2x:
	lda.w #$0000
.3x:
	sta.w $1003,x
	jsl.l checkob
	lda.w $1E8B
	beq .t1x
	lda.w Ypos,x
	sta.b d0
	bpl .4
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.4:
	cmp.w #$0090
	bpl .t1x
	lda.w #$0010
	sta.b d0
	jsl.l assreplace
	bra CODE_9E8373

.t1x:
	jsl.l chk4lc
	jsl.l chk4shot
	lda.w $0B7D,x
	cmp.w #$0011
	bne .3
	jsl.l chk4pass
.3:
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
	beq .2xx
.1xx:
	lda.w position,x
	sta.b d0
.2xx:
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
	bne .3xx
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.3xx:
	lda.w #$009E
	sta.b $8B
	lda.w #$8374
	sta.b a0
	jml.l CODE_9EA5A4
