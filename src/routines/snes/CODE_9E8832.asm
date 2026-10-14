; Unidentified routine.
CODE_9E8832:
	jsl.l check4bench
	lda.w $19D4,x
	bpl CODE_9E881E
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E8855
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9E8855:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl CODE_9E886C
	clc
	adc.w $1323,x
	bpl CODE_9E8869
CODE_9E8866:
	lda.w #$0000
CODE_9E8869:
	sta.w $1003,x
CODE_9E886C:
	lda.w #$009E
	sta.b $8B
	lda.w #$8904
	sta.b a0
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
	sty.b d0
	lda.w $0D71
	eor.b d0
	bmi CODE_9E889E
	lda.w $0D71
	bra CODE_9E88A8
