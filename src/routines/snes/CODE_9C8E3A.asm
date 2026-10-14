; Unidentified routine.
CODE_9C8E3A:
	lda.w $1DBD
	beq .1
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces
	sta.b a1
	jsl.l CODE_9EC894
.1:
	lda.w $1DBD
	clc
	adc.w $1DC5
	cmp.w $1DA3
	beq .2
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
	sta.b a1
	jsl.l CODE_9EC894
.2:
	jsr.w CODE_808F7D
	jsl.l WaitFrame
	jmp.w CODE_9C8DFE
