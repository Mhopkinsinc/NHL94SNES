; Unidentified routine.
CODE_9EE74E:
	ldy.b $91
	lda.w $19D0,y
	bne CODE_9EE779
	lda.w pfgoal,x
	bne CODE_9EE771
	lda.w Ypos,x
	cmp.w #$FFA8
	bpl CODE_9EE779
CODE_9EE762:
	jsl.l RandomWord
	and.w #$0080
	bne CODE_9EE779
	inc.w $0BAB
	jmp.w $E797
