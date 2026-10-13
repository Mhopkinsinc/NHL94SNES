; Unidentified routine.
asspassrec:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE720
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
CODE_9EE720:
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
	bmi CODE_9EE74E
	lda.w $0AB8,y
	bit.w #$8000
	bne CODE_9EE77E
	bit.w #$0080
	beq CODE_9EE74E
CODE_9EE748:
	inc.w $0BAB
	bra CODE_9EE797
