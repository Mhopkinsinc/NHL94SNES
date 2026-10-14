; Pick the controller that owns the pause menu, and rebuild the menu when it changes.
SelectPauseController:
	jsl.l ShowMP5Warning
	jsr.w CODE_9FE75E
	jsl.l IntermissionTick
	beq .t1
	jmp.w CODE_9FE70D

.t1:
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	jsl.l CODE_9B8017
	lda.w $0AC6
	bpl CODE_9FE6B8
	lda.w #$0000
	pha
.loop:
	lda.b $01,s
	asl a
	tax
	lda.w JoyPad,x
	bit.w #$000F
	bne .1
	lda.w $1C84,x
	beq .1
	lda.b $01,s
	jsl.l CODE_9B84DC
	lda.b d3
	bne .t2
.1:
	lda.b $01,s
	inc a
	sta.b $01,s
	cmp.w #$0005
	bcc .loop
	pla
	jmp.w CODE_9FE6F2

.t2:
	pla
	asl a
	tax
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	cmp.w $0AC6
	beq CODE_9FE6AE
	stx.w $0AC6
	stz.w $0D15
	stz.w $0D13
	jsl.l CODE_9FEA24
	jsl.l CODE_9DD923
	jsr.w CODE_9FE9FD
	lda.w #$003C
	sta.w $0AC8
	lda.w #$0014
	sta.w $0AC4
	lda.w $1EB7
	beq .t1x
	cmp.w #$0005
	beq .t1x
	bra CODE_9FE6AD

.t1x:
	jsl.l ChoosePauseMenu
CODE_9FE6AD:
	rtl
