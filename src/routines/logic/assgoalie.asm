; Assignment: the goalie
assgoalie:
	lda.w #$0006
	ora.w $0B05,x
	sta.w $0B05,x
	lda.w Xpos,x
	cmp.w #$FFD8
	bmi .2
	cmp.w #$0029
	bpl .2
	lda.w Ypos,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sta.b $00
	cmp.w #$00E4
	bmi .2
	cmp.w #$0104
	bpl .2
	lda.w #$FFFB
	and.w $0B05,x
	sta.w $0B05,x
.2:
	lda.w Xpos,x
	cmp.w #$FFD0
	bmi .4
	cmp.w #$0031
	bpl .4
	lda.w Ypos,x
	bit.w #$8000
	beq .3
	eor.w #$FFFF
	inc a
.3:
	sta.b $00
	cmp.w #$00E4
	bmi .4
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
.4:
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$FFFF
	sta.w $1063,x
.5:
	ldy.w $19D4,x
	bpl .t2
	lda.w Xpos,x
	cmp.w #$FFCB
	bmi .7
	cmp.w #$0035
	bpl .7
	lda.w Ypos,x
	bit.w #$8000
	beq .6
	eor.w #$FFFF
	inc a
.6:
	cmp.w #$010F
	bcs .7
	cmp.w #$00D3
	bcs CODE_9ED41E
.7:
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	ldy.w #$0004
	lda.w Xpos,x
	bpl .8
	ldy.w #$FFFC
.8:
	sty.b d0
	lda.w #$00F4
	sta.b d1
	lda.w pfgoal,x
	beq .9
	lda.w #$FF0C
	sta.b d1
.9:
	jml.l skateto

.t1:
	rtl

.t2:
	lda.w gmclock
	bne .t1x
	cpx.w puckc
	beq .t1x
	jmp.w CODE_9ED44E

.t1x:
	lda.w $0B05,x
	ora.w #$0001
	sta.w $0B05,x
CODE_9ED41E:
	jmp.w CODE_9ED46A
