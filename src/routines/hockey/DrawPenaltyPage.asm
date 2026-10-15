; Draw the visible penalty rows, or No Penalties when the list is empty.
DrawPenaltyPage:
	lda.w listend
	cmp.w #$0000
	beq .t1
.1:
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
	ldy.w #$0160
	jsl.l DMAToVRAM
	rts

.t1:
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #NoPenalties>>16
	sta.b a1+2
	lda.w #NoPenalties
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l QueueTextDMA
	rts
