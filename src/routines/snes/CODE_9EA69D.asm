; Unidentified routine.
CODE_9EA69D:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EA6CC
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$005A
	sta.w $1043,x
	lda.w $0CEB
	bpl CODE_9EA6BC
	lda.w #$FFA6
	sta.w $1043,x
CODE_9EA6BC:
	lda.w $0D37
	sta.w $1063,x
	lda.w #$F68E
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
CODE_9EA6CC:
	lda.w $1043,x
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w $1063,x
	sec
	sbc.w Ypos,x
	sta.b $A9
	jsl.l vtoa
	lda.b $A5
	cmp.w #$0008
	bpl CODE_9EA6F9
	lda.b $A5
	sta.b $AD
	sta.w $1163,x
	lda.w #$0014
	sta.w $14E3,x
	jmp.w CODE_9EA719
