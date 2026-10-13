; Unidentified routine.
CODE_9D9494:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D949A:
	phx
	lda.b $03,s
	and.b #$01
	beq CODE_9D94A9
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D94AF
