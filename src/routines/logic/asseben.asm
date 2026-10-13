; Unidentified routine.
asseben:
	lda.w pfalock,x
	bne CODE_9FDA33
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9FDA34
	and.w #$FFFD
	sta.w pflags,x
	stz.w Xvel,x
	stz.w Yvel,x
	stz.w $0B05,x
	txa
	lsr a
	sec
	sbc.w #$0006
	bmi CODE_9FDA06
	inc a
CODE_9FDA06:
	phx
	tax
	lda.w #$000E
	jsl.l CODE_808FC9
	plx
	lda.b $08
	sta.w Ypos,x
	lda.w #$FF78
	sta.w Xpos,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallright
	ldy.w position,x
	bne CODE_9FDA2F
CODE_9FDA2C:
	lda.w #DATA8_9DE452
CODE_9FDA2F:
	jml.l CODE_9EA403
