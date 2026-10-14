; Unidentified routine.
CODE_9ED179:
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
	cmp.w #$00E4
	bmi .4
	lda.w #$FFFD
	and.w $0B05,x
	sta.w $0B05,x
.4:
	lda.w $19D4,x
	bpl CODE_9ED214
	lda.w gmclock
	bne CODE_9ED214
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$0002
	beq .5
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w $0BC9
.5:
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl CODE_9ED24D
	lda.w aidef,x
	lsr a
	lsr a
	clc
	adc.w temp1,x
	bpl CODE_9ED217
	lda.w #$0000
	bra CODE_9ED217
