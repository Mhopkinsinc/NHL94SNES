; Unidentified routine.
CODE_9EA5A4:
	lda.w temp2,x
	sec
	sbc.w $0ADB
	sta.w temp2,x
	bmi .t2
	jmp.w CODE_9EA694

.t2:
	adc.w #$000C
	sta.w temp2,x
	lda.b d0
	sta.b $A7
	lda.b d1
	sta.b $AB
	jsl.l CODE_9EAB74
	lda.w Xvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	eor.w #$FFFF
	inc a
	sta.b $14
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Yvel,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	eor.w #$FFFF
	inc a
	sta.b $16
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w position,x
	bne .3
	lda.w $0B05,x
	bit.w #$0002
	beq CODE_9EA65A
.3:
	lda.b d0
	pha
	lda.b d1
	pha
	ldy.w Xvel,x
	lda.w Yvel,x
	jsl.l CODE_9CA554
	pha
	lda.b $14
	clc
	adc.b $A7
	sec
	sbc.w Xpos,x
	tay
	lda.b $16
	clc
	adc.b $AB
	sec
	sbc.w Ypos,x
	jsl.l CODE_9CA554
	tay
	pla
	sta.b $14
	pla
	sta.b d1
	pla
	sta.b d0
	lda.b $14
	cmp.w #$1000
	bcs .t1
	cpy.w #$0005
	bpl CODE_9EA65A
	bra CODE_9EA653

.t1:
	cpy.w #$000C
	bpl CODE_9EA65A
CODE_9EA653:
	lda.w #$0009
	sta.b d0
	bra CODE_9EA65E
