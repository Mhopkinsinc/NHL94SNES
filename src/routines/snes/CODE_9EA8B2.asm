; Unidentified routine.
CODE_9EA8B2:
	lda.w SPA,x
	cmp.w #$F208
	beq CODE_9EA8ED
	lda.w #$EA1A
	sta.b $A9
	lda.w $1523,x
	beq CODE_9EA8C9
	lda.w #$F0D2
	sta.b $A9
CODE_9EA8C9:
	lda.b $A5
	and.w #$000F
	sta.b $A5
	cmp.w #$0008
	bcc CODE_9EA8EE
	cmp.w #$0009
	bne CODE_9EA8E5
	lda.w $0EC3,x
	ora.w $0EE3,x
	beq CODE_9EA8E5
	jmp.w $A4F7
