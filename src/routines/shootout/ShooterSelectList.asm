; pick the player for the shooter row at the cursor
ShooterSelectList:	; pick the player for the shooter row at the cursor
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFB5
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
	lda.b $A5
	sta.w $1DA3
	jsl.l GoalieCount
	lda.w $1DA3
	sec
	sbc.b $A5
	sta.w $1DA3
	lda.b $A5
	sta.w $1DAB
	lda.b $A5
	sta.w $1DA7
	lda.w #$0000
	sta.b $97
	lda.w #homeshooters
	sta.b $95
	lda.b $91
	beq CODE_80CEFF
	lda.w #$0000
	sta.b $97
	lda.w #awayshooters
	sta.b $95
CODE_80CEFF:
	lda.b $95
	clc
	adc.w $1DB9
	sta.b $95
	lda.b [$95]
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
	bmi CODE_80CF31
	clc
	adc.w $1DA7
	sta.w $1DA7
CODE_80CF31:
	lda.w #$0000
	bra CODE_80CF41
