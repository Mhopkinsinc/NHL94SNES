; Unidentified routine.
CODE_9BACC1:
	lda.w $0CEB
	sta.w $0CBD
	lda.w $0D37
	sta.w $0CBF
CODE_9BACCD:
	lda.b $C1
	sta.w $0ADB
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0CB9
CODE_9BACE5:
	ldx.b $C1
	bne CODE_9BACEA
CODE_9BACE9:
	inx
CODE_9BACEA:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	lda.w #$0001
	sta.b $C1
	lda.b $A5
	bit.w #$0008
	beq CODE_9BAD08
	jmp.w CODE_80AE77
