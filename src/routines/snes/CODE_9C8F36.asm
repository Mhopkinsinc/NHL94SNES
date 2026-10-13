; Unidentified routine.
CODE_9C8F36:
	lda.w #$0001
	sta.w printx
	lda.w $1DBD
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
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
	lda.w #$9369
	sta.b $8D
	jsl.l CODE_9EC894
	rts
