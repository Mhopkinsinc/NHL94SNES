; Unidentified routine.
CODE_9EBAE5:
	and.w #$FFFD
	sta.w pflags,x
	ldy.w #$0010
	lda.w pfteam,x
	beq CODE_9EBAF6
	ldy.w #$0001
CODE_9EBAF6:
	sty.b $A5
	lda.w PBnum
	sec
	sbc.b $A5
	sta.w PBnum
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w #$003C
	sta.b $A5
	lda.w pfteam,x
	bne CODE_9EBB16
	lda.w #$FFC4
	sta.b $A5
CODE_9EBB16:
	lda.b $A5
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #$E936
	jsl.l CODE_9EA3F1
	jml.l SprSort
