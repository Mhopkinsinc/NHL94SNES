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
	bpl .t1
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

.t1:
	jsl.l CODE_9B92DC
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DAB
CODE_9B8E4F:
	sta.w $1DA7
	lda.w #$0009
	cmp.w $1DA3
	beq .1
	bmi .1
	lda.w $1DA3
.1:
	sta.w $1DAF
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9B9320
	lda.b a3
	clc
	adc.b d0
	clc
	adc.w $1D9F
	sec
	sbc.w $1D8B
	sta.b a3
	jsr.w CODE_9B8D72
	sta.w $1D9B
	lda.w $1DAF
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl .t1
	lda.w $1D9B
	sec
	sbc.w $1DAF
	sec
	sbc.w $1DA7
	bmi .2
	clc
	adc.w $1DA7
	sta.w $1DA7
.2:
	lda.w #$0000
	bra CODE_9B8EB5

.t1:
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
CODE_9B8EB5:
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8EBC:
	jsl.l CODE_9DD923
	jsl.l CODE_9DD94D
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t2
	lda.w #$FFFF
	jmp.w CODE_9B91A1

.t2:
	bit.w #$8080
	beq .t1
	lda.w $1DA7
	clc
	adc.w $1DAF
	sec
	sbc.w $1D9B
	jmp.w CODE_9B91A1

.t1:
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne CODE_9B8F2B
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne CODE_9B8F2B
	bit.w #$0400
	bne .1
	inc.b d0
	inc.b d0
	bit.w #$0800
	beq CODE_9B8F28
.1:
	lda.b d0
	clc
	adc.w $1D9B
	bmi CODE_9B8F3E
	cmp.w $1DAF
	bpl CODE_9B8F5D
	sta.w $1D9B
	jsl.l CODE_9B8F7B
CODE_9B8F28:
	jmp.w CODE_9B8EBC
CODE_9B8F2B:
	lda.b d0
	clc
	adc.w $0D47
	sta.b d0
	bmi CODE_9B8F28
	sta.w $0D47
	jsl.l CODE_9B8F7B
	bra CODE_9B8F28
CODE_9B8F3E:
	lda.w $1DA7
	sec
	sbc.w $1DAB
	clc
	adc.w $1DAF
	cmp.w $1DA3
	bpl CODE_9B8F28
	inc.w $1DA7
	jsl.l CODE_9B8F7B
	lda.w #$FFFF
	sta.w $07E0
	bra CODE_9B8F28
