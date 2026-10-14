; Unidentified routine.
CODE_9B9768:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	lda.w #$0000
	sta.w $1DB9
	sta.w $1DBD
	sta.w $1DC1
	ldx.w #$0058
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0F9
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F75C2
	lda.w #$2BFF
	sta.l $7F7502
	lda.w #$6F7B
	sta.l $7F7522
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF104
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $163C
	sta.w $1DC1
	lda.w $1DC1
	cmp.w #$0006
	bcc CODE_9B97E3
CODE_9B97DF:
	jsl.l CODE_9B9A5D
CODE_9B97E3:
	jsr.w CODE_9B9917
	jsl.l CODE_9DD923
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l CODE_9BCDF8
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsr.w CODE_9B98C9
CODE_9B9808:
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $B1
	bit.w #$1000
	beq CODE_9B9818
	rtl
