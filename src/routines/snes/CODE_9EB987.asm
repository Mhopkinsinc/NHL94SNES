; Unidentified routine.
CODE_9EB987:
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq CODE_9EB9C2
	dec.b a0
	dec.b a0
	lda.w #$0000
	sta.b d0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$FF00
	cmp.w #$0600
	bcc CODE_9EB9BC
	lda.w #$0002
	sta.b d0
CODE_9EB9BC:
	lda.b a2
	cmp.b d0
	beq CODE_9EB971
CODE_9EB9C2:
	dec.b a0
	dec.b a0
	lda.w #$0034
	sta.b (a0)
	inc.b a0
	inc.b a0
	bra CODE_9EB971
