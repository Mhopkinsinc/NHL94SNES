; Unidentified routine.
CODE_9EA1BD:
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d0
	cmp.w #$FFDE
	bmi CODE_9EA1B4
	cmp.w #$0022
	bpl CODE_9EA1B4
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d1
	cmp.w #$FFDE
	bmi CODE_9EA1B4
	cmp.w #$0022
	bpl CODE_9EA1B4
	jsl.l vtoa
	lda.b d0
	cmp.w facedir,x
	bne CODE_9EA1B4
	lda.w Xpos,x
	cmp.w #$004A
	bpl CODE_9EA233
	cmp.w #$FFB6
	bmi CODE_9EA233
	lda.w pfgoal,x
	bne CODE_9EA226
	lda.w Ypos,x
	cmp.w #$0058
	bmi CODE_9EA233
	cmp.w #$0108
	bpl CODE_9EA233
CODE_9EA20D:
	lda.w SPA,y
	cmp.w #DATA8_9DF3A6
	bcc .1
	cmp.w #DATA8_9DF46A+1
	bcc CODE_9EA23E
.1:
	lda.w $0793
	and.w #$0007
	beq CODE_9EA23E
CODE_9EA222:
	jml.l CODE_9EA2CB
