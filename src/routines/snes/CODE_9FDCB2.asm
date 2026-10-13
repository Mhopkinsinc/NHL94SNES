; Unidentified routine.
CODE_9FDCB2:
	lda.w pnum,x
	and.w #$00FF
	asl a
	sta.b $A9
	lda.w pfteam,x
	beq CODE_9FDCC3
	lda.w #$0002
CODE_9FDCC3:
	sta.b $91
	beq CODE_9FDCCA
	lda.w #$0034
CODE_9FDCCA:
	adc.b $A9
	tay
	lda.w tmpde,y
	sta.b $A5
	rtl
