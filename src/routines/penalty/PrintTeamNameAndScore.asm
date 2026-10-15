; Print team a2's name, then its score as two characters
PrintTeamNameAndScore:
	jsl.l printteamname
	ldy.b a2
	lda.w tmscore,y
	sta.b d0
	jsl.l Mod100
	lda.w #mesarea>>16
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0004
	sta.b [a1]
	lda.w #$0020
	sta.w mesarea+2
	lda.b d0
	sta.b $08
	lda.w #$000A
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	beq .1
	adc.w #$0030
	sta.w mesarea+2
.1:
	lda.w RDMPYL
	adc.w #$0030
	sta.w mesarea+3
	jml.l print
