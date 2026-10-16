; Every game loop: let the crowd level fade
updatecrowdf:
	lda.b crowdhold
	beq .t1
	cmp.w #$003C
	bcc .1
	lda.w #$003C
.1:
	sec
	sbc.b d7
	bpl .2
	lda.w #$0000
.2:
	sta.b crowdhold
	rtl

.t1:
	lda.l crowdlevel
	cmp.w #$0480
	bcc .1x
	lda.w #$0480
.1x:
	sec
	sbc.w impactstep
	sta.l crowdlevel
	bpl .rtl
	lda.w #$0000
	sta.l crowdlevel
.rtl:
	rtl
