; Unidentified routine.
CODE_9F9811:
	lda.b d0
	bit.w #$1000
	bne CODE_9F97FE
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
	beq .1
	lda.w #$0005
	sta.b d0
.1:
	lda.w #$009F
	sta.b $8F
	lda.w #StatusTextTbl
	sta.b a1
	jml.l PrintStringFromList
