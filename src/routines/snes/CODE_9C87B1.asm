; Unidentified routine.
CODE_9C87B1:
	inc a
	cmp.w #$0001
	beq CODE_9C87C5
CODE_9C87B7:
	sta.w $1DF9
	jsl.l CODE_9C8B69
	jsl.l CODE_9C88A0
	jmp.w CODE_808684
