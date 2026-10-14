; Unidentified routine.
asseben:
	lda.w pfalock,x
	bne .t1
	lda.w pflags,x
	bit.w #$0002
	beq .t2
	and.w #$FFFD
	sta.w pflags,x
	stz.w Xvel,x
	stz.w Yvel,x
	stz.w $0B05,x
	txa
	lsr a
	sec
	sbc.w #$0006
	bmi .1
	inc a
.1:
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
	bne .3
.2:
	lda.w #DATA8_9DE452
.3:
	jml.l CODE_9EA403

.t1:
	rtl

.t2:
	lda.w #$0004
	sta.w facedir,x
	lda.w pflags,x
	and.w #$6FFF
	sta.w pflags,x
	stz.w pfnc,x
	stz.w SPA,x
	lda.w #$1000
	sta.w Xvel,x
	jml.l CODE_9E8BE6
