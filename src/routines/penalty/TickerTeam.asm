; Print one ticker line: team d0's name and score d1
TickerTeam:
	lda.b $04,s
	sta.w printx
	inc.w printy
	lda.b d0
	jsl.l CODE_9BC5AB
	jsl.l print
	lda.b $04,s
	clc
	adc.w #$0017
	sta.w printx
	lda.b d1
	sta.b d0
	jsl.l PushNumber
	jml.l print
