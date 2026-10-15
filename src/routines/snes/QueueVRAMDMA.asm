; Add a DMA of X bytes from [$0C] to video memory at Y to the NMI transfer list
QueueVRAMDMA:
	txa
	ldx.b DMAQueueTail
.loop:
	sta.b $14
	cmp.w #$1000
	bcc .1
	lda.w #$1000
.1:
	sta.w DMAQueue+4,x
	lsr a
	sta.b $16
	tya
	sta.w DMAQueue+6,x
	clc
	adc.b $16
	tay
	lda.b $0C
	sta.w DMAQueue+1,x
	clc
	adc.b $16
	adc.b $16
	sta.b $0C
	sep #$20
	lda.b $0E
	sta.w DMAQueue+3,x
	lda.b #$01
	sta.w DMAQueue,x
	rep #$20
	txa
	clc
	adc.w #$0008
	and.w #$03FF
	tax
	lda.b $14
	sec
	sbc.w #$1000
	beq .2
	bcs .loop
.2:
	stx.b DMAQueueTail
	rtl
