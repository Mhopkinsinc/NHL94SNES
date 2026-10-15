; a1 = the full name of team A: its TeamList city, or LongNYIslanders / LongNYRangers for teams $0D / $0E
GetTeamLongName:
	cmp.w #$000D
	beq .t1
	cmp.w #$000E
	beq .t2
	asl a
	asl a
	tay
	lda.w #TeamList>>16
	sta.b a1+2
	lda.w #TeamList
	sta.b a1
	lda.b [a1],y
	sta.b a1
	ldy.w #$0004
	clc
	adc.b [a1],y
	sta.b a1
	bra .1

.t1:
	lda.w #LongNYIslanders>>16
	sta.b a1+2
	lda.w #LongNYIslanders
	sta.b a1
	bra .1

.t2:
	lda.w #LongNYRangers>>16
	sta.b a1+2
	lda.w #LongNYRangers
	sta.b a1
.1:
	rtl
