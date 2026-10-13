; Unidentified routine.
CODE_80CC89:		; print the goalie and shooter rows, the row at the cursor ($1DB9) in another palette
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFAB
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFB0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l GoalieCount
	lda.b $A5
	dec a
	sta.b $A9
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDAA
	sta.b $9D
	lda.w #$0080
	sta.b $97
	lda.w #DATA8_80CDA6
	sta.b $95
	lda.w $0D43
	dec a
	sta.b $A5
	bmi CODE_80CD22
	asl a
	asl a
	asl a
	sta.b $A5
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CD13
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CD13:
	lda.w #$0080
	sta.b $9F
	lda.w #DATA8_80CDB6
	sta.b $9D
	lda.w #$0005
	sta.b $A9
CODE_80CD22:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$0005
	sec
	sbc.b $A9
	cmp.w $1DB9
	bne CODE_80CD62
	lda.w #$2000
	sta.w $0D0D
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.l $7E345A
	phx
	ldx.b $91
	lda.w HomeTeam,x
	cmp.w #$0018
	bcc CODE_80CD61
CODE_80CD4E:
	ldx.w #$0000
	lda.l $7E345A
	lda.b $12
	sta.b $0E
	lda.b $10
	sta.b $0C
	jsl.l CODE_80B719
CODE_80CD61:
	plx
CODE_80CD62:
	lda.w #$0005
	sta.w printx
	lda.b $9F
	sta.b $8F
	lda.b $9D
	sta.b $8D
	jsl.l CODE_9EC7BE
	lda.b $8F
	sta.b $9F
	lda.b $8D
	sta.b $9D
	lda.w #$0008
	sta.w printx
	lda.b [$95]
	and.w #$00FF
	dec a
	sta.b $A5
	jsl.l CODE_9FC372
	jsl.l CODE_9EC7BE
	inc.b $95
	inc.w printy
	inc.w printy
	dec.b $A9
	bmi CODE_80CDA1
	jmp.w CODE_80CD22
