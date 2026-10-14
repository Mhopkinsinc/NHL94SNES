; assdumpin: dumpinplayer = X; pick the dump-in target (dumpintarget) and passdir from where he is
DumpInTarget:
	stx.w dumpinplayer
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
	sta.w dumpintarget
	rtl

.t1:
	lda.w #$0006
	sta.w dumpintarget
	rtl

.t2:
	lda.w $0B77
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0008
	sta.w dumpintarget
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
	sta.w dumpintarget
	rtl

.t1x:
	lda.w #$0012
	sta.w dumpintarget
	rtl

.t2x:
	lda.w $0B75
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0014
	sta.w dumpintarget
	rtl

.t4:
	stz.w dumpintarget
	stz.w passdir
	lda.w pfgoal,x
	bne .rtl
	lda.w #$000C
	sta.w dumpintarget
	lda.w #$0004
	sta.w passdir
.rtl:
	rtl
