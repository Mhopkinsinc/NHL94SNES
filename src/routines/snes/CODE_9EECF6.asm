; Unidentified routine.
CODE_9EECF6:
	stx.w $0BA3
	lda.w position,x
	beq .t4
	lda.w pfgoal,x
	bne .t3
	lda.w Ypos,x
	cmp.w #$FFA8
	bmi .t2
.1:
	lda.w #$0004
	sta.w passdir
	lda.w Xpos,x
	bmi .t1
	lda.w #$000A
	sta.w $0BA5
	rtl

.t1:
	lda.w #$0006
	sta.w $0BA5
	rtl

.t2:
	lda.w $0B77
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0008
	sta.w $0BA5
	rtl

.t3:
	lda.w Ypos,x
	cmp.w #$0058
	bpl .t2x
	lda.w #$0000
	sta.w passdir
	lda.w Xpos,x
	bmi .t1x
	lda.w #$0016
	sta.w $0BA5
	rtl

.t1x:
	lda.w #$0012
	sta.w $0BA5
	rtl

.t2x:
	lda.w $0B75
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0014
	sta.w $0BA5
	rtl

.t4:
	stz.w $0BA5
	stz.w passdir
	lda.w pfgoal,x
	bne .rtl
	lda.w #$000C
	sta.w $0BA5
	lda.w #$0004
	sta.w passdir
.rtl:
	rtl
