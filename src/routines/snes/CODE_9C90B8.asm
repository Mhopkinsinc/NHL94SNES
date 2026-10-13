; Unidentified routine.
CODE_9C90B8:
	lda.b $A5
	beq CODE_9C90BF
	lda.w #$0064
CODE_9C90BF:
	sta.b $A5
	jsl.l PushNumber
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF36A
	sta.b $8D
	jsl.l appstring
	lda.b $97
	sta.b $8F
	lda.b $95
	sta.b $8D
	bra CODE_9C9154
