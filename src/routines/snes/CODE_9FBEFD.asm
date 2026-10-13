; Unidentified routine.
CODE_9FBEFD:
	lda.w sflags
	bit.w #$2000
	bne CODE_9FBF74
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8D2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AEA3A
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0019
	lda.w #$2000
	clc
	adc.l $7E35B0
	adc.l $7E35AA
	jsl.l CODE_808E2D
	lda.w #$0321
	cmp.w $0CD5
	bcs CODE_9FBF59
	sta.w $0CD5
CODE_9FBF59:
	lda.l DATA8_9AEA3A+2
	clc
	adc.w #$0019
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.l DATA8_9AEA3A
	cmp.w $0CD7
	bcc CODE_9FBF74
	sta.w $0CD7
CODE_9FBF74:
	rtl
