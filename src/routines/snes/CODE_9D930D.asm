; Unidentified routine.
CODE_9D930D:
	lda.w Hscroll
	lsr a
	lsr a
	lsr a
	sec
	sbc.w #$0010
	bcc CODE_9D936E
	sta.b $24
	pha
	lda.w #$007E
	sta.b $0E
	lda.w #$A670
	sta.b $0C
	stz.w $079C
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.b $24
	sec
	sbc.w #$0020
	and.w #$003F
	tax
	phx
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$C676
	sta.b $0C
	lda.w #$3800
	sta.w $079C
	plx
	pla
	sta.b $24
	stz.b $26
	lda.w #$0001
	sta.b $18
	lda.w #$0020
	sta.b $1A
	ldy.w #$0000
	jsl.l CODE_808BED
CODE_9D936E:
	lda.w Hscroll
	cmp.w #$0058
	beq CODE_9D9394
	cmp.w #$00B0
	beq CODE_9D9394
	cmp.w #$0108
	beq CODE_9D9394
	cmp.w #$0180
	beq CODE_9D9394
	cmp.w #$01F8
	beq CODE_9D9394
	cmp.w #$0250
	beq CODE_9D9394
	cmp.w #$02A8
	bne CODE_9D9396
CODE_9D9394:
	stz.b $B3
CODE_9D9396:
	lda.w Hscroll
	sec
	sbc.w #$0100
	sta.w $07D6
	sta.w $07DE
	sec
	sbc.w #$0080
	sta.w $07DA
	jmp.w CODE_9D9221
