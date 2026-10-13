; Unidentified routine.
CODE_9DA899:
	lda.w #$0001
	sta.b $AD
	lda.b $A9
	bit.w #$0100
	bne CODE_9DA8AF
	bit.w #$0200
	beq CODE_9DA896
	lda.w #$FFFF
	sta.b $AD
CODE_9DA8AF:
	jsr.w $A8B8
	jsr.w $A973
	jmp.w $A6FF
