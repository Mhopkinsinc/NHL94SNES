; Unidentified routine.
CODE_9DA770:
	jsl.l CODE_9B8017
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	jsl.l CODE_9B84F5
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d1
	and.w #$FFF0
	sta.b d1
	beq CODE_9DA793
	jmp.w CODE_9DA869
