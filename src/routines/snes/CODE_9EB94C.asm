; Unidentified routine.
CODE_9EB94C:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $89
	pha
	lda.b $8B
	pha
	lda.w gsp
	cmp.w #$0003
	beq CODE_9EB9D1
	lda.w #$15DE
	sta.b $89
CODE_9EB971:
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB971
	cmp.w #$0000
	bne CODE_9EB987
	jmp.w $B9D5
