; Unidentified routine.
CODE_9F9243:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9F9307
	jsl.l CODE_9F9298
	jmp.w CODE_9F91E0
