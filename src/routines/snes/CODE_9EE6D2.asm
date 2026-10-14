; Unidentified routine.
CODE_9EE6D2:
	lda.w position,x
	bne CODE_9EE6F6
	lda.w $0D71
	cmp.w #$FFF0
	bmi CODE_9EE6F6
	cmp.w #$0010
	bpl CODE_9EE6F6
	lda.w pucky
	cmp.w #$0108
	bpl CODE_9EE6F1
	cmp.w #$FEF8
	bpl CODE_9EE6F6
CODE_9EE6F1:
	cmp.w #$0110
	bcc CODE_9EE705
CODE_9EE6F6:
	lda.w facedir,x
	and.w #$0007
	sta.w passdir
	lda.w #$0004
	tsb.w sflags
CODE_9EE705:
	rtl
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE720
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
CODE_9EE720:
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
	bmi CODE_9EE74E
	lda.w $0AB8,y
	bit.w #$8000
	bne CODE_9EE77E
	bit.w #$0080
	beq CODE_9EE74E
CODE_9EE748:
	inc.w $0BAB
	bra CODE_9EE797
