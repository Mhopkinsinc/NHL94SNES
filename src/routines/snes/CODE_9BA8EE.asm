; Unidentified routine.
CODE_9BA8EE:
	sta.w $0CA9
CODE_9BA8F1:
	lda.w sflags
	bit.w #DMA_OAM
	bne CODE_9BA927
	lda.w ReplayBufferPtr
	clc
	adc.w #$007A
	sta.w ReplayBufferPtr
	bcc CODE_9BA908
	inc.w $0D21
CODE_9BA908:
	cmp.w #$E676
	bne CODE_9BA927
	lda.w $0D21
	cmp.w #$007E
	bne CODE_9BA927
	lda.w #$0010
	tsb.w sflags
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
CODE_9BA927:
	sep #$20
	ldx.w ReplayBufferPtr
	stx.w WMADDL
	lda.w $0D21
	sta.w WMADDH
	lda.b #$0F
	sta.b d2
	ldx.w #$0000
	ldy.w #$0001
CODE_9BA93F:
	lda.w Xpos,x
	sta.w WMDATA
	lda.w $0D56,x
	and.b #$0F
	sta.b $14
	lda.w $0DB8,x
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	lda.w Ypos,x
	sta.w WMDATA
	lda.w $0D97,x
	sta.w WMDATA
	lda.w $0D98,x
	and.b #$3F
	sta.b $14
	lda.w $0E04,x
	and.b #$18
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	dec.b d2
	bpl CODE_9BA93F
	lda.b #$05
	sta.b d2
	ldx.w #$0000
CODE_9BA985:
	lda.w $13C3,x
	sta.w WMDATA
	lda.w $13C5,x
	sta.w WMDATA
	lda.w position,x
	bpl CODE_9BA998
	lda.b #$FF
CODE_9BA998:
	and.b #$0F
	sta.b $14
	lda.w $0F45,x
	bpl CODE_9BA9A3
	lda.b #$FF
CODE_9BA9A3:
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	inx
	inx
	dec.b d2
	bpl CODE_9BA985
	lda.w $0DF9
	sta.w WMDATA
	lda.w $0DFB
	sta.w WMDATA
	lda.w $0CAD
	sta.w WMDATA
	lda.w $0CAF
	sta.w WMDATA
	lda.w $0CB0
	sta.w WMDATA
	lda.w $0CB2
	sta.w WMDATA
	lda.w $0CB3
	sta.w WMDATA
	lda.w $0CB5
	sta.w WMDATA
	lda.w $0CB6
	sta.w WMDATA
	lda.w $0CB8
	sta.w WMDATA
	lda.b d7
	sta.w WMDATA
	lda.w $0AE9
	asl a
	asl a
	asl a
	asl a
	ora.w $0AE7
	sta.w WMDATA
	lda.w $0AED
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEB
	sta.w WMDATA
	lda.w $0AF1
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEF
	sta.w WMDATA
	lda.l $7E35E0
	sta.w WMDATA
	lda.l $7E35E1
	sta.w WMDATA
	lda.w PBnum
	sta.w WMDATA
	lda.w Hpos
	sta.w WMDATA
	lda.w $0CEC
	sta.w WMDATA
	lda.w Vpos
	sta.w WMDATA
	lda.w $0D38
	sta.w WMDATA
	lda.w $0C29
	sta.w WMDATA
	lda.w $0C2A
	sta.w WMDATA
	rep #$20
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
CODE_9BAA5F:
	rtl
