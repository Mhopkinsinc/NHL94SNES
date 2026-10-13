; Unidentified routine.
CODE_9EF751:
	lda.w iflags
	bit.w #$0004
	beq CODE_9EF779
	bit.w #$0001
	bne CODE_9EF779
	lda.w $0AD9
	bpl CODE_9EF779
	lda.w #$0108
	sta.b $A5
	lda.w iflags
	bit.w #$0002
	bne CODE_9EF77A
	lda.w #$FEF8
	sec
	sbc.w pucky
	bpl CODE_9EF783
CODE_9EF779:
	rtl
