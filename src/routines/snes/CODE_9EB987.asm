; Unidentified routine.
CODE_9EB987:
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB9C2
	dec.b $89
	dec.b $89
	lda.w #$0000
	sta.b $A5
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$FF00
	cmp.w #$0600
	bcc CODE_9EB9BC
	lda.w #$0002
	sta.b $A5
CODE_9EB9BC:
	lda.b $91
	cmp.b $A5
	beq CODE_9EB971
CODE_9EB9C2:
	dec.b $89
	dec.b $89
	lda.w #$0034
	sta.b ($89)
	inc.b $89
	inc.b $89
	bra CODE_9EB971
