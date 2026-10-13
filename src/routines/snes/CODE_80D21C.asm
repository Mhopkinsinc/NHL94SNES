; Unidentified routine.
CODE_80D21C:		; print the rows of the list from $1DA7, the row at the cursor ($1D9B) in another palette
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFD6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	dec a
	asl a
	asl a
	asl a
	sta.b $A5
	ldy.b $91
	lda.w $1DA7
	inc a
	sta.b $95
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0008
	sta.b $A9
	lda.w $0D43
	sec
	sbc.w #$0005
	beq CODE_80D269
	bmi CODE_80D265
	bvc CODE_80D267
	bra CODE_80D269
