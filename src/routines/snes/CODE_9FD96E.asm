; Unidentified routine.
CODE_9FD96E:
	lda.w pnum,x
	asl a
	sta.b $A5
	stz.b $89
	lda.w pfteam,x
	beq CODE_9FD980
	lda.w #$0002
	sta.b $89
CODE_9FD980:
	lda.b $89
	beq CODE_9FD987
	lda.w #$0034
CODE_9FD987:
	clc
	adc.b $A5
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b $B1
	jsl.l CODE_9FD9CB
	jmp.w setplayer
