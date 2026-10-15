; During the intermission, show the next ticker score, then the highlights
IntermissionTick:
	lda.w demoflag
	beq IntermissionTick_done
	lda.b $83
	sec
	sbc.w tickervc
	cmp.w #$0150
	bcc IntermissionTick_done
	jsl.l TickerNext
	lda.l tickerstart
	cmp.w TickerNum
	bne IntermissionTick
	jsl.l DoHiLights
	lda.w #$0008
	trb.w sflags3
IntermissionTick_done:
	lda.w #$0000
	rtl
