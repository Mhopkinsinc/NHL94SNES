; Unidentified routine.
CODE_9B91A2:
	pha
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF09D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0A2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w printa
	lda.w #$0011
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ABA95
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
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	lda.w #$0014
	sta.b $26
	ldx.w #$0000
	ldy.w #$0000
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l CODE_808E2D
	pla
	rts
