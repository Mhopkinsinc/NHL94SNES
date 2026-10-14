; Unidentified routine.
CODE_9C90F0:
	lda.b [a0]
	inc.b a0
	inc.b a0
	clc
	adc.b a2
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	lda.b [a0]
	sta.b d1
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36D
	sta.b a1
	jsl.l appstring
	lda.b a2
	clc
	adc.b d1
	tay
	lda.w $0000,y
	sta.b d0
	jsl.l PushNumber
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	bra CODE_9C9154
