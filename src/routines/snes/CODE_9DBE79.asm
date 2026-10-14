; Unidentified routine.
CODE_9DBE79:
	jsl.l SpriteFrameStart
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0014
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	ldy.b a2
	lda.w HomeTeam,y
	ldx.w #$00C8
	ldy.w #$0010
	jsl.l CODE_9DDFBF
	ldy.b a2
	lda.w #$009C
	sta.b $97
	lda.w tmdata,y
	sta.b a3
	ldy.w #$000C
	clc
	adc.b [a3],y
	sta.b a3
	ldy.w $1DB9
	bne CODE_9DBED6
	jmp.w CODE_9DC0EE
