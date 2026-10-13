; Unidentified routine.
CODE_9EBD45:
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	cmp.w #$FFF3
	bmi CODE_9EBD2D
	cmp.w #$000D
	bpl CODE_9EBD2D
	lda.w Xpos,x
	sec
	sbc.w temp3,x
	sta.b $A5
	sec
	sbc.w #$FFE8
	bmi CODE_9EBD2D
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9EBD2C
	adc.w #$0008
	sta.w temp1,x
	cpx.w puckc
	bne CODE_9EBD87
CODE_9EBD7B:
	lda.w #$FFFF
	sta.w puckc
	lda.w #$003C
	sta.w nopuck,x
CODE_9EBD87:
	lda.w #SPAglide
	sta.w pfnc,x
	jsl.l CODE_9EA3F1
	lda.w #$0006
	sta.b $AD
	lda.w handed,x
	beq CODE_9EBDA0
	lda.w #$0002
	sta.b $AD
CODE_9EBDA0:
	lda.w facedir,x
	cmp.b $AD
	beq CODE_9EBDAE
CODE_9EBDA7:
	inc a
	and.w #$0007
	sta.w facedir,x
CODE_9EBDAE:
	stz.w Yvel,x
	lda.w #$1000
	sta.w Xvel,x
	lda.b $A5
	sec
	sbc.w #$FFF8
	bmi CODE_9EBDF7
	stz.w Xvel,x
	lda.w facedir,x
	cmp.b $AD
	bne CODE_9EBDF7
CODE_9EBDC9:
	lda.w temp4,x
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	jsl.l CODE_9EA3F1
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b $A5
	jml.l assreplace
