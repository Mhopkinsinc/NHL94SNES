; Unidentified routine.
CODE_9FE75E:
	lda.l $7E34CC
	beq CODE_9FE793
	ldx.w $0AC6
	bmi CODE_9FE793
	lda.w $1C84,x
	beq CODE_9FE793
	dec a
	beq .t1
	ldx.w #$76DE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76FE
	bra CODE_9FE78D

.t1:
	ldx.w #$76FE
	ldy.w #$007F
	lda.w #$FFFF
	sta.l $7F76DE
CODE_9FE78D:
	jsl.l CODE_9D96A9
	bra CODE_9FE79E
