; Unidentified routine.
CODE_9DCA56:
	lda.w #$0092
	sta.b $0E
	lda.w #DATA8_92FFB0
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.l $7E35D2
	clc
	adc.w $1E87
	ldy.b $91
	beq CODE_9DCA7F
	clc
	adc.w #$0030
CODE_9DCA7F:
	plx
	ply
	jsl.l CODE_9DCAB7
CODE_9DCA85:
	ldy.b $91
	lda.w HomeTeam,y
	asl a
	asl a
	clc
	adc.w #$D8B3
	sta.b $8D
	lda.w #$009D
	sta.b $8F
	lda.b [$8D]
	sta.b $0C
	inc.b $8D
	inc.b $8D
	lda.b [$8D]
	sta.b $0E
	lda.b $91
	beq CODE_9DCAAC
	ldy.w #$0010
	bra CODE_9DCAAF
