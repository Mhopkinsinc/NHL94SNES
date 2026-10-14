; Unidentified routine.
CODE_9EA69D:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EA6CC
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$005A
	sta.w $1043,x
	lda.w Hpos
	bpl CODE_9EA6BC
	lda.w #$FFA6
	sta.w $1043,x
CODE_9EA6BC:
	lda.w Vpos
	sta.w $1063,x
	lda.w #$F68E
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
CODE_9EA6CC:
	lda.w $1043,x
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w $1063,x
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	bpl CODE_9EA6F9
	lda.b d0
	sta.b d2
	sta.w facedir,x
	lda.w #$0014
	sta.w pfalock,x
	jmp.w CODE_9EA719
