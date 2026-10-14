; Draw the MultiPlayer 5 warning for the controller, Super Scope, or mouse.
ShowMP5Warning:
	lda.w $1A0E
	beq .rtl
.loop:
	jsl.l .t4
	lda.w $1A0E
	bne .loop
	jsl.l CODE_9FEA24
.rtl:
	rtl

.t4:
	pha
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF92C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	pla
	bit.w #$0001
	bne .t1
	bit.w #$0002
	bne .t2
	bit.w #$0004
	bne .t3
	jmp.w CODE_9FF2CC

.t1:
	lda.w #$009F
	sta.b $8F
	lda.w #MultiPlayer5Text
	sta.b a1
	jsl.l PrintMP5Line1
	lda.w #$009F
	sta.b $8F
	lda.w #MP5MustConnect
	sta.b a1
	jsl.l PrintMP5Line2
	lda.w #$009F
	sta.b $8F
	lda.w #MP5ToController
	sta.b a1
	jsl.l PrintMP5Line3
	lda.w #$009F
	sta.b $8F
	lda.w #MP5Socket2
	sta.b a1
	jsl.l PrintMP5Line4
	bra CODE_9FF2CC

.t2:
	lda.w #$009F
	sta.b $8F
	lda.w #MP5ScopeHead
	sta.b a1
	jsl.l PrintMP5Line1
	lda.w #$009F
	sta.b $8F
	lda.w #MP5ScopeNot
	sta.b a1
	jsl.l PrintMP5Line2
	lda.w #$009F
	sta.b $8F
	lda.w #MP5ScopeWith
	sta.b a1
	jsl.l PrintMP5Line3
	lda.w #$009F
	sta.b $8F
	lda.w #MP5SuperScope
	sta.b a1
	jsl.l PrintMP5Line4
	bra CODE_9FF2CC

.t3:
	lda.w #$009F
	sta.b $8F
	lda.w #MP5MouseHead
	sta.b a1
	jsl.l PrintMP5Line1
	lda.w #$009F
	sta.b $8F
	lda.w #MP5MouseNot
	sta.b a1
	jsl.l PrintMP5Line2
	lda.w #$009F
	sta.b $8F
	lda.w #MP5MouseWith
	sta.b a1
	jsl.l PrintMP5Line3
	lda.w #$009F
	sta.b $8F
	lda.w #MP5Mouse
	sta.b a1
	jsl.l PrintMP5Line4
CODE_9FF2CC:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	rtl
