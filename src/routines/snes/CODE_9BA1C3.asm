; Unidentified routine.
CODE_9BA1C3:
	jsl.l RandomWord
	and.w #$07C0
	beq CODE_9BA1CF
	jmp.w $A312
