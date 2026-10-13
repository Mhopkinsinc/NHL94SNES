; Unidentified routine.
CODE_9BA79F:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE919
	sta.b $0C
CODE_9BA7A9:
	lda.b $04
	pha
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l CODE_808E2D
	jsl.l WaitFrame
	pla
	sta.b $04
	sta.w $1DD1
	beq CODE_9BA848
CODE_9BA7FB:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE8EC
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	lda.w #$007F
	sta.b $0E
	lda.w #$0000
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$001C
	sta.b $26
	ldx.w #$0007
	ldy.w #$000B
	lda.l $7E35AA
	clc
	adc.l $7E35C4
	clc
	adc.w #$1C00
	jsl.l CODE_9BA72C
CODE_9BA848:
	rtl
