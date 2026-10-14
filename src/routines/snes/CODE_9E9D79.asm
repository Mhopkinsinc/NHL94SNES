; Unidentified routine.
CODE_9E9D79:
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$002D
	sta.b $81
	lda.w $0AD9
	sta.b $A5
	bmi CODE_9E9D73
	cpy.b $A5
	bne CODE_9E9D73
	lda.w gmode
	bit.w #$0010
	bne CODE_9E9D76
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9E9D76
	lda.w position,x
	beq CODE_9E9D76
	lda.w SPA,y
	cmp.w #$F54E
	bne CODE_9E9D76
	lda.w $1163,y
	and.w #$0003
	bne CODE_9E9D76
	lda.w pflags,y
	bit.w #$4000
	bne CODE_9E9D76
	lda.w #$0096
	jsl.l CODE_9BB385
	asl a
	ldy.b $91
	sec
	sbc.w $0F23,y
	bpl CODE_9E9D76
	lda.w $15D6
	bne CODE_9E9D76
	lda.w position,y
	bmi CODE_9E9E59
	beq CODE_9E9E59
	lda.w #$FFFF
	sta.w $0AD9
	stz.w $0C23
	ldy.b $91
	lda.w pfteam,y
	beq CODE_9E9DF2
	lda.w #$0002
CODE_9E9DF2:
	clc
	adc.w #$0006
	jsl.l CODE_9C9FD5
	ldx.b $91
	lda.w #$F90E
	jsl.l CODE_9EA3F1
	ldx.b $95
	lda.w $0EC3,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w $0EC3,x
	lda.w $0EE3,x
	eor.w #$FFFF
	inc a
	cmp.w #$8000
	ror a
	sta.w $0EE3,x
	jsl.l CODE_9EC2D0
	lda.w #$0004
	sta.w $1626
	lda.w #$0016
	sta.b $A5
	lda.w $19BE
	clc
	adc.w #$001E
	bmi CODE_9E9E3C
	sta.w $19BE
CODE_9E9E3C:
	lda.w position,x
	bne CODE_9E9E44
	jmp.w CODE_9EB88A
