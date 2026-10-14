; Unidentified routine.
CODE_9DBFEE:
	jsl.l GoalieCount
	lda.b d0
	sta.b d1
	jsl.l CODE_9B92DC
	lda.b d0
	clc
	adc.b d1
	cmp.w $1D9B
org $9DC002
	beq CODE_9DC012
	bmi CODE_9DC012
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC29E
	sta.b a1
	bra CODE_9DC01C
