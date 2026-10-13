; Unidentified routine.
CODE_9E8981:
	lda.w gmclock
	bne CODE_9E897E
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E897D
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E89A9
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9E89A9:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9E89C0
	clc
	adc.w aidef,x
	bpl CODE_9E89BD
CODE_9E89BA:
	lda.w #$0000
CODE_9E89BD:
	sta.w temp1,x
CODE_9E89C0:
	lda.w #$0064
	sta.b $A5
	lda.w position,x
	cmp.w #$0005
	bne CODE_9E89D2
	lda.w #$FF9C
	sta.b $A5
CODE_9E89D2:
	ldy.w puckc
	lda.w pfgoal,x
	beq CODE_9E8A18
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$FF62
	sta.b $A9
	lda.w #$FFB2
	sta.b $AD
	lda.w position,y
	beq CODE_9E8A4B
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E8A4B
	lda.b $AD
	sec
	sbc.w pucky
	bpl CODE_9E8A0B
	lda.w pucky
	sta.b $A9
	bra CODE_9E8A4F
