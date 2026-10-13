; Unidentified routine.
CODE_9E877B:
	sty.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E87AE
	lda.w position,y
	bmi CODE_9E87AE
	lda.w Yvel,y
	bpl CODE_9E8792
	lda.w #$0000
CODE_9E8792:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq CODE_9E879F
CODE_9E879C:
	ora.w #$F800
CODE_9E879F:
	clc
	adc.w Ypos,y
	sta.b $A9
	sec
	sbc.b $A5
	bmi CODE_9E87AE
	lda.b $A9
	sta.b $A5
CODE_9E87AE:
	ldy.b $89
	iny
	iny
	dec.b $AD
	bne CODE_9E877B
	lda.b $A5
	clc
	adc.w #$0028
	sta.b $A5
	sec
	sbc.w #$00BE
	bmi CODE_9E87C9
	lda.w #$00DC
	sta.b $A5
CODE_9E87C9:
	lda.b $A5
	sta.w temp4,x
	lda.w #$0000
	sec
	sbc.w temp3,x
	sta.w temp3,x
	lda.w puckx
	sta.b $A5
	lda.w temp3,x
	eor.b $A5
	sta.b $A9
	bpl CODE_9E87E9
	stz.w temp3,x
CODE_9E87E9:
	lda.w temp3,x
	sta.b $A5
	lda.w temp4,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w $A164
