; Unidentified routine.
CODE_9EC64B:
	stz.w $1638
	lda.w shotPlIdx
	bpl .t4
	jmp.w CODE_9EC6E6

.t4:
	lda.w gmode
	bit.w #$0002
	bne .t1
	lda.w shotPlIdx
	cmp.w #$000C
	bmi .t3
	bra .t2

.t1:
	lda.w shotPlIdx
	cmp.w #$000C
	bmi .t2
	bra .t3

.t2:
	ldy.w shotPlIdx
	lda.w Ypos,y
	bpl CODE_9EC6E6
	sec
	sbc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w shotPlIdx
	cmp.w #$000C
	bpl .1
	ldy.w #$000C
.1:
	lda.w #$0006
	sta.b d2
.loop:
	lda.w position,y
	bmi .2
	beq .2
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl CODE_9EC6E6
.2:
	iny
	iny
	dec.b d2
	bpl .loop
	bra CODE_9EC6E0

.t3:
	ldy.w shotPlIdx
	lda.w Ypos,y
	bmi CODE_9EC6E6
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0000
	lda.w shotPlIdx
	cmp.w #$000C
	bpl .1x
	ldy.w #$000C
.1x:
	lda.w #$0006
	sta.b d2
.loopx:
	lda.w position,y
	bmi .2x
	beq .2x
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi CODE_9EC6E6
.2x:
	iny
	iny
	dec.b d2
	bpl .loopx
CODE_9EC6E0:
	stz.w $1638
	inc.w $1638
CODE_9EC6E6:
	rtl
