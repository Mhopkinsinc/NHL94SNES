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
	bpl .5
	cmp.w #$FFB6
	bmi .5
	lda.w pfgoal,x
	bne .4
	lda.w Ypos,x
	cmp.w #$0058
	bmi .5
	cmp.w #$0108
	bpl .5
.2:
	lda.w SPA,y
	cmp.w #DATA8_9DF3A6
	bcc .1
	cmp.w #$F46B
	bcc CODE_9EA23E
.1:
	lda.w $0793
	and.w #$0007
	beq CODE_9EA23E
.3:
	jml.l CODE_9EA2CB
.4:
	lda.w Ypos,x
	cmp.w #$FFA8
	bpl .5
	cmp.w #$FEF8
	bpl .2
.5:
	lda.w $0793
	and.w #$0007
	bne CODE_9EA23E
	jmp.w .3
