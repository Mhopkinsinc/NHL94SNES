; Unidentified routine.
CODE_9EBD45:
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	cmp.w #$FFF3
	bmi CODE_9EBD2D
	cmp.w #$000D
	bpl CODE_9EBD2D
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b $A5
	sec
	sbc.w #$FFE8
	bmi CODE_9EBD2D
	lda.w $1003,x
	sec
	sbc.b $C1
	sta.w $1003,x
	bpl CODE_9EBD2C
	adc.w #$0008
	sta.w $1003,x
	cpx.w $0AD9
	bne CODE_9EBD87
CODE_9EBD7B:
	lda.w #$FFFF
	sta.w $0AD9
	lda.w #$003C
	sta.w $1203,x
CODE_9EBD87:
	lda.w #$EA1A
	sta.w $1563,x
	jsl.l CODE_9EA3F1
	lda.w #$0006
	sta.b $AD
	lda.w $14A3,x
	beq CODE_9EBDA0
	lda.w #$0002
	sta.b $AD
CODE_9EBDA0:
	lda.w $1163,x
	cmp.b $AD
	beq CODE_9EBDAE
CODE_9EBDA7:
	inc a
	and.w #$0007
	sta.w $1163,x
CODE_9EBDAE:
	stz.w $0EE3,x
	lda.w #$1000
	sta.w $0EC3,x
	lda.b $A5
	sec
	sbc.w #$FFF8
	bmi CODE_9EBDF7
	stz.w $0EC3,x
	lda.w $1163,x
	cmp.b $AD
	bne CODE_9EBDF7
CODE_9EBDC9:
	lda.w $1063,x
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w $1163,x
	sta.w $14E3,x
	lda.w #$E8F4
	jsl.l CODE_9EA3F1
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b $A5
	jml.l CODE_9E8C18
