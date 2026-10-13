; Unidentified routine.
CODE_9E8832:
	jsl.l CODE_9FDC4C
	lda.w $19D4,x
	bpl CODE_9E881E
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8855
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9E8855:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9E886C
	clc
	adc.w aioff,x
	bpl CODE_9E8869
CODE_9E8866:
	lda.w #$0000
CODE_9E8869:
	sta.w temp1,x
CODE_9E886C:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b $89
	ldy.w #$0050
	lda.w position,x
	cmp.w #$0002
	beq CODE_9E8884
	ldy.w #$FFB0
CODE_9E8884:
	lda.w pfgoal,x
	bne CODE_9E888F
	tya
	eor.w #$FFFF
	inc a
	tay
CODE_9E888F:
	sty.b $A5
	lda.w puckx
	eor.b $A5
	bmi CODE_9E889E
	lda.w puckx
	bra CODE_9E88A8
