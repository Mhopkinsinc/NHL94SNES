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
	sta.b $B1
	plx
CODE_9FAA59:
	lda.w #$0016
	sta.b $A5
	lda.b $A9
	cmp.w #$0004
	bne CODE_9FAA86
	stz.b $91
	lda.w pfteam,x
	beq CODE_9FAA70
	inc.b $91
	inc.b $91
CODE_9FAA70:
	ldy.b $91
	lda.w pnum,x
	and.w #$00FF
	sta.w tmtouch1,y
	lda.w #$0004
	sta.w tmflags,y
	lda.w #$0017
	sta.b $A5
CODE_9FAA86:
	jsl.l assinsert
CODE_9FAA8A:
	lda.w tmap
	sta.b $B5
	ldx.b $95
	lda.w pfteam,x
	beq CODE_9FAA9B
	lda.w $17A8
	sta.b $B5
CODE_9FAA9B:
	lda.b $B5
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0006
	asl a
	asl a
	asl a
	sta.b $B5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEE2
	clc
	adc.b $B5
	sta.b $8D
	lda.w $1E9B
	beq CODE_9FAAC6
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAEFA
	sta.b $8D
CODE_9FAAC6:
	ldy.b $A9
	lda.b [$8D],y
	and.w #$00FF
	asl a
	asl a
	sta.b $B5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FAF02
	sta.b $8D
	ldy.b $B5
	lda.b [$8D],y
	sta.b $A5
	iny
	iny
	lda.b [$8D],y
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9FAAFC
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9FAAFC:
	lda.w position,x
	beq CODE_9FAB51
	lda.b $B5
	cmp.w #$0009
	bpl CODE_9FAB3F
	lda.l $7E3136
	eor.b $A5
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
	adc.b $A9
	sta.b $A9
CODE_9FAB28:
	lda.l $7E3136
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9FAB36
	ora.w #$C000
CODE_9FAB36:
	sta.b $B1
	lda.b $A5
	sec
	sbc.b $B1
	sta.b $A5
CODE_9FAB3F:
	lda.b $A5
	clc
	adc.l $7E3136
	sta.b $A5
	lda.b $A9
	clc
	adc.l $7E3138
	sta.b $A9
CODE_9FAB51:
	lda.b $A5
	sta.w Xpos,x
	sec
	sbc.w puckx
	eor.w #$FFFF
	inc a
	sta.b $A5
	lda.b $A9
	sta.w Ypos,x
	sec
	sbc.w pucky
	eor.w #$FFFF
	inc a
	sta.b $A9
	stz.w Xvel,x
	stz.w Yvel,x
	jsl.l vtoa
	lda.b $A5
	sta.w facedir,x
	lda.w pflags,x
	and.w #$EFFF
	sta.w pflags,x
	stz.w pfalock,x
	stz.w SPA,x
	lda.w position,x
	bne CODE_9FAB97
	lda.w #SPAgready
	bra CODE_9FAB9A
