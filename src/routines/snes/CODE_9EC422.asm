; Unidentified routine.
CODE_9EC422:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w #$0005
	sta.b $A5
	ldy.w #$0000
	cpx.w #$000C
	bcc CODE_9EC444
	ldy.w #$000C
CODE_9EC444:
	sty.b $89
	lda.w #$005C
	sta.b $A9
	lda.w pfgoal,x
	beq CODE_9EC453
	jmp.w $C4D4
