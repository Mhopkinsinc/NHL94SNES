; Unidentified routine.
CODE_9EB0B6:
	bra CODE_9EB070
	lda.w gmode
	bit.w #$0040
	beq CODE_9EB0C8
	lda.b a2
	inc a
	inc a
	jsl.l CODE_9C9FD5
CODE_9EB0C8:
	ldy.w $19D4,x
	bmi CODE_9EB0D6
	lda.w JoyPad,y
	and.w #$FFF0
	beq CODE_9EB0D6
	rtl
