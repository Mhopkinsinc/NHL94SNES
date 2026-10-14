; Unidentified routine.
CODE_9FC80A:
	lda.b d0
	and.w #$000F
	jsr.w CODE_9FC822
	lda.b d3
	bit.w $1EB3
	beq CODE_9FC81C
	inc.w $1EAF
CODE_9FC81C:
	ora.w $1EB3
	sta.b d3
	rts
