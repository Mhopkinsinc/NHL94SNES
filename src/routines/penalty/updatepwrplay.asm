; Unidentified routine.
updatepwrplay:
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9EB769
	stz.b $91
	lda.w #$0002
	sta.b $95
	lda.w tmap
	sec
	sbc.w $17A8
	sta.b $A5
	bne CODE_9EB753
	jmp.w updatepwrplay_clr
