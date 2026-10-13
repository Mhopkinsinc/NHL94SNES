; Unidentified routine.
CODE_9FC80A:
	lda.b $A5
	and.w #$000F
	jsr.w $C822
	lda.b $B1
	bit.w $1EB3
	beq CODE_9FC81C
	inc.w $1EAF
CODE_9FC81C:
	ora.w $1EB3
	sta.b $B1
	rts
