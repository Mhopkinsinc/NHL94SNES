; Assignment: the center on offense skates to a spot in the zone of the puck
asscentero:
	cpx.w shotPlIdx
	beq CODE_9E845A
	ldy.w shotPlIdx
	bmi CODE_9E8462
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E8462
	lda.w #$0005
	sta.b d0
	jmp.w assreplace
