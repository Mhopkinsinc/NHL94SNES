; Unidentified routine.
CODE_9DBE79:
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0014
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	ldy.b $91
	lda.w HomeTeam,y
	ldx.w #$00C8
	ldy.w #$0010
	jsl.l CODE_9DDFBF
	ldy.b $91
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b $95
	ldy.w #$000C
	clc
	adc.b [$95],y
	sta.b $95
	ldy.w $1DB9
	bne CODE_9DBED6
	jmp.w CODE_9DC0EE
