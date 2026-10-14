; Unidentified routine.
CODE_9FD96E:
	lda.w pnum,x
	asl a
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	beq CODE_9FD980
	lda.w #$0002
	sta.b a0
CODE_9FD980:
	lda.b a0
	beq CODE_9FD987
	lda.w #$0034
CODE_9FD987:
	clc
	adc.b d0
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b d3
	jsl.l CODE_9FD9CB
	jmp.w setplayer
