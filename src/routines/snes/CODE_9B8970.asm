; Unidentified routine.
CODE_9B8970:
	lda.l $7E3468
	beq CODE_9B8979
	jsr.w Div16S_divneg
CODE_9B8979:
	jsl.l SpriteFrameStart
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFF4
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF000
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	lda.b $91
	beq CODE_9B89BC
CODE_9B89B4:
	lda.w VisTeam
	sta.b $A9
	lda.w #$0030
CODE_9B89BC:
	sta.b $A5
	jsl.l CODE_9FBE08
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	lda.l $7E3468
	beq CODE_9B89E1
	jsl.l WaitFrame
	lda.w #$0068
	sta.w $1DEF
	lda.w #$0000
	sta.l $7E3468
CODE_9B89E1:
	jsl.l CODE_9DE0D4
	rtl
