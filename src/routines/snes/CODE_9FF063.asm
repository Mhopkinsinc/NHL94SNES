; Unidentified routine.
CODE_9FF063:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF918
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	ldy.w #$000D
.loop:
	phy
	lda.w #$2400
	sta.w $0D0D
	lda.w #$0006
	sta.w printx
	sty.w printy
	lda.w #$009F
	sta.b $8F
	lda.w #ExitPromptClear
	sta.b a1
	jsl.l print
	ply
	iny
	cpy.w #$0012
	bcc .loop
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF91D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w #$009F
	sta.b $8F
	lda.w #ExitGameAsk
	sta.b a1
	lda.w $1D81
	beq .1
	lda.w #$009F
	sta.b $8F
	lda.w #ExitShootoutAsk
	sta.b a1
.1:
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF922
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	bne .2
	lda.w #$2000
	sta.w $0D0D
.2:
	lda.w #$009F
	sta.b $8F
	lda.w #ExitNo
	sta.b a1
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF927
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	beq .3
	lda.w #$2000
	sta.w $0D0D
.3:
	lda.w #$009F
	sta.b $8F
	lda.w #ExitYes
	sta.b a1
	jsl.l print
	rtl
