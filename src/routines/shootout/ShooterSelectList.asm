; Shootout shooters: the select-player list
ShooterSelectList:
	jsl.l SpriteFrameStart
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #DATA8_9CEFB5>>16
	sta.b a1+2
	lda.w #DATA8_9CEFB5
	sta.b a1
	jsl.l CODE_9EC7BE
	pla
	sta.b a1
	pla
	sta.b a1+2
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
	jsl.l CODE_808E2D
	jsl.l CODE_9DD938
	jsl.l CODE_9DD962
	jsl.l SpriteFrameEnd
	jsl.l WaitFrame
	lda.w #$0007
	sta.w $1DEF
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.w $1DA3
	sec
	sbc.b d0
	sta.w $1DA3
	lda.b d0
	sta.w $1DAB
	lda.b d0
	sta.w $1DA7
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .list
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
.list:
	lda.b a3
	clc
	adc.w $1DB9
	sta.b a3
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.w $1D9B
	lda.w #$0008
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl CODE_80CF36
	lda.w $1D9B
	sec
	sbc.w #$0008
	sec
	sbc.w $1DA7
	bmi .zero
	clc
	adc.w $1DA7
	sta.w $1DA7
.zero:
	lda.w #$0000
	bra CODE_80CF41
