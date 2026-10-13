; Unidentified routine.
CODE_9EDF0C:
	lda.w #$0020
	sec
	sbc.w $13E3,x
	asl a
	asl a
	asl a
	asl a
	sta.b $B5
	ldy.w #$0108
	lda.w pfgoal,x
	bne CODE_9EDF24
	ldy.w #$FEF8
CODE_9EDF24:
	sty.b $A9
	tya
	sec
	sbc.w pucky
	sta.b $A9
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDF9B
	lda.w puckx
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDFAF
	eor.w #$FFFF
	inc a
	pha
	tax
	jsl.l CODE_808F7D
	sta.b $A5
	lda.b $A9
	tax
	jsl.l CODE_808F7D
	ldx.b $E4
	clc
	adc.b $A5
	sta.b $C5
	pla
	sta.b $A5
	lda.b $C5
	cmp.w #$2711
	lsr.b $B5
	lsr.b $B5
	lsr.b $B5
	lsr.b $B5
	jsl.l vtoa
	sta.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9EDF84
	ldy.w #$000C
CODE_9EDF84:
	lda.w position,y
	beq CODE_9EDF9D
	lda.w $0B5D,y
	sec
	sbc.w #$0004
	and.w #$0007
	cmp.b $B9
	bne CODE_9EDFA9
	asl.b $B5
	bra CODE_9EDFA9
