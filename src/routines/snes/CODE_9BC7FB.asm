; Unidentified routine.
CODE_9BC7FB:
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	lda.w #$FF7F
	and.l $7E34F4
	sta.l $7E34F4
	jsl.l CODE_9DD977
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	jsl.l CODE_9B8017
	jsl.l CODE_9B8526
	jsl.l SpriteFrameStart
	ldx.w #$0053
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF203
	sta.b $8D
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
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF20D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0011
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF212
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	dec.w printx
	dec.w printx
	lda.w #$009B
	sta.b $8B
	lda.w #PasstoText
	sta.b $89
	lda.w #$0004
	sta.b $A5
CODE_9BC8AC:
	lda.w #$0005
	sta.b $A9
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$000D
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
CODE_9BC8C4:
	lda.b [$89]
	sta.b [$8D]
	inc.b $89
	inc.b $8D
	lda.w #$0020
	sta.b [$8D]
	inc.b $8D
	dec.b $A9
	bpl CODE_9BC8C4
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	jsl.l CODE_9EC7BE
	inc.w printy
	inc.w printy
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	dec.b $A5
	bpl CODE_9BC8AC
	stz.b $B5
	jsl.l CODE_9BCA7A
	stz.b $B9
	lda.l $7E34F4
	and.w #$00FF
	cmp.w #$001E
	bcs CODE_9BC90F
	sta.b $B9
CODE_9BC90F:
	jsl.l CODE_9BCAB8
	jsl.l CODE_9D80DD
	lda.w #$0003
	sta.w $0A4A
	phx
	ldy.b $B9
	tyx
	lda.l PasstoText,x
	plx
	sta.w $0A4C
	lda.w #$0000
	sta.b $8F
	lda.w #$0A4A
	sta.b $8D
	inc.w printx
	dec.w printy
	dec.w printy
	jsl.l CODE_9EC7BE
	lda.w #$000A
	sta.w $0AD1
CODE_9BC946:
	jsr.w $CBD8
CODE_9BC949:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF222
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9BC6C9
	jsl.l CODE_9FBF75
CODE_9BC96B:
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B84F5
	jsl.l CODE_9B852C
	lda.b $A9
	beq CODE_9BC96B
	sta.b $A9
	bit.w #$1000
	beq CODE_9BC989
	jmp.w $CAF8
