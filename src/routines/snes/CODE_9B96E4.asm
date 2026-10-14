; Unidentified routine.
CODE_9B96E4:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF0F4
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9B96FE:
	ply
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	and.w #$00FF
	sta.b d0
	lda.w #$000E
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	ply
	iny
	lda.w #$2400
	sta.w $0D0D
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	inc.w printy
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9B9744
	sta.b d0
	lda.w #$0010
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
CODE_9B9744:
	ply
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	inc.w printy
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9B9767
	sta.b d0
	lda.w #$0010
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
CODE_9B9767:
	rts
