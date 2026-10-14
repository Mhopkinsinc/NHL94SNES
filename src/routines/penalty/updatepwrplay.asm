; Show the power play box: the time left and the team on the power play
updatepwrplay:
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9EB769
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w tmap
	sec
	sbc.w tmap+2
	sta.b d0
	bne CODE_9EB753
	jmp.w updatepwrplay_clr
