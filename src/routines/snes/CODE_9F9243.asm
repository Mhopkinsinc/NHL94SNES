; Unidentified routine.
CODE_9F9243:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9F9307
	jsl.l CODE_9F9298
	jmp.w $91E0
