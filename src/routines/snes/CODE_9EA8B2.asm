; Unidentified routine.
CODE_9EA8B2:
	lda.w SPA,x
	cmp.w #SPAsweepchk
	beq CODE_9EA8ED
	lda.w #SPAglide
	sta.b $A9
	lda.w pfrev,x
	beq CODE_9EA8C9
	lda.w #SPAglideback
	sta.b $A9
CODE_9EA8C9:
	lda.b $A5
	and.w #$000F
	sta.b $A5
	cmp.w #$0008
	bcc CODE_9EA8EE
	cmp.w #$0009
	bne CODE_9EA8E5
	lda.w Xvel,x
	ora.w Yvel,x
	beq CODE_9EA8E5
	jmp.w $A4F7
