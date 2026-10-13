; Unidentified routine.
CODE_80AB47:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08AE,x
CODE_80AB4E:
	sta.w $08BF,x
CODE_80AB51:
	rep #$20
	cpy.b #$EA
	bne CODE_80AB5E
CODE_80AB57:
	lda.b $5A
	and.w #$00FF
	sta.b $62
CODE_80AB5E:
	rep #$20
	jmp.w CODE_80ABA5
