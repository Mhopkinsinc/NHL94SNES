; Unidentified routine.
CODE_80CC1B:
	lda.l $7E3468
	beq CODE_80CC25
	jsl.l CODE_80CB5C
CODE_80CC25:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEF9C
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFA6
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	lda.b $91
	beq CODE_80CC65
	lda.w VisTeam
	sta.b $A9
CODE_80CC65:
	jsl.l CODE_9FBE08
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq CODE_80CC88
	jsl.l WaitFrame
	lda.w #$0050
	sta.w $1DEF
	lda.w #$0000
	sta.l $7E3468
CODE_80CC88:
	rtl
