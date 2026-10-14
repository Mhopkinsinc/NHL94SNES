; Clear the RenderBigText letter tile buffer ($7E4EF5, $300 bytes) and part of its map ($7EA8FC)
ClearBigText:
	lda.w #$007E
	sta.b $12
	lda.w #$4EF5
	sta.b $10
	lda.w #$0000
	ldx.w #$0300
	jsl.l MemFill
	lda.w #$007E
	sta.b $12
	lda.w #$A8FC
	sta.b $10
	ldx.w #$0080
	lda.w #$0000
	jsl.l MemFill
	rts
