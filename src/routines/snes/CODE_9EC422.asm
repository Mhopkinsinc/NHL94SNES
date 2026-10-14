; Unidentified routine.
CODE_9EC422:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w #$0005
	sta.b d0
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9EC444
	ldy.w #$000C
CODE_9EC444:
	sty.b a0
	lda.w #$005C
	sta.b d1
	lda.w pfgoal,x
	beq CODE_9EC453
	jmp.w CODE_9EC4D4
