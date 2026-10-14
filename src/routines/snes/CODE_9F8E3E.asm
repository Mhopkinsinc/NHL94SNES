; Unidentified routine.
CODE_9F8E3E:
	lda.w #$0004
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w #$0018
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D8000
	inc.w printx
	dec.w printy
	dec.w printy
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7F3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$00B4
	sta.b $A5
	jsl.l CODE_9FA5EA
	lda.b $B1
	bit.w #$1000
	beq CODE_9F8E8E
	jmp.w CODE_9F9243
