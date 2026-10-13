; Unidentified routine.
CODE_9FE4BF:
	ldx.w $0AC6
	bmi CODE_9FE4E8
	lda.w $15D6
	beq CODE_9FE4E8
	lda.w $1A10
	bne CODE_9FE4E8
	lda.w $1C84,x
	and.w #$0002
	tay
	lda.w $17E2,y
	beq CODE_9FE4E8
	lda.w #$0011
	sta.w $1EB9
	lda.w #$0005
	sta.w $1EB7
	bra CODE_9FE4F4
