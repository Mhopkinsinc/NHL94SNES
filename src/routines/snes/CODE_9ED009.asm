; Unidentified routine.
CODE_9ED009:
	cpx.w puckc
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
	cmp.w #SPAgdive
	bcc CODE_9ED039
	cmp.w #SPAinjury1
	bcc CODE_9ED04D
CODE_9ED039:
	lda.b $A5
	cmp.w facedir,x
	beq CODE_9ED07A
	sta.b $AD
	lda.w #SPAgready
	jsl.l CODE_9EA3F1
	jml.l CODE_9EA719
