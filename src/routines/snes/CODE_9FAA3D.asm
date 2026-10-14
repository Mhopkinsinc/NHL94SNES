; Unidentified routine.
CODE_9FAA3D:
	beq CODE_9FAA8A
	lda.w $1E9B
	beq CODE_9FAA59
	phx
	ldx.w #$0008
	lda.w $1E91
	beq CODE_9FAA50
	ldx.w #$0014
CODE_9FAA50:
	lda.w $1E8F
	sta.w pnum,x
	sta.b d3
	plx
CODE_9FAA59:
	lda.w #$0016
	sta.b d0
	lda.b d1
	cmp.w #$0004
	bne CODE_9FAA86
	stz.b a2
	lda.w pfteam,x
	beq CODE_9FAA70
	inc.b a2
	inc.b a2
CODE_9FAA70:
	ldy.b a2
	lda.w pnum,x
	and.w #$00FF
	sta.w tmtouch1,y
	lda.w #$0004
	sta.w tmflags,y
	lda.w #$0017
	sta.b d0
CODE_9FAA86:
	jsl.l assinsert
CODE_9FAA8A:
	lda.w tmap
	sta.b d4
	ldx.b a3
	lda.w pfteam,x
	beq CODE_9FAA9B
	lda.w $17A8
	sta.b d4
CODE_9FAA9B:
	lda.b d4
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0006
	asl a
	asl a
	asl a
	sta.b d4
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEE2
	clc
	adc.b d4
	sta.b a1
	lda.w $1E9B
	beq CODE_9FAAC6
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEFA
	sta.b a1
CODE_9FAAC6:
	ldy.b d1
	lda.b [a1],y
	and.w #$00FF
	asl a
	asl a
	sta.b d4
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAF02
	sta.b a1
	ldy.b d4
	lda.b [a1],y
	sta.b d0
	iny
	iny
	lda.b [a1],y
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9FAAFC
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9FAAFC:
	lda.w position,x
	beq CODE_9FAB51
	lda.b d4
	cmp.w #$0009
	bpl CODE_9FAB3F
	lda.l $7E3136
	eor.b d0
	bpl CODE_9FAB28
	lda.l $7E3138
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9FAB1F
	ora.w #$E000
CODE_9FAB1F:
	eor.w #$FFFF
	inc a
	clc
	adc.b d1
	sta.b d1
CODE_9FAB28:
	lda.l $7E3136
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9FAB36
	ora.w #$C000
CODE_9FAB36:
	sta.b d3
	lda.b d0
	sec
	sbc.b d3
	sta.b d0
CODE_9FAB3F:
	lda.b d0
	clc
	adc.l $7E3136
	sta.b d0
	lda.b d1
	clc
	adc.l $7E3138
	sta.b d1
CODE_9FAB51:
	lda.b d0
	sta.w Xpos,x
	sec
	sbc.w $0D71
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	sta.w Ypos,x
	sec
	sbc.w pucky
	eor.w #$FFFF
	inc a
	sta.b d1
	stz.w $0EC3,x
	stz.w $0EE3,x
	jsl.l vtoa
	lda.b d0
	sta.w facedir,x
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w pfalock,x
	stz.w SPA,x
	lda.w position,x
	bne CODE_9FAB97
	lda.w #$E0FE
	bra CODE_9FAB9A
