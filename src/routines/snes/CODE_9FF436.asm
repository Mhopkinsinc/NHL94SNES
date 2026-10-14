; Unidentified routine.
CODE_9FF436:
	stz.w $0AD3
	jsl.l CODE_8086A9
	jsl.l CODE_9B8000
	jsl.l CODE_9C97E9
	sep #$20
	lda.b #$FF
	sta.w $07E2
	rep #$30
	ldy.w #$01A0
	lda.w #$6000
	ldx.w #$0000
	jsl.l InitSprites
	stz.b $3A
	stz.b $3C
	lda.w #DATA8_9FF4C0
	sta.b $0C
	lda.w #$009F
	sta.b $0E
	jsl.l CODE_9FFAB4
	jsr.w CODE_9FF4D8
	stz.b $C3
	jsr.w CODE_9FF5E3
	stz.w $0AD1
	stz.w $0AD3
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #$009F
	lda.w #$FA17
	jsl.l CODE_80855E
	jsl.l CODE_8086BD
	lda.w #$7000
	sta.b $64
	ldx.w #$003C
.loop:
	jsl.l WaitFrame
	dex
	bpl .loop
	ldx.w #$009F
	lda.w #$FA17
	jsl.l CODE_80855E
.loop2:
	jsl.l RandomWord
	jsr.w CODE_9FF613
	bne .t1
	lda.b $3C
	cmp.b $3A
	beq .loop2
	bra .loop2

.t1:
	jsl.l CODE_8086A9
	rtl
