; Unidentified routine.
CODE_9FD733:
	lda.b $A9
	pha
	stz.b $91
	lda.w pfteam,x
	beq CODE_9FD741
	inc.b $91
	inc.b $91
CODE_9FD741:
	ldy.b $91
	lda.w tmflags,y
	bit.w #$0001
	beq CODE_9FD75F
	and.w #$FFFE
	sta.w tmflags,y
	lda.w #$FFFF
	sta.w $1D55,y
	jsl.l CODE_9FDE13
	jsl.l CODE_9FD325
CODE_9FD75F:
	pla
	sta.b $A9
	stz.b $AD
	bit.w #$4000
	bne CODE_9FD7AF
	inc.b $AD
	bit.w #$8000
	bne CODE_9FD7AF
	inc.b $AD
	bit.w #$0080
	bne CODE_9FD7AF
	bit.w #$2000
	bne CODE_9FD78E
	lda.w pflags,x
	bit.w #$0008
	beq CODE_9FD78D
	lda.w $14E3,x
	bne CODE_9FD78D
	jml.l CODE_9EA8A9
