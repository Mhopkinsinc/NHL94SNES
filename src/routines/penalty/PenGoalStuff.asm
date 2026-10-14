; After a power play goal, let the first player whose penalty is not coincidental out of the box
PenGoalStuff:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w gsp
	cmp.w #$0003
	beq CODE_9EB9D1
	lda.w #PenBuf
	sta.b a0
CODE_9EB971:
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB971
	cmp.w #$0000
	bne .t1
	jmp.w CODE_9EB9D5

.t1:
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
	beq .2
	dec.b a0
	dec.b a0
	lda.w #$0000
	sta.b d0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$FF00
	cmp.w #$0600
	bcc .1
	lda.w #$0002
	sta.b d0
.1:
	lda.b a2
	cmp.b d0
	beq CODE_9EB971
.2:
	dec.b a0
	dec.b a0
	lda.w #$0034
	sta.b (a0)
	inc.b a0
	inc.b a0
	bra CODE_9EB971
