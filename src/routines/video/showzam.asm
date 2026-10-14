; Draw the zamboni moving across the horizontal rink
showzam:
	lda.b $83
	ldy.b $85
	sbc.w $0D51
	sta.b tmp0
	tya
	sbc.w $0D53
	bne .rtl
	lda.w sfhormode
	beq .rtl
	lda.w $1A10
	beq .rtl
	stz.w $0CC5
	stz.w $0CD3
	lda.w #$2000
	sta.w $0CC9
	lda.b tmp0
	lsr a
	lsr a
	sta.w $0CCF
	lda.w #$00C8
	sta.w $0CD1
	lda.w #$01C0
	sta.w $0CCD
	jsl.l addframe
.rtl:
	rtl
