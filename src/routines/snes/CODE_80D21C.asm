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
	bmi .t1
	bvc CODE_80D267
	bra CODE_80D269

.t1:
	bvc CODE_80D269
CODE_80D267:
	dec.b d1
CODE_80D269:
	lda.w #$3800
	sta.w $0D0D
	lda.b d1
	cmp.w $1D9B
	bne .1
	lda.w #$2000
	sta.w $0D0D
.1:
	lda.b $8F
	sta.b $9F
	lda.b a1
	sta.b $9D
	lda.w #$0002
	sta.w printx
	lda.b a3
	and.w #$00FF
	dec a
	sta.b d0
	sta.b $04
	stz.b $08
	jsl.l GoalieCount
	lda.b $04
	cmp.b d0
	bpl .2
	lda.w #$0010
	sta.b $08
.2:
	lda.b $04
	sta.b d0
	jsl.l CODE_9F9745
	inc.b a3
	inc.w printy
	dec.b d1
	bpl CODE_80D269
	lda.w #$2000
	sta.w $0D0D
	rtl
