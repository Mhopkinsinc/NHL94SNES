; Unidentified routine.
CODE_9ED5A7:
	ldy.w $19D4,x
	bmi .t3
	lda.w $0ADD,y
	cmp.w #$0001
	bne .t3
	cpx.w shotPlIdx
	beq CODE_9ED574
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w JoyPad,y
	bit.w #$4000
	bne .t2
	lda.w $0AB8,y
	bit.w #$0040
	beq CODE_9ED574
	lda.w $0AA4,y
	cmp.w #$0008
	beq CODE_9ED58D
	and.w #$0007
	bra CODE_9ED593

.t2:
	lda.w $0AA4,y
	cmp.w #$0008
	bne .t1
	jmp.w .t4

.t1:
	and.w #$0007
	jmp.w .2

.t3:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w shotPlIdx
	bmi .t1x
	lsr a
	tay
	lda.w pfteam,y
	cmp.w pfteam,x
	beq .t2x
	lda.w $0BEB,x
	bne .t2x
	jsl.l RandomWord
	cmp.w #$0A00
	bcs .t2x
	lda.w $0B1D,x
	cmp.w #$0023
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	jmp.w CODE_9ED58D

.t1x:
	lda.w $1063,x
	bne .t2x
	lda.w $0B1D,x
	cmp.w #$002D
	bcs CODE_9ED6AE
	lda.w pucky
	cmp.w #$FEF7
	bmi CODE_9ED6AE
	cmp.w #$0109
	bpl CODE_9ED6AE
	lda.b a2
	eor.w #$0002
	tay
	lda.w $17AE,y
	cmp.w #$003C
	bcs CODE_9ED6AE
	jsl.l RandomWord
	cmp.w #$0800
	bcs CODE_9ED6AE
	bra .t4

.t2x:
	jmp.w CODE_9ED6AE

.t4:
	jsl.l vtoa
	lda.b d0
.2:
	sta.w facedir,x
	ldy.w #$E4B6
	tya
	jsl.l SetSPAFromA
	lda.w #$0168
	sta.w $0BEB,x
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .1
	sta.w $19BE
.1:
	lda.w #$0096
	sta.w pfalock,x
	clc
	adc.l $7E35E0
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
	rtl
