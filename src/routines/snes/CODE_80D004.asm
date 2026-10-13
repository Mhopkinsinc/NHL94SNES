; Unidentified routine.
CODE_80D004:		; draw the ShooterSelectList list: the title of rating column $0D47, the scroll marks, the rows
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFBA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
CODE_80D03E:
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D0EA
	sta.b $8D
	lda.w $0D47
	sta.b $A5
	bra CODE_80D059
