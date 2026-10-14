; Unidentified routine.
CODE_9C936C:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
CODE_9C9375:
	tya
	cmp.b [$8D]
	bne CODE_9C937D
	jmp.w CODE_9C93F0
