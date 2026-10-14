; Unidentified routine.
CODE_9E877B:
	sty.b $89
	lda.w pflags,y
	bit.w #$1000
	bne CODE_9E87AE
	lda.w position,y
	bmi CODE_9E87AE
	lda.w $0EE3,y
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
	sta.w $1063,x
	lda.w #$0000
	sec
	sbc.w $1043,x
	sta.w $1043,x
	lda.w $0D71
	sta.b $A5
	lda.w $1043,x
	eor.b $A5
	sta.b $A9
	bpl CODE_9E87E9
	stz.w $1043,x
CODE_9E87E9:
	lda.w $1043,x
	sta.b $A5
	lda.w $1063,x
	sta.b $A9
	lda.w #$009E
	sta.b $8B
	lda.w #CODE_9ED0FC
	sta.b $89
	jsl.l CODE_9EA5A4
	jmp.w CODE_9EA164
	cpx.w $0AD9
	beq CODE_9E8822
	ldy.w $0AD9
	bmi CODE_9E882A
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E882A
	lda.w #$0002
	sta.b $A5
	jmp.w CODE_9E8C18
