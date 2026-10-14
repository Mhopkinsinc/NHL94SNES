; Unidentified routine.
CODE_9EF833:
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.b d0
	sec
	sbc.w pucky
	bmi .t1
	lda.b d0
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF855

.t1:
	lda.b d0
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF855:
	jsl.l CODE_9EC6E7
	lda.w gmode
	bit.w #$0020
	bne .t1
	jmp.w CODE_9EF829

.t1:
	lda.b d0
	sec
	sbc.w #$000A
	sta.b d0
	lda.w gmode
	bit.w #$0002
	bne .1
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
.1:
	lda.w shotPlIdx
	bpl .2
	lda.w $0CF3
	asl a
.2:
	cmp.w #$000C
	bpl .t2
	lda.b a2
	beq CODE_9EF894
	bra CODE_9EF829

.t2:
	lda.b a2
	beq CODE_9EF829
CODE_9EF894:
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
CODE_9EF8A0:
	ldy.b a0
	lda.w position,y
	bmi .t1
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi .t1
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
	rtl

.t1:
	inc.b a0
	inc.b a0
	dec.b d2
	bpl CODE_9EF8A0
	rtl
