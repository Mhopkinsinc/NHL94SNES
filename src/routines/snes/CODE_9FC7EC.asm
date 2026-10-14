; Unidentified routine.
CODE_9FC7EC:
	stz.w $1EAF
	lda.b $A5
	sec
	sbc.w #$0010
	bmi CODE_9FC80A
	jsr.w CODE_9FC822
	lda.b $B3
	bit.w $1EB3
	beq CODE_9FC804
	inc.w $1EAF
CODE_9FC804:
	ora.w $1EB3
	sta.b $B3
	rts
