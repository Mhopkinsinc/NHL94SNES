; A computer player looks for a shot
chk4shot:
	lda.w gmclock
	bne .t2
	lda.w gameclock
	cmp.w #$0005
	bcs .t2
	jmp.w CompShoot

.t2:
	lda.w $163A
	bne .t1
	jsl.l chkpk
	bne .t1
	lda.w $0D2D
	beq .t1
	lda.w Ypos,x
	cmp.w #$FF13
	bmi .t1
	cmp.w #$00ED
	bpl .t1
	lda.w $0792
	and.w #$0003
	bne .t1
	jmp.w CODE_9EED85

.t1:
	lda.w #$0020
	sec
	sbc.w $13E3,x
	asl a
	asl a
	asl a
	asl a
	sta.b d4
	ldy.w #$0108
	lda.w pfgoal,x
	bne .1
	ldy.w #$FEF8
.1:
	sty.b d1
	tya
	sec
	sbc.w pucky
	sta.b d1
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDF9B
	lda.w $0D71
	cmp.w #$0064
	bpl CODE_9EDF9B
	cmp.w #$FF9C
	bmi CODE_9EDFAF
	eor.w #$FFFF
	inc a
	pha
	tax
	jsl.l CODE_808F7D
	sta.b d0
	lda.b d1
	tax
	jsl.l CODE_808F7D
	ldx.b $E4
	clc
	adc.b d0
	sta.b tmp0
	pla
	sta.b d0
	lda.b tmp0
	cmp.w #$2711
	lsr.b d4
	lsr.b d4
	lsr.b d4
	lsr.b d4
	jsl.l vtoa
	sta.b d5
	lda.w #$0005
	sta.b d3
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
	cmp.b d5
	bne CODE_9EDFA9
	asl.b d4
	bra CODE_9EDFA9
