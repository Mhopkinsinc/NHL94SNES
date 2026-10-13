; Unidentified routine.
CODE_9F8183:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	stx.b $A5
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
CODE_9F8197:
	txa
	asl a
	asl a
	tax
	lda.w #$2000
	sta.w $0D0D
	lda.w $1DB9
	beq CODE_9F8219
CODE_9F81A6:
	lda.b $B5
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $176C,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $B5
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $176A,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.w #$2400
	sta.w $0D0D
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #$F7C9
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F7D0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	bra CODE_9F8281
