; Unidentified routine.
CODE_9E877B:
	sty.b a0
	lda.w pflags,y
	bit.w #$1000
	bne .4
	lda.w position,y
	bmi .4
	lda.w $0EE3,y
	bpl .1
	lda.w #$0000
.1:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0400
	beq .3
.2:
	ora.w #$F800
.3:
	clc
	adc.w Ypos,y
	sta.b d1
	sec
	sbc.b d0
	bmi .4
	lda.b d1
	sta.b d0
.4:
	ldy.b a0
	iny
	iny
	dec.b d2
	bne CODE_9E877B
	lda.b d0
	clc
	adc.w #$0028
	sta.b d0
	sec
	sbc.w #$00BE
	bmi .5
	lda.w #$00DC
	sta.b d0
.5:
	lda.b d0
	sta.w $1063,x
	lda.w #$0000
	sec
	sbc.w $1043,x
	sta.w $1043,x
	lda.w $0D71
	sta.b d0
	lda.w $1043,x
	eor.b d0
	sta.b d1
	bpl CODE_9E87E9
	stz.w $1043,x
CODE_9E87E9:
	lda.w $1043,x
	sta.b d0
	lda.w $1063,x
	sta.b d1
	lda.w #$009E
	sta.b $8B
	lda.w #rtss
	sta.b a0
	jsl.l CODE_9EA5A4
	jmp.w check4check
