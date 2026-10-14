; Unidentified routine.
CODE_9EE6D2:
	lda.w position,x
	bne .2
	lda.w $0D71
	cmp.w #$FFF0
	bmi .2
	cmp.w #$0010
	bpl .2
	lda.w pucky
	cmp.w #$0108
	bpl .1
	cmp.w #$FEF8
	bpl .2
.1:
	cmp.w #$0110
	bcc .rtl
.2:
	lda.w facedir,x
	and.w #$0007
	sta.w passdir
	lda.w #$0004
	tsb.w sflags
.rtl:
	rtl
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
.3:
	lda.w $0BAD,x
	sec
	sbc.w $0ADB
	sta.w $0BAD,x
	bmi CODE_9EE77E
	lda.w $0AD9
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
