; Unidentified routine.
CODE_9BC49A:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	jsl.l CODE_808EDF
	lda.w $1DC1
	cmp.w #$0001
	beq CODE_9BC4F2
	lda.w #$2400
	sta.w printa
	lda.w #$0000
	sta.w printy
	lda.b $00
	sta.w $1DB9
	stz.w $1DE9
CODE_9BC4D0:
	cmp.l $7E35D6
	bne CODE_9BC4DB
CODE_9BC4D6:
	inc.w $1DE9
	bra CODE_9BC4E9
