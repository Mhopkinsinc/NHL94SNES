; Unidentified routine.
CODE_9FB30F:
	lda.w $0B7D,x
	cmp.w #$0017
	bne .t2
	lda.w #$007E
	sta.b $8B
	lda.w #$3122
	sta.b a0
	lda.w pfgoal,x
	beq .1
	lda.w #$007E
	sta.b $8B
	lda.w #$3124
	sta.b a0
.1:
	lda.b d0
	sta.b [a0]
	lda.w $1543,x
	bne .t2
	lda.b d1
	bit.w #$8000
	beq .t1
	lda.w #$0001
	sta.w $1543,x
	lda.w #SPAfaceoff
	jml.l SetSPAFromA

.t1:
	lda.w #SPAfaceoffr
	jml.l SetSPAFromA

.t2:
	rtl
