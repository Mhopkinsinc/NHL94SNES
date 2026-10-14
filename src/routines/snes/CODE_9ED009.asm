; Unidentified routine.
CODE_9ED009:
	cpx.w $0AD9
	beq CODE_9ED050
	lda.w $0B7D,x
	cmp.w #$000C
	beq CODE_9ED050
	lda.w Ypos,x
	bit.w #$8000
	beq CODE_9ED022
	eor.w #$FFFF
	inc a
CODE_9ED022:
	cmp.w #$0098
	bcc CODE_9ED050
	ldy.w $19D4,x
	bmi CODE_9ED039
	lda.w SPA,x
	cmp.w #$E4B6
	bcc CODE_9ED039
	cmp.w #$F90E
	bcc CODE_9ED04D
CODE_9ED039:
	lda.b d0
	cmp.w facedir,x
	beq CODE_9ED07A
	sta.b d2
	lda.w #$E0FE
	jsl.l CODE_9EA3F1
	jml.l CODE_9EA719
