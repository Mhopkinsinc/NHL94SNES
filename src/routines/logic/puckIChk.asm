; Watch for icing: the loose puck crossing the far goal line
puckIChk:
	lda.w iflags
	bit.w #$0004
	beq CODE_9EF779
	bit.w #$0001
	bne CODE_9EF779
	lda.w shotPlIdx
	bpl CODE_9EF779
	lda.w #$0108
	sta.b d0
	lda.w iflags
	bit.w #$0002
	bne CODE_9EF77A
	lda.w #$FEF8
	sec
	sbc.w pucky
	bpl CODE_9EF783
CODE_9EF779:
	rtl
