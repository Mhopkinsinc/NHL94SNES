; Unidentified routine.
CODE_9DBCB3:
	lda.w $07D6
.loop:
	dec a
	bmi .t1
	sta.w $07D6
	tay
	eor.w #$FFFF
	inc a
	and.w #$00FF
	beq .1
	sta.w $0BCB
	sec
	sbc.w #$0020
	bmi .1
	and.w #$00FF
	sta.w $0BCF
.1:
	tya
	ldx.w #$0200
	jsr.w TitleDelay
	bra .loop

.t1:
	stz.w $07D6
	lda.w #$00FF
	sta.w $0BCB
	sta.w $0BCF
	rts
