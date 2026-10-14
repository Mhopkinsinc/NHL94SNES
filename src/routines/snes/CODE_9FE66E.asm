; Unidentified routine.
CODE_9FE66E:
	pla
	asl a
	tax
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	cmp.w $0AC6
	beq CODE_9FE6AE
	stx.w $0AC6
	stz.w $0D15
	stz.w $0D13
	jsl.l CODE_9FEA24
	jsl.l CODE_9DD923
	jsr.w CODE_9FE9FD
	lda.w #$003C
	sta.w $0AC8
	lda.w #$0014
	sta.w $0AC4
	lda.w $1EB7
	beq CODE_9FE6A9
	cmp.w #$0005
	beq CODE_9FE6A9
	bra CODE_9FE6AD
