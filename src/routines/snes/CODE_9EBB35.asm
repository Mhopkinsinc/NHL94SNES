; Unidentified routine.
CODE_9EBB35:
	lda.w #$0004
	sta.w facedir,x
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	lda.w pflags,x
	and.w #$6FF7
	sta.w pflags,x
	stz.w $1563,x
	lda.w #$F000
	sta.w $0EC3,x
	ldx.b a2
	lda.w $19D0,x
	cmp.w #$0004
	bcc CODE_9EBB8C
	ldy.w $0AF9,x
CODE_9EBB63:
	iny
	iny
	cpy.w #$000A
	bne CODE_9EBB6D
	ldy.w #$0000
CODE_9EBB6D:
	lda.w $19F6,y
	bpl CODE_9EBB63
	and.w #$00FF
	cmp.b a2
	bne CODE_9EBB63
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
	ldx.b $E4
	tya
	sta.w $19D4,x
	txa
	sta.w $19EC,y
CODE_9EBB8C:
	ldx.b $E4
	jml.l CODE_9E8BE6
