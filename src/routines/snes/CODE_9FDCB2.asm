; Unidentified routine.
CODE_9FDCB2:
	lda.w pnum,x
	and.w #$00FF
	asl a
	sta.b d1
	lda.w pfteam,x
	beq CODE_9FDCC3
	lda.w #$0002
CODE_9FDCC3:
	sta.b a2
	beq CODE_9FDCCA
	lda.w #$0034
CODE_9FDCCA:
	adc.b d1
	tay
	lda.w tmpde,y
	sta.b d0
	rtl
