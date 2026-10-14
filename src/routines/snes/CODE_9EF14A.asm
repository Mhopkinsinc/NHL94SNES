; Unidentified routine.
CODE_9EF14A:
	lda.w #$FF00
	tsb.w $0AD9
	asl.b d2
	lda.b d2
	sta.b a0
	tay
	lda.w #$0014
	sta.w $1203,y
	tya
	lsr a
	sta.w $0CF3
	lda.w #$000C
	trb.w sflags
CODE_9EF168:
	stz.w $0E01
	ldy.b a2
	lda.w #$000A
	sta.w $1203,y
	lda.w #$0004
	sta.w $1063,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	bne CODE_9EF193
	lda.b a2
	jsl.l CODE_9BC002
CODE_9EF193:
	lda.b d1
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EF1A0
	ora.w #$FF00
CODE_9EF1A0:
	sta.b d1
	lda.b d1
	beq CODE_9EF1A8
	inc.b d1
CODE_9EF1A8:
	ldy.b a2
	lda.w $0EE3,y
	eor.b d1
	bmi CODE_9EF1B9
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9EF1B9:
	sep #$20
	lda.b d0
	sta.w $0EC4,x
	lda.b d1
	sta.w $0EE4,x
	rep #$20
	jmp.w puckflip
