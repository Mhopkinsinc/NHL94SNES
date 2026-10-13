; Unidentified routine.
assstanley:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EA6CC
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$005A
	sta.w temp3,x
	lda.w Hpos
	bpl CODE_9EA6BC
	lda.w #$FFA6
	sta.w temp3,x
CODE_9EA6BC:
	lda.w Vpos
	sta.w temp4,x
	lda.w #SPAstanley
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
CODE_9EA6CC:
	lda.w temp3,x
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w temp4,x
	sec
	sbc.w Ypos,x
	sta.b $A9
	jsl.l vtoa
	lda.b $A5
	cmp.w #$0008
	bpl CODE_9EA6F9
	lda.b $A5
	sta.b $AD
	sta.w facedir,x
	lda.w #$0014
	sta.w pfalock,x
	jmp.w $A719
