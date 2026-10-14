; Unidentified routine.
CODE_9F8E3E:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D8000
	inc.w printx
	dec.w printy
	dec.w printy
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7F3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$00B4
	sta.b d0
	jsl.l CODE_9FA5EA
	lda.b d3
	bit.w #$1000
	beq CODE_9F8E8E
	jmp.w CODE_9F9243
