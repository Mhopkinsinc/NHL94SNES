; Unidentified routine.
CODE_9FC2BA:
	ldy.w #$0000
	cpx.w #$000C
	bmi CODE_9FC2C5
	ldy.w #$0002
CODE_9FC2C5:
	lda.w $1C90,y
	beq CODE_9FC298
	jml.l CODE_9FCD2A
