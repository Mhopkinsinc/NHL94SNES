; Unidentified routine.
CODE_9FC2BA:
	ldy.w #$0000
	cpx.w #$000C
	bmi .1
	ldy.w #$0002
.1:
	lda.w $1C90,y
	beq CODE_9FC298
	jml.l CODE_9FCD2A
