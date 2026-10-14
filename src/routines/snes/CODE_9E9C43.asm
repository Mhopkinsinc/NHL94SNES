; Unidentified routine.
CODE_9E9C43:
	lda.w Ypos,y
	cmp.w #$00F0
	bpl CODE_9E9C13
	cmp.w #$FF0A
	bmi CODE_9E9C13
	lda.b d0
	dec a
	cmp.w #$0003
	bcs CODE_9E9C0A
	lda.w #$FF7E
	sta.w Xpos,y
	lda.w #$0000
	sta.w $0EC3,y
	lda.w Ypos,y
	cmp.w #$0058
	bpl CODE_9E9C71
	cmp.w #$FFA8
	bpl CODE_9E9CB3
CODE_9E9C71:
	lda.w attribute,y
	bit.w #$0800
	bne CODE_9E9C3E
CODE_9E9C79:
	lda.w #$FD9C
CODE_9E9C7C:
	ldx.b a2
	sta.w pfalock,x
	jsl.l CODE_9EA403
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .1
	sta.w $19BE
.1:
	stz.w $0C23
	ldy.b a2
	lda.w pfteam,y
	beq .2
	lda.w #$0002
.2:
	clc
	adc.w #$0006
	jsl.l CODE_9C9FD5
	lda.w #$0002
	sta.w $0C25
	ldx.b a3
	ldy.b a2
	jmp.w CODE_9E9D79
CODE_9E9CB3:
	jmp.w CODE_9E9E8A
