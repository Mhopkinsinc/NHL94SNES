; Unidentified routine.
CODE_9EF14A:
	lda.w #$FF00
	tsb.w $0AD9
	asl.b $AD
	lda.b $AD
	sta.b $89
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
	ldy.b $91
	lda.w #$000A
	sta.w $1203,y
	lda.w #$0004
	sta.w $1063,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	bne CODE_9EF193
	lda.b $91
	jsl.l CODE_9BC002
CODE_9EF193:
	lda.b $A9
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EF1A0
	ora.w #$FF00
CODE_9EF1A0:
	sta.b $A9
	lda.b $A9
	beq CODE_9EF1A8
	inc.b $A9
CODE_9EF1A8:
	ldy.b $91
	lda.w $0EE3,y
	eor.b $A9
	bmi CODE_9EF1B9
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EF1B9:
	sep #$20
	lda.b $A5
	sta.w $0EC4,x
	lda.b $A9
	sta.w $0EE4,x
	rep #$20
	jmp.w CODE_9EDE5E
