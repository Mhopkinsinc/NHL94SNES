; Unidentified routine.
CODE_9DBFEE:
	jsl.l GoalieCount
	lda.b $A5
	sta.b $A9
	jsl.l CODE_9B92DC
	lda.b $A5
	clc
	adc.b $A9
	cmp.w $1D9B
org $9DC002
	beq CODE_9DC012
	bmi CODE_9DC012
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC29E
	sta.b $8D
	bra CODE_9DC01C
