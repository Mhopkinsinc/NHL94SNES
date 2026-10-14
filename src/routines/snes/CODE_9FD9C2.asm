; Unidentified routine.
CODE_9FD9C2:
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
CODE_9FD9CB:
	lda.w newpos,x
	sta.b d0
	sta.w position,x
	jsl.l Setplass
	lda.w #$FFFF
	sta.w newpnum,x
	sta.w newpos,x
	rtl
	lda.w pfalock,x
	bne .t1
	lda.w pflags,x
	bit.w #$0002
	beq .t2
	and.w #$FFFD
	sta.w pflags,x
	stz.w $0EC3,x
	stz.w $0EE3,x
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
	lda.w #$E8F4
	ldy.w position,x
	bne .3
.2:
	lda.w #$E452
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
	stz.w $1563,x
	stz.w SPA,x
	lda.w #$1000
	sta.w $0EC3,x
	jml.l CODE_9E8BE6
