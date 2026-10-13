; Unidentified routine.
CODE_9BA149:
	cpx.w #$0024
	beq CODE_9BA153
	cpx.w #$0026
	bne CODE_9BA15B
CODE_9BA153:
	lda.w $0C53
	sta.w $0C2B,x
	bra CODE_9BA166
