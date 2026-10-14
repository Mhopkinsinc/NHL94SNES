; Unidentified routine.
CODE_9C9590:
	stx.w $1E17
	sty.w $1E1B
	ldy.w #$0002
CODE_9C9599:
	tya
	cmp.b [$8D]
	bne CODE_9C95A1
	jmp.w CODE_9C9622
