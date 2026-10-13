; Unidentified routine.
CODE_9D9C2A:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
CODE_9D9C34:
	ldy.b $04
	lda.b [$10],y
	ldy.b $16
	iny
CODE_9D9C3B:
	asl a
	dey
	bne CODE_9D9C3B
	ldy.b $0A
	and.w DATA8_9D9B7B,y
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne CODE_9D9C34
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
	ora.w $0D0D
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
	ora.w #$0400
	sta.l $7EA67C,x
	inc a
	sta.l $7EA6BC,x
	rtl
