; Roster column: where the player is (ice, bench, injured) or his penalty time
AttribStatus:
	asl.b d0
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	adc.b d0
	tay
	lda.w tmpdst,y
	sta.b d0
	bpl .5
	eor.w #$FFFF
	sta.b d0
	cmp.w #$0004
	bcc .4
.2:
	lda.w #$0001
	sta.b d0
	bra .4
.3:
	lda.w #$0003
	sta.b d0
.4:
	lda.w #StatusTextTbl>>16
	sta.b a1+2
	lda.w #StatusTextTbl
	sta.b a1
	jml.l PrintStringFromList
.5:
	lda.b d0
	bit.w #$1000
	bne .3
	lda.b d0
	sta.b d1
	and.w #$0FFF
	sta.b d0
	jsl.l PushTime
	jsl.l print
	lda.w #$0004
	sta.b d0
	lda.w #$4000
	trb.b d1
	beq .1x
	lda.w #$0005
	sta.b d0
.1x:
	lda.w #StatusTextTbl>>16
	sta.b a1+2
	lda.w #StatusTextTbl
	sta.b a1
	jml.l PrintStringFromList
