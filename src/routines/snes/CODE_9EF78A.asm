; Unidentified routine.
CODE_9EF78A:
	stz.b a1
	lda.w #$0002
	sta.b a2
	jsl.l ClearOffsidesIfAllPlayers
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l ClearOffsidesIfAllPlayers
	lda.w #$0054
	sta.b d0
	lda.w pucky
	bpl .t2
	jmp.w CODE_9EF833

.t2:
	lda.b d0
	sec
	sbc.w pucky
	bmi .t1
	lda.b d0
	sec
	sbc.w $0E9F
	bpl CODE_9EF829
	bra CODE_9EF7C7

.t1:
	lda.b d0
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
CODE_9EF7C7:
	jsl.l CODE_9EC6E7
	lda.w gmode
	bit.w #$0020
	bne .t2
	jmp.w CODE_9EF829

.t2:
	lda.w #$005E
	sta.b d0
	lda.w gmode
	bit.w #$0002
	beq .1
	lda.b a2
	ldy.b a1
	sty.b a2
	sta.b a1
.1:
	lda.w puckc
	bpl .2
	lda.w $0CF3
	asl a
.2:
	cmp.w #$000C
	bpl .t1
	lda.b a2
	beq CODE_9EF803
	bra CODE_9EF829

.t1:
	lda.b a2
	beq CODE_9EF829
CODE_9EF803:
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
CODE_9EF80F:
	ldy.b a0
	lda.w position,y
	bmi CODE_9EF82A
	lda.b d0
	sec
	sbc.w Ypos,y
	bpl CODE_9EF82A
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
CODE_9EF829:
	rtl
CODE_9EF82A:
	inc.b a0
	inc.b a0
	dec.b d2
	bpl CODE_9EF80F
	rtl
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
	bra .3

.t1:
	lda.b d0
	sec
	sbc.w $0E9F
	bmi CODE_9EF829
.3:
	jsl.l CODE_9EC6E7
	lda.w gmode
	bit.w #$0020
	bne .t1x
	jmp.w CODE_9EF829

.t1x:
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
	lda.w puckc
	bpl .2
	lda.w $0CF3
	asl a
.2:
	cmp.w #$000C
	bpl .t2
	lda.b a2
	beq .4
	bra CODE_9EF829

.t2:
	lda.b a2
	beq CODE_9EF829
.4:
	lda.w #$0005
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
.5:
	ldy.b a0
	lda.w position,y
	bmi .t1xx
	lda.b d0
	sec
	sbc.w Ypos,y
	bmi .t1xx
	ldy.b a2
	lda.w tmflags,y
	ora.w #$0010
	sta.w tmflags,y
	rtl

.t1xx:
	inc.b a0
	inc.b a0
	dec.b d2
	bpl .5
	rtl
