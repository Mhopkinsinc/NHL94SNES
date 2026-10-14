; Unidentified routine.
CODE_9FE618:
	jsl.l CODE_9FF1D1
	jsr.w CODE_9FE75E
	jsl.l IntermissionTick
	beq CODE_9FE628
	jmp.w CODE_9FE70D
