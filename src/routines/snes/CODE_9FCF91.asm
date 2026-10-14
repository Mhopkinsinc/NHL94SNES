; Unidentified routine.
CODE_9FCF91:
	lda.w sflags
	bit.w #$2000
	beq CODE_9FCFBF
	jsl.l chkpk2
	beq CODE_9FCFAC
	ldy.w #$0001
	lda.b [a0],y
	and.w #$000F
	sta.w PPBonus
	bra CODE_9FCFBF
