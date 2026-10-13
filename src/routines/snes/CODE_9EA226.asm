; Unidentified routine.
CODE_9EA226:
	lda.w Ypos,x
	cmp.w #$FFA8
	bpl CODE_9EA233
	cmp.w #$FEF8
	bpl CODE_9EA20D
CODE_9EA233:
	lda.w $0793
	and.w #$0007
	bne CODE_9EA23E
	jmp.w $A222
