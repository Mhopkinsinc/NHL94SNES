; Unidentified routine.
CODE_9DA873:
	bit.w #$0400
	beq CODE_9DA886
	lda.w #$0002
	sta.b $A5
	jsr.w $AC4F
	jsr.w $A973
	jmp.w $A6FF
