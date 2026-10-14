; Unidentified routine.
CODE_9E8981:
	lda.w gmclock
	bne CODE_9E897E
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E897D
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E89A9
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E89A9:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl CODE_9E89C0
	clc
	adc.w $1343,x
	bpl CODE_9E89BD
CODE_9E89BA:
	lda.w #$0000
CODE_9E89BD:
	sta.w $1003,x
CODE_9E89C0:
	lda.w #$0064
	sta.b d0
	lda.w position,x
	cmp.w #$0005
	bne CODE_9E89D2
	lda.w #$FF9C
	sta.b d0
CODE_9E89D2:
	ldy.w $0AD9
	lda.w pfgoal,x
	beq CODE_9E8A18
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$FF62
	sta.b d1
	lda.w #$FFB2
	sta.b d2
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b d2
	sec
	sbc.w pucky
	bpl CODE_9E8A0B
	lda.w pucky
	sta.b d1
	bra CODE_9E8A4F
