; Unidentified routine.
CODE_9BAB5C:
	pla
	lda.w $0CEB
	sta.w $0CBD
	lda.w $0D37
	sta.w $0CBF
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	stz.w $0AD3
	lda.w #$000A
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	jsl.l CODE_8086BD
	jsl.l SprSort
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	lda.w #$0001
	sta.b $C1
	lda.w #$0002
	trb.w sflags3
	jmp.w $ACE5
