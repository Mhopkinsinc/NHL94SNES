; Unidentified routine.
setpersonel:
	stx.b $87
	ldx.w #$0000
CODE_9FD40C:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0018
	bne CODE_9FD40C
	ldx.b $87
	stx.b $87
	ldx.w #$0000
CODE_9FD41D:
	lda.b $89,x
	pha
	inx
	inx
	cpx.w #$0014
	bne CODE_9FD41D
	ldx.b $87
	ldy.b $91
	ldx.w tmsort,y
	stx.b $95
	lda.w #$0005
	sta.b $B5
CODE_9FD435:
	lda.w #$FFFF
	sta.w newpos,x
	sta.w newpnum,x
	inx
	inx
	stx.b $95
	dec.b $B5
	bpl CODE_9FD435
	jsl.l SetPlList
	lda.w #$0005
	sta.b $B5
	lda.w #$007E
	sta.b $9B
	lda.w #$3114
	sta.b $99
CODE_9FD459:
	ldy.b $B5
	lda.b [$99],y
	and.w #$00FF
	sta.b $B9
	beq CODE_9FD4BE
	dec.b $B9
	lda.w #$0005
	sta.b $B1
	ldy.b $91
	ldx.w tmsort,y
	dex
	dex
CODE_9FD472:
	inx
	inx
	stx.b $95
	lda.w pnum,x
	and.w #$00FF
	sta.b $C5
	lda.b $B9
	and.w #$00FF
	cmp.b $C5
	beq CODE_9FD48D
	dec.b $B1
	bpl CODE_9FD472
	bra CODE_9FD4BE
