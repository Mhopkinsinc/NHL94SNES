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
	sta.b d0
	sec
	sbc.w #$FFE8
	bmi CODE_9EBD2D
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl CODE_9EBD2C
	adc.w #$0008
	sta.w temp1,x
	cpx.w puckc
	bne .2
.1:
	lda.w #$FFFF
	sta.w puckc
	lda.w #$003C
	sta.w nopuck,x
.2:
	lda.w #SPAglide
	sta.w pfnc,x
	jsl.l SetSPAFromA
	lda.w #$0006
	sta.b d2
	lda.w handed,x
	beq .3
	lda.w #$0002
	sta.b d2
.3:
	lda.w facedir,x
	cmp.b d2
	beq .5
.4:
	inc a
	and.w #$0007
	sta.w facedir,x
.5:
	stz.w Yvel,x
	lda.w #$1000
	sta.w Xvel,x
	lda.b d0
	sec
	sbc.w #$FFF8
	bmi CODE_9EBDF7
	stz.w Xvel,x
	lda.w facedir,x
	cmp.b d2
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
	jsl.l SetSPAFromA
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b d0
	jml.l assreplace
