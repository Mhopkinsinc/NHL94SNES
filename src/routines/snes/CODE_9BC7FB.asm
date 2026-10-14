; Unidentified routine.
CODE_9BC7FB:
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	lda.w #$FF7F
	and.l PassWord
	sta.l PassWord
	jsl.l CODE_9DD977
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	jsl.l CODE_9B8017
	jsl.l CODE_9B8526
	jsl.l SpriteFrameStart
	ldx.w #$0053
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF203
	sta.b a1
	jsl.l CODE_9C936C
	lda.w #$001C
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF20D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0011
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF212
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	dec.w printx
	dec.w printx
	lda.w #$009B
	sta.b $8B
	lda.w #PasstoText
	sta.b a0
	lda.w #$0004
	sta.b d0
CODE_9BC8AC:
	lda.w #$0005
	sta.b d1
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$000D
	sta.b [a1]
	inc.b a1
	inc.b a1
CODE_9BC8C4:
	lda.b [a0]
	sta.b [a1]
	inc.b a0
	inc.b a1
	lda.w #$0020
	sta.b [a1]
	inc.b a1
	dec.b d1
	bpl CODE_9BC8C4
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	jsl.l print
	inc.w printy
	inc.w printy
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	dec.b d0
	bpl CODE_9BC8AC
	stz.b d4
	jsl.l CODE_9BCA7A
	stz.b d5
	lda.l PassWord
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC90F
	sta.b d5
CODE_9BC90F:
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b d5
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b a1
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l print
	lda.w #$000A
	sta.w $0AD1
CODE_9BC946:
	jsr.w CODE_9BCBD8
CODE_9BC949:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF222
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9BC6C9
	jsl.l CODE_9FBF75
CODE_9BC96B:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B84F5
	jsl.l ProcessInputWithRepeat
	lda.b d1
	beq CODE_9BC96B
	sta.b d1
	bit.w #$1000
	beq CODE_9BC989
	jmp.w CODE_9BCAF8
