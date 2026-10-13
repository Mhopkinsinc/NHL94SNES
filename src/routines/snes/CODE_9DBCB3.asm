; Unidentified routine.
CODE_9DBCB3:
	lda.w $07D6
CODE_9DBCB6:
	dec a
	bmi CODE_9DBCDE
	sta.w $07D6
	tay
	eor.w #$FFFF
	inc a
	and.w #$00FF
	beq CODE_9DBCD5
	sta.w $0BCB
	sec
	sbc.w #$0020
	bmi CODE_9DBCD5
	and.w #$00FF
	sta.w $0BCF
CODE_9DBCD5:
	tya
	ldx.w #$0200
	jsr.w $B884
	bra CODE_9DBCB6
