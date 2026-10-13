; Unidentified routine.
CODE_9BA178:
	jsl.l RandomWord
	and.w #$00C0
	bne CODE_9BA166
	lda.w #$000E
	sta.w $0C2B,x
	bra CODE_9BA166
