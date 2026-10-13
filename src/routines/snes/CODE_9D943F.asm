; Unidentified routine.
CODE_9D943F:
	lda.b #$80
	sta.l $7F6700,x
CODE_9D9445:
	inx
	lda.b $03,s
	and.b #$02
	beq CODE_9D9454
	lda.b #$7F
	sta.l $7F6700,x
	bra CODE_9D945A
