; Unidentified routine.
CODE_9DA886:
	bit.w #$0800
	beq CODE_9DA899
	lda.w #$FFFE
	sta.b $A5
	jsr.w $AC4F
	jsr.w $A973
CODE_9DA896:
	jmp.w $A6FF
