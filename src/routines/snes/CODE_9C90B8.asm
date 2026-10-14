; Unidentified routine.
CODE_9C90B8:
	lda.b d0
	beq CODE_9C90BF
	lda.w #$0064
CODE_9C90BF:
	sta.b d0
	jsl.l PushNumber
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36A
	sta.b a1
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b a3
	sta.b a1
	bra CODE_9C9154
