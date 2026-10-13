; Unidentified routine.
CODE_80A725:
	lda.w #$0000
CODE_80A728:
	sta.w $09FA,x
	ldy.b #$0A
	lda.b ($4E),y
	sta.w $093A,x
	sta.b $5C
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne CODE_80A74B
	lda.w sflags
	bit.w #$0800
	bne CODE_80A74B
	lda.b $5C
	sta.w $0CB1
CODE_80A74B:
	lda.b $4E
	sta.w $092A,x
	sep #$20
	ldx.b $5A
	lda.l VolumeCurve,x
	and.b #$FF
	cmp.b #$40
	bne CODE_80A770
	ldx.b $4A
	lda.w $08AE,x
	sta.w $07FC
	iny
	lda.w $08BF,x
	sta.w $07FE
	jmp.w CODE_80A790
