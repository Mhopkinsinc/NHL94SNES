; Unidentified routine.
CODE_9C8E3A:
	lda.w $1DBD
	beq CODE_9C8E60
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C8E60:
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	beq CODE_9C8E91
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C8E91:
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	jmp.w $8DFE
