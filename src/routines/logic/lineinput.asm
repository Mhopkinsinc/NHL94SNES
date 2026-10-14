; Pad input while the line change box is open
lineinput:
	lda.b d1
	pha
	stz.b a2
	lda.w pfteam,x
	beq CODE_9FD741
	inc.b a2
	inc.b a2
CODE_9FD741:
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0001
	beq CODE_9FD75F
	and.w #$FFFE
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FDE13
	jsl.l SetLCmode2
CODE_9FD75F:
	pla
	sta.b d1
	stz.b d2
	bit.w #$4000
	bne CODE_9FD7AF
	inc.b d2
	bit.w #$8000
	bne CODE_9FD7AF
	inc.b d2
	bit.w #$0080
	bne CODE_9FD7AF
	bit.w #$2000
	bne CODE_9FD78E
	lda.w pflags,x
	bit.w #$0008
	beq CODE_9FD78D
	lda.w pfalock,x
	bne CODE_9FD78D
	jml.l CODE_9EA8A9
