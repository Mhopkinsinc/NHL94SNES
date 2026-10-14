; Unidentified routine.
CODE_9EBEA1:
	lda.w #$000B
	sta.b d0
	lda.w PBnum
	sta.b d1
	lda.w pfteam,x
	bne CODE_9EBEBD
	lda.b d1
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d1
	lda.w #$FFF5
	sta.b d0
CODE_9EBEBD:
	lda.b d1
	and.w #$000F
	sta.b d1
	cmp.w #$0003
	bcc CODE_9EBECE
	lda.w #$0002
	sta.b d1
CODE_9EBECE:
	inc.b d1
	inc.b d1
	inc.b d1
	phx
	lda.b d0
	ldx.b d1
	jsl.l Mul16S
	plx
	rtl
