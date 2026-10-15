; Draw the exit question and the Yes and No lines.
DrawExitPrompt:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawExitPromptPos>>16
	sta.b $8F
	lda.w #DrawExitPromptPos
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
	jsl.l Framer
	ldy.w #$000D
.loop:
	phy
	lda.w #$2400
	sta.w printa
	lda.w #$0006
	sta.w printx
	sty.w printy
	lda.w #ExitPromptClear>>16
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
	lda.w #DrawExitPromptPos2>>16
	sta.b $8F
	lda.w #DrawExitPromptPos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w printa
	lda.w #ExitGameAsk>>16
	sta.b $8F
	lda.w #ExitGameAsk
	sta.b a1
	lda.w $1D81
	beq .1
	lda.w #ExitShootoutAsk>>16
	sta.b $8F
	lda.w #ExitShootoutAsk
	sta.b a1
.1:
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawExitPromptPos3>>16
	sta.b $8F
	lda.w #DrawExitPromptPos3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w printa
	lda.w $1DB9
	bne .2
	lda.w #$2000
	sta.w printa
.2:
	lda.w #ExitNo>>16
	sta.b $8F
	lda.w #ExitNo
	sta.b a1
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #DrawExitPromptPos4>>16
	sta.b $8F
	lda.w #DrawExitPromptPos4
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$2400
	sta.w printa
	lda.w $1DB9
	beq .3
	lda.w #$2000
	sta.w printa
.3:
	lda.w #ExitYes>>16
	sta.b $8F
	lda.w #ExitYes
	sta.b a1
	jsl.l print
	rtl
