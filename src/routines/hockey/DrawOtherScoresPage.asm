; Draw the other-scores rows, or No Other Games when the list has one entry.
DrawOtherScoresPage:
	lda.w listend
	cmp.w #$0001
	bne .t1
.1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #NoOtherGames>>16
	sta.b $8F
	lda.w #NoOtherGames
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l QueueTextDMA
	bra .2

.t1:
	lda.w listtop
	asl a
	adc.w listtop
	xba
	lsr a
	lsr a
	adc.w #$2780
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	lda.w listrows
	asl a
	adc.w listrows
	xba
	lsr a
	lsr a
	tax
	ldy.w #$0140
	jsl.l DMAToVRAM
.2:
	rtl
