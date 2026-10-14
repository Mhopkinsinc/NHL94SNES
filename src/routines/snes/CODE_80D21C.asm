; Unidentified routine.
CODE_80D21C:		; print the rows of the list from $1DA7, the row at the cursor ($1D9B) in another palette
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFD6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	ldy.b a2
	lda.w $1DA7
	inc a
	sta.b a3
	lda.w #$0080
	sta.b $9F
	lda.w #PositionNames
	sta.b $9D
	lda.w #$0008
	sta.b d1
	lda.w SelectedPlayerIdx
	sec
	sbc.w #$0005
	beq CODE_80D269
	bmi CODE_80D265
	bvc CODE_80D267
	bra CODE_80D269
