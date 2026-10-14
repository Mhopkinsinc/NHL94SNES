; Unidentified routine.
CODE_9B995F:
	lda.w #$0001
	sta.w printx
	lda.w #$2000
	sta.w $0D0D
	ldy.w #$0000
	lda.b [a3],y
	phy
	pha
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$0004
	sta.w printx
	pla
	and.w #$0FFF
	sta.b d0
	jsl.l PushTime
	lda.b [a1]
	cmp.w #$0006
	bne CODE_9B99AA
	inc.w printx
CODE_9B99AA:
	jsl.l CODE_9EC894
	lda.w #$000A
	sta.w printx
	ply
	iny
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	and.w #$00FF
	pha
	and.w #$0080
	sta.b d3
	stz.b a2
	lda.b d3
	beq CODE_9B99D2
	lda.w #$0002
	sta.b a2
CODE_9B99D2:
	jsl.l CODE_9B9B35
	dec.w printy
	dec.w printy
	lda.w #$000E
	sta.w printx
	pla
	and.w #$007F
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	ply
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	and.w #$00FF
	tay
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.w #$0080
	sta.b $8F
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.w #$001D
	sta.w printx
	lda.b [a1]
	and.w #$00FF
	sta.b d0
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w #$0002
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	pla
	sta.b $8F
	pla
	sta.b a1
	lda.w #$2400
	sta.w $0D0D
	inc.w printy
	lda.w #$0010
	sta.w printx
	inc.b a1
	inc.b a1
	lda.b [a1]
	sta.b d0
	tay
	dec.b a1
	lda.b [a1],y
	inc.b a1
	and.w #$00FF
	bne CODE_9B9A58
	dec.b d0
CODE_9B9A58:
	jsl.l CODE_9EC894
	rts
