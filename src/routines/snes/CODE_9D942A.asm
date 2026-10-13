; Unidentified routine.
CODE_9D942A:
	lda.b #$01
	pha
	ldy.w #$0007
CODE_9D9430:
	phx
	lda.b $03,s
	and.b #$01
	beq CODE_9D943F
	lda.b #$FF
	sta.l $7F6700,x
	bra CODE_9D9445
