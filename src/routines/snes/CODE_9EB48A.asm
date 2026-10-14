; Unidentified routine.
CODE_9EB48A:
	lda.b d0
	pha
	lda.b $A7
	pha
	stx.b xsave
	ldx.w #$0000
CODE_9EB495:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB495
	ldx.b xsave
CODE_9EB4A1:
	lda.w #$0000
	sta.b $8B
	lda.w #PenBuf
	sta.b a0
CODE_9EB4AB:
	lda.b [a0]
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB4AB
	cmp.w #$0000
	bne CODE_9EB4C1
	jmp.w CODE_9EB6B8
