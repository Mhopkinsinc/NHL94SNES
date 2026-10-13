; Unidentified routine.
CODE_9EC7E7:
	lda.b [$8D],y
	bit.w #$0080
	bne CODE_9EC827
	and.w #$00FF
	cmp.w #$0040
	bne CODE_9EC7F9
	jmp.w $C888
