; Unidentified routine.
a2offsides:
	ldy.b $91
	lda.w gmode
	bit.w #$0020
	beq CODE_9EC64A
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,y
	bne CODE_9EC60C
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EC60C:
	lda.b $A5
	cmp.w #$0058
	bmi CODE_9EC64A
	stz.b $89
	lda.w pfteam,y
	beq CODE_9EC61F
	lda.w #$0002
	sta.b $89
CODE_9EC61F:
	ldy.b $89
	lda.w tmflags,y
	bit.w #$0010
	beq CODE_9EC64A
	lda.w gmode
	bit.w #$0010
	bne CODE_9EC64A
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	lda.w #$0012
	sta.b $A5
	jsl.l AddPenalty
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
CODE_9EC64A:
	rtl
