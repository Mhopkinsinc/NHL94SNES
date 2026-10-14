; Period stats for both teams. Start leaves, Y swaps the view.
ShowPeriodStats:
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
	jsl.l ScreenOn
	jsl.l DrawPeriodStats
.1:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne .t1
	bit.w #$4000
	bne .t2
	bra .1

.t1:
	rtl

.t2:
	lda.w $1DB9
	eor.w #$0001
	sta.w $1DB9
	jsl.l DrawPeriodStats
	bra .1
