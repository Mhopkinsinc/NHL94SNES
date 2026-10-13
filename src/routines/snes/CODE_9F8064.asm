; Unidentified routine.
CODE_9F8064:
	jsl.l SpriteFrameStart
	jsl.l CODE_9DDDB3
	jsl.l WaitDMAQueue
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7A5
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$0013
	sta.b $A9
	lda.l $7E35B6
	sta.b $AD
	jsl.l eraser
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w VisTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7BD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.w #$000A
	sta.w printx
	ldx.w #$0000
	jsl.l CODE_9F813E
	lda.w #$000E
	sta.w printx
	ldx.w #$0001
	jsl.l CODE_9F813E
	lda.w #$0012
	sta.w printx
	ldx.w #$0002
	jsl.l CODE_9F813E
	lda.w #$0016
	sta.w printx
	ldx.w #$0003
	jsl.l CODE_9F813E
	lda.w #$001A
	sta.w printx
	ldx.w #$0004
	jsl.l CODE_9F813E
	jsl.l SpriteFrameEnd
	rtl
