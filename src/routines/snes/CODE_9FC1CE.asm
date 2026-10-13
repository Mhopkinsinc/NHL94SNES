; Unidentified routine.
CODE_9FC1CE:
	lda.w sfhormode
	beq CODE_9FC1E1
	lda.b $A5
	bit.w #$0008
	bne CODE_9FC1E1
	inc a
	inc a
	and.w #$0007
	sta.b $A5
CODE_9FC1E1:
	lda.w sflags
	bit.w #$0100
	beq CODE_9FC1EC
	jmp.w $C26F
