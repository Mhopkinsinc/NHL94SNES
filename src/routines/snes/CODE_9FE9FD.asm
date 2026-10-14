; Unidentified routine.
CODE_9FE9FD:
	jsr.w CODE_9FE75E
	lda.w #$007F
	sta.b $0E
	lda.w #$76C0
	sta.b $0C
	ldy.w #$00E0
	ldx.w #$0020
	jsl.l WaitFrame
	jsl.l DMAToCGRAM
	ldx.w $0AC6
	lda.w JoyPad,x
	bit.w #$8080
	bne CODE_9FE9FD
	rts
