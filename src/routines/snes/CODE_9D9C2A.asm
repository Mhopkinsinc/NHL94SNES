; Unidentified routine.
CODE_9D9C2A:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
.loop:
	ldy.b $04
	lda.b [$10],y
	ldy.b $16
	iny
.loop2:
	asl a
	dey
	bne .loop2
	ldy.b $0A
	and.w DATA8_9D9B7B,y
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne .loop
	rts
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w printa
	sta.l $7EC67C,x
	inc a
	sta.l $7EC77C,x
	rtl
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w #DMA_OAM
	sta.l $7EA67C,x
	inc a
	sta.l $7EA6BC,x
	rtl
