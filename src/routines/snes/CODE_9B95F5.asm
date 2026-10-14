; Unidentified routine.
CODE_9B95F5:
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
	bne CODE_9B9640
	inc.w printx
CODE_9B9640:
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
	and.w #$00F0
	sta.b d3
	stz.b a2
	lda.b d3
	beq CODE_9B9668
	lda.w #$0002
	sta.b a2
CODE_9B9668:
	jsl.l CODE_9B9B35
	dec.w printy
	dec.w printy
	lda.w #$001C
	sta.w printx
	pla
	and.w #$000F
	cmp.w #$0000
	beq CODE_9B96E4
	cmp.w #$0001
	beq CODE_9B96C8
	cmp.w #$0002
	beq CODE_9B96FE
	cmp.w #$0003
	beq CODE_9B96AC
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0E7
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B96FE
