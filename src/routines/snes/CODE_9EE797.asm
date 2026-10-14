; Unidentified routine.
CODE_9EE797:
	lda.w SPA,x
	cmp.w #$EF6E
	beq CODE_9EE7F6
	cmp.w #$F020
	beq CODE_9EE7F6
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1
	ldy.w #$0002
.1:
	lda.w $17D2,y
	inc a
	sta.w $17D2,y
	ply
	lda.w #$0000
	sec
	sbc.w $0BA7
	sta.b d0
	lda.w pfgoal,x
	bne .t1
	lda.w #$FEF8
	sec
	sbc.w $0BA9
	sta.b d1
	bra CODE_9EE7DA

.t1:
	lda.w #$0108
	sec
	sbc.w $0BA9
	sta.b d1
CODE_9EE7DA:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1
	lda.w #$F020
	bra CODE_9EE7EC

.t1:
	lda.w #$EF6E
CODE_9EE7EC:
	jsl.l SetSPAFromA
	jmp.w CODE_9EE796
