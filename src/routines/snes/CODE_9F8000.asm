; Unidentified routine.
CODE_9F8000:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	stz.w $1DBD
	lda.w #$0006
	sta.w $1DC5
	stz.w $1DB9
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	jsl.l CODE_9F8064
CODE_9F8032:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	bne CODE_9F8054
	bit.w #$4000
	bne CODE_9F8055
	bra CODE_9F8032
