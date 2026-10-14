; Unidentified routine.
CODE_9FE628:
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jsl.l CODE_9B8017
	lda.w $0AC6
	bpl CODE_9FE6B8
	lda.w #$0000
	pha
CODE_9FE645:
	lda.b $01,s
	asl a
	tax
	lda.w $0776,x
	bit.w #$000F
	bne CODE_9FE660
	lda.w $1C84,x
	beq CODE_9FE660
	lda.b $01,s
	jsl.l CODE_9B84DC
	lda.b $B1
	bne CODE_9FE66E
CODE_9FE660:
	lda.b $01,s
	inc a
	sta.b $01,s
	cmp.w #$0005
	bcc CODE_9FE645
	pla
	jmp.w CODE_9FE6F2
