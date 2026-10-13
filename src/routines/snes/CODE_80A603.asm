; Unidentified routine.
CODE_80A603:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jsr.w CODE_80A568
	sta.b $5E
CODE_80A60F:
	rts
