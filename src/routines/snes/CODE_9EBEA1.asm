; Unidentified routine.
CODE_9EBEA1:
	lda.w #$000B
	sta.b $A5
	lda.w PBnum
	sta.b $A9
	lda.w pfteam,x
	bne CODE_9EBEBD
	lda.b $A9
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $A9
	lda.w #$FFF5
	sta.b $A5
CODE_9EBEBD:
	lda.b $A9
	and.w #$000F
	sta.b $A9
	cmp.w #$0003
	bcc CODE_9EBECE
	lda.w #$0002
	sta.b $A9
CODE_9EBECE:
	inc.b $A9
	inc.b $A9
	inc.b $A9
	phx
	lda.b $A5
	ldx.b $A9
	jsl.l Mul16S
	plx
	rtl
