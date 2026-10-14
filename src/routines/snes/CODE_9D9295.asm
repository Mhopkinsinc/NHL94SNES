; Unidentified routine.
CODE_9D9295:
	sta.w Hscroll
	and.w #$0007
	beq CODE_9D92A0
	jmp.w CODE_9D936E
