; Unidentified routine.
CODE_9FE9FD:
	jsr.w $E75E
	lda.w #$007F
	sta.b $0E
	lda.w #$76C0
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l CODE_808723
	ldx.w $0AC6
	lda.w $0776,x
	bit.w #$8080
	bne CODE_9FE9FD
	rts
