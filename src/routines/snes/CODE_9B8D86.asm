; Unidentified routine.
CODE_9B8D86:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF07C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l SpriteFrameStart
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE9C7
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
	ldx.w #$0001
	ldy.w #$0001
	lda.l $7E35AC
	clc
	adc.w #$0C00
	jsl.l WaitFrame
	jsl.l CODE_808E2D
	jsl.l CODE_9DD938
	jsl.l CODE_9DD962
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0003
	bpl CODE_9B8E3D
	jsl.l CODE_9B9300
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DAB
	jsl.l CODE_9B92DC
	lda.w $1DAB
	clc
	adc.b d0
	sta.w $1DAB
	bra CODE_9B8E4F
