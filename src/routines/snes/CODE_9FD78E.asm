; Unidentified routine.
CODE_9FD78E:
	lda.w pflags,x
	ora.w #$0008
	sta.w pflags,x
	jsl.l CODE_9FC757
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFF7
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w $1D55,y
	jmp.w CODE_9FDE13
