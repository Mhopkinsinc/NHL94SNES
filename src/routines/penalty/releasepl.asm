; Unidentified routine.
releasepl:
	stx.b $87
	ldx.w #$0000
CODE_9EC076:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EC076
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9EC087:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EC087
	ldx.b $87
	ldy.b $91
	ldx.w tmsort,y
	dex
	dex
CODE_9EC09A:
	inx
	inx
	lda.w position,x
	bpl CODE_9EC09A
	lda.b $A5
	lsr a
	sta.b $B1
	ldy.b $91
	lda.w tmap,y
	sta.b $A9
	inc a
	sta.w tmap,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w $17E0
	lda.w #$0080
	sta.b $8B
	lda.w #$D6B0
	sta.b $89
	lda.w tmgoalie,y
	bpl CODE_9EC0CB
	inc.b $89
CODE_9EC0CB:
	ldy.b $A9
	lda.b [$89],y
	and.w #$00FF
	sta.w position,x
	stx.b $95
	jsl.l Setplass
	jsl.l setplayer
	lda.w pflags,x
	ora.w #$1000
	sta.w pflags,x
	stx.b $87
	ldx.w #$000E
CODE_9EC0ED:
	pla
	sta.b $89,x
	dex
	dex
	bpl CODE_9EC0ED
	ldx.b $87
	stx.b $87
	ldx.w #$000E
CODE_9EC0FB:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9EC0FB
	ldx.b $87
	ldx.b $95
	rtl
