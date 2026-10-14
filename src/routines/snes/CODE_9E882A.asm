; Unidentified routine.
CODE_9E882A:
	lda.w gmclock
	beq .t2
	jmp.w assnothing

.t2:
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E881E
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
.1:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl .4
	clc
	adc.w $1323,x
	bpl .3
.2:
	lda.w #$0000
.3:
	sta.w $1003,x
.4:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
	ldy.w #$0050
	lda.w position,x
	cmp.w #$0002
	beq .5
	ldy.w #$FFB0
.5:
	lda.w pfgoal,x
	bne .6
	tya
	eor.w #$FFFF
	inc a
	tay
.6:
	sty.b d0
	lda.w $0D71
	eor.b d0
	bmi .t3
	lda.w $0D71
	bra .7

.t1:
	rtl

.t3:
	lda.w $0D71
	pha
	asl a
	pla
	ror a
	clc
	adc.b d0
.7:
	sta.b d0
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .10
	lda.w pucky
	sta.b d2
	lda.w pfgoal,x
	bne .1x
	lda.w #$0000
	sec
	sbc.b d2
	sta.b d2
.1x:
	lda.b d2
	cmp.w #$FFA8
	bmi .t2x
	cmp.w #$0058
	bmi .t1x
	lda.w #$0062
	sta.b d1
	bra .8

.t1x:
	lda.w #$FFB2
	sta.b d1
	bra .8

.t2x:
	lda.w #$FF28
	sta.b d1
.8:
	lda.w pfgoal,x
	bne .9
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.9:
	jmp.w CODE_9EA5A4
.10:
	ldy.w #$0062
	lda.w pfgoal,x
	beq .1xx
	ldy.w #$FF9E
.1xx:
	sty.b d1
	bra .9
	lda.w shotPlIdx
	bmi .t1xx
	lda.w $0EC4,x
	sec
	sbc.w $0EE0
	and.w #$00FF
	bit.w #$0080
	beq .2x
	ora.w #$FF00
.2x:
	clc
	adc.w Xpos,x
	sec
	sbc.w $0D71
	cmp.w #$FFD7
	bmi .t1xx
	cmp.w #$0029
	bpl .t1xx
	lda.w $0EE4,x
	sec
	sbc.w $0F00
	and.w #$00FF
	bit.w #$0080
	beq .3x
	ora.w #$FF00
.3x:
	clc
	adc.w Ypos,x
	sec
	sbc.w pucky
	cmp.w #$FFD7
	bmi .t1xx
	cmp.w #$0029
	bpl .t1xx
	lda.w Xpos,x
	sec
	sbc.w $0D71
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w pucky
	sta.b d1
	jml.l vtoa

.t1xx:
	rtl
