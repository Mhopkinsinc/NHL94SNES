; Unidentified routine.
CODE_9FD2A7:
	ldy.b $91
	lda.w tmflags,y
	and.w #$FFEF
	sta.w tmflags,y
	lda.w #$0005
	sta.b $AD
	ldx.w tmsort,y
	stx.b $95
CODE_9FD2BC:
	stz.w pf2aip,x
	lda.w pflags,x
	and.w #$2FFF
	sta.w pflags,x
	lda.w position,x
	bmi CODE_9FD2F3
	bne CODE_9FD2D4
	lda.w #SPAgready
	bra CODE_9FD2D7
