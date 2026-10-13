; Unidentified routine.
CODE_9BB3BE:
	phx
	lda.b $A7
	beq CODE_9BB41C
	ldx.w #$0100
	ldy.w #$1000
	cmp.w #$0048
	bcs CODE_9BB3E0
	ldy.w #$087D
	cmp.w #$0016
	bcs CODE_9BB3DB
	ldy.w #$04B1
	bra CODE_9BB3F0
