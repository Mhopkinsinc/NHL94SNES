; Unidentified routine.
CODE_9DBBF1:
	stz.b $A7
	ldx.w $0BE7
	ldy.w $0BE5
	sep #$20
CODE_9DBBFB:
	lda.b [$0C],y
	sta.b d0
	and.b #$0F
	ora.w $0BED
	sta.l $7FA001,x
	lda.b d0
	lsr a
	lsr a
	lsr a
	lsr a
	and.b #$0F
	ora.w $0BED
	sta.l $7FA000,x
	inx
	inx
	iny
	inc.b $A7
	lda.b $A7
	cmp.b #$20
	bcc CODE_9DBBFB
	rep #$20
	rts
