; Unidentified routine.
CODE_9DA770:
	jsl.l CODE_9B8017
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	jsl.l CODE_9B84F5
	dec.w $0AC4
	jsl.l CODE_9B852C
	lda.b $A9
	and.w #$FFF0
	sta.b $A9
	beq CODE_9DA793
	jmp.w $A869
