; Unidentified routine.
CODE_9BACC1:
	lda.w Hpos
	sta.w $0CBD
	lda.w Vpos
	sta.w $0CBF
CODE_9BACCD:
	lda.b d7
	sta.w $0ADB
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0CB9
CODE_9BACE5:
	ldx.b d7
	bne CODE_9BACEA
CODE_9BACE9:
	inx
CODE_9BACEA:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.w #$0001
	sta.b d7
	lda.b d0
	bit.w #$0008
	beq CODE_9BAD08
	jmp.w CODE_80AE77
