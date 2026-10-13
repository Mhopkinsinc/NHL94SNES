; Unidentified routine.
CODE_9B995F:
	lda.w #$0001
	sta.w printx
	lda.w #$2000
	sta.w $0D0D
	ldy.w #$0000
	lda.b [$95],y
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
	sta.b $A5
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$0004
	sta.w printx
	pla
	and.w #$0FFF
	sta.b $A5
	jsl.l PushTime
	lda.b [$8D]
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
	lda.b [$95],y
	rep #$20
	phy
	and.w #$00FF
	pha
	and.w #$0080
	sta.b $B1
	stz.b $91
	lda.b $B1
	beq CODE_9B99D2
	lda.w #$0002
	sta.b $91
CODE_9B99D2:
	jsl.l CODE_9B9B35
	dec.w printy
	dec.w printy
	lda.w #$000E
	sta.w printx
	pla
	and.w #$007F
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	ply
	iny
	sep #$20
	lda.b [$95],y
	rep #$20
	and.w #$00FF
	tay
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	lda.w #$001D
	sta.w printx
	lda.b [$8D]
	and.w #$00FF
	sta.b $A5
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$0002
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC894
	pla
	sta.b $8F
	pla
	sta.b $8D
	lda.w #$2400
	sta.w $0D0D
	inc.w printy
	lda.w #$0010
	sta.w printx
	inc.b $8D
	inc.b $8D
	lda.b [$8D]
	sta.b $A5
	tay
	dec.b $8D
	lda.b [$8D],y
	inc.b $8D
	and.w #$00FF
	bne CODE_9B9A58
	dec.b $A5
CODE_9B9A58:
	jsl.l CODE_9EC894
	rts
