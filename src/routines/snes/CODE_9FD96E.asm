; Unidentified routine.
CODE_9FD96E:
	lda.w pnum,x
	asl a
	sta.b d0
	stz.b a0
	lda.w pfteam,x
	beq .1
	lda.w #$0002
	sta.b a0
.1:
	lda.b a0
	beq .2
	lda.w #$0034
.2:
	clc
	adc.b d0
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	lda.w newpnum,x
	sta.b d3
	jsl.l CODE_9FD9CB
	jmp.w setplayer
