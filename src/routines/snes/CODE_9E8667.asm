; Unidentified routine.
CODE_9E8667:
	clc
	adc.w $1343,x
	bpl CODE_9E8670
CODE_9E866D:
	lda.w #$0000
CODE_9E8670:
	sta.w $1003,x
	lda.w pucky
	sta.b d1
	lda.w puckvy
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0200
	beq CODE_9E8689
	ora.w #$FC00
CODE_9E8689:
	sta.b d3
	lda.w pfgoal,x
	bne CODE_9E86A0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
CODE_9E86A0:
	lda.b d3
	bpl CODE_9E86A6
	stz.b d3
CODE_9E86A6:
	lda.b d3
	clc
	adc.b d1
	sta.b d3
	sec
	sbc.w #$0058
	bmi CODE_9E86E1
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne CODE_9E86E1
	lda.w $0AD9
	bmi CODE_9E86C3
	lsr a
CODE_9E86C3:
	sta.b d1
	bmi CODE_9E86E1
	jsl.l chkpk
	beq CODE_9E86E1
	lda.b d1
	sec
	sbc.w #$0006
	sta.b d1
	txa
	lsr a
	sec
	sbc.w #$0006
	sta.b d2
	eor.b d1
	sta.b d1
CODE_9E86E1:
	lda.w #$0041
	sta.w $1043,x
	lda.w position,x
	cmp.w #$0002
	beq CODE_9E86F5
	lda.w #$FFBF
	sta.w $1043,x
CODE_9E86F5:
	ldy.w #$0000
	cpx.w #$000C
	bcs CODE_9E8700
	ldy.w #$000C
CODE_9E8700:
	lda.w #$0006
	sta.b d2
	lda.w #$FC18
	sta.b d0
	lda.w pfgoal,x
	beq CODE_9E877B
	lda.w #$03E8
	sta.b d0
CODE_9E8714:
	sty.b a0
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E8747
	lda.w position,y
	bmi CODE_9E8747
	lda.w $0EE3,y
	bmi CODE_9E872B
	lda.w #$0000
CODE_9E872B:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #DMA_OAM
	beq CODE_9E8738
	ora.w #$F800
CODE_9E8738:
	clc
	adc.w Ypos,y
	sta.b d1
	sec
	sbc.b d0
	bpl CODE_9E8747
	lda.b d1
	sta.b d0
CODE_9E8747:
	ldy.b a0
	iny
	iny
	dec.b d2
	bne CODE_9E8714
	lda.b d0
	sec
	sbc.w #$0028
	sta.b d0
	sec
	sbc.w #$FF42
	bpl CODE_9E8762
	lda.w #$FF24
	sta.b d0
CODE_9E8762:
	lda.b d0
	sta.w $1063,x
	lda.w $0D71
	sta.b d0
	lda.w $1043,x
	eor.b d0
	sta.b d1
	bpl CODE_9E87E9
	stz.w $1043,x
	bra CODE_9E87E9
