; Unidentified routine.
CODE_9BAF56:
	jsl.l adda4
	ldx.w #$0006
	lda.b $B1
	bit.w #$0010
	bne CODE_9BAF67
	ldx.w #$000C
CODE_9BAF67:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
CODE_9BAF6E:
	jsl.l SoundVoicesOff
	lda.w #$0001
	sta.b $C1
	lda.w #$0002
	trb.w sflags3
	jmp.w CODE_9BABAB
