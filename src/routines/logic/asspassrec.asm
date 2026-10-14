; Unidentified routine.
asspassrec:
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.3:
	lda.w $0BAD,x
	sec
	sbc.w $0ADB
	sta.w $0BAD,x
	bmi CODE_9EE77E
	lda.w puckc
	bpl CODE_9EE77E
	lda.w $0BAB
	bne CODE_9EE797
	ldy.w $19D4,x
	bmi .t2
	lda.w $0AB8,y
	bit.w #$8000
	bne CODE_9EE77E
	bit.w #$0080
	beq .t2
.4:
	inc.w $0BAB
	bra CODE_9EE797

.t1:
	rtl

.t2:
	ldy.b a2
	lda.w $19D0,y
	bne CODE_9EE779
	lda.w pfgoal,x
	bne CODE_9EE771
	lda.w Ypos,x
	cmp.w #$FFA8
	bpl CODE_9EE779
CODE_9EE762:
	jsl.l RandomWord
	and.w #$0080
	bne CODE_9EE779
	inc.w $0BAB
	jmp.w CODE_9EE797
