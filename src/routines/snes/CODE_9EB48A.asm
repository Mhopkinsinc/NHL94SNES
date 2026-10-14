; Unidentified routine.
CODE_9EB48A:
	lda.b $A5
	pha
	lda.b $A7
	pha
	stx.b $87
	ldx.w #$0000
CODE_9EB495:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB495
	ldx.b $87
CODE_9EB4A1:
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EB4AB:
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB4AB
	cmp.w #$0000
	bne CODE_9EB4C1
	jmp.w CODE_9EB6B8
