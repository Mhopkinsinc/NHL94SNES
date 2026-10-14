; Unidentified routine.
CODE_9EC4FD:
	lda.w Xpos,y
	sta.l $7E30F8
	lda.w Ypos,y
	sta.l $7E30FA
	tya
	lsr a
	sta.l $7E30F6
	stz.b a0
	lda.w pfteam,y
	beq CODE_9EC51C
	inc.b a0
	inc.b a0
CODE_9EC51C:
	lda.w pnum,y
	sta.b d0
	ldy.b a0
	cmp.w tmtouch1,y
	beq CODE_9EC565
	lda.w tmflags,y
	bit.w #$0004
	beq CODE_9EC549
	and.w #$FFFB
	sta.w tmflags,y
	cpy.w #$0000
	bne CODE_9EC555
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EC547
	sta.w $19BE
CODE_9EC547:
	bra CODE_9EC555
