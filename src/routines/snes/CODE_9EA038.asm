; Unidentified routine.
CODE_9EA038:
	lda.w SPA,x
	cmp.w #$F342
	bne CODE_9EA01D
	lda.w $15D6
	beq CODE_9EA04E
	lda.w #$0100
	sta.w $0F23,x
	sta.w $0F23,y
CODE_9EA04E:
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b $A5
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b $A9
	jsl.l vtoa
	lda.b $A5
	sec
	sbc.w $1163,x
	and.w #$0007
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EA154
	sta.b $89
	sta.w $1543,x
	cpy.w #$0000
	bne CODE_9EA0B1
	lda.w Xpos,x
	cmp.w #$0050
	bpl CODE_9EA0A5
	cmp.w #$A057
	bmi CODE_9EA0A5
	lda.w Ypos,x
	cmp.w #$00F8
	bpl CODE_9EA0A5
	cmp.w #$FF08
	bpl CODE_9EA0A5
	lda.w $0792
	and.w #$00F0
	beq CODE_9EA0B1
	bra CODE_9EA0AD
