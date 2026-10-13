; Unidentified routine.
CODE_9BA428:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	lda.w #$009C
	sta.b $0E
	lda.w #DATA8_9C8328
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
	ldy.w #$0050
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF163
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$0014
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8091
	lda.w #$0096
	sta.b $0E
	lda.w #DATA8_96D7AC
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
	stx.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.b $10
	sta.b $0C
	tax
	lda.l $7E35C4
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$1000
	tay
	jsl.l CODE_80891F
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9ACFB6
	sta.b $0C
	ldy.w #$0070
	ldx.w #$0010
	jsl.l CODE_9DE0BD
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l CODE_9DE0D4
	stz.w $1DB9
	jsl.l CODE_8086BD
CODE_9BA4FE:
	jsl.l SpriteFrameStart
	ldx.w #$0048
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF168
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l CODE_9BA563
	jsl.l SpriteFrameEnd
CODE_9BA522:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9BA549
	bit.w #$0800
	bne CODE_9BA54A
	bit.w #$0400
	bne CODE_9BA555
	bra CODE_9BA522
