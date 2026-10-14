; Unidentified routine.
CODE_9C9BAB:
	phx
	phy
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0018
	bne .loop
	ldx.b xsave
	stx.b xsave
	ldx.w #$0000
.loop2:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0014
	bne .loop2
	ldx.b xsave
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF370
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0013
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF375
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0015
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #StarsOfTheGame
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l .t1
	lda.w #$0005
	sta.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2B
	cmp.w #$001A
	bmi .1
	sec
	sbc.w #$001A
	sta.w $1E2B
	inc.b d3
	lda.w #$0002
	sta.b a2
.1:
	jsl.l CODE_9FBD66
	lda.w #$0005
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2B
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2D
	cmp.w #$001A
	bmi .2
	sec
	sbc.w #$001A
	sta.w $1E2D
	inc.b d3
	lda.w #$0002
	sta.b a2
.2:
	jsl.l CODE_9FBD66
	lda.w #$0006
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2D
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	inc.w printy
	lda.w #$000D
	sta.w printx
	stz.b d3
	stz.b a2
	lda.w $1E2F
	cmp.w #$001A
	bmi .3
	sec
	sbc.w #$001A
	sta.w $1E2F
	inc.b d3
	lda.w #$0002
	sta.b a2
.3:
	jsl.l CODE_9FBD66
	lda.w #$0007
	sta.w printy
	lda.w #$0011
	sta.w printx
	lda.w $1E2F
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	stx.b xsave
	ldx.w #$0012
.loop3:
	pla
	sta.b a0,x
	dex
	dex
	bpl .loop3
	ldx.b xsave
	stx.b xsave
	ldx.w #$0016
.loop4:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop4
	ldx.b xsave
	ply
	plx
	rtl

.t1:
	lda.w #$0000
	sta.w $1E33
	lda.w #$0000
	sta.w $1E31
	lda.w #$0000
	sta.w $1E37
	lda.w #$0000
	sta.w $1E35
	lda.w #$0000
	sta.w $1E3B
	lda.w #$0000
	sta.w $1E39
	lda.w #$FFFF
	sta.w $1E1F
	lda.w #$007E
	sta.b $8F
	lda.w #$3136
	sta.b a1
	ldy.w #$0000
	lda.b [a1],y
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0003
	bne .1x
	iny
	iny
	iny
	lda.b [a1],y
	and.w #$00FF
	sta.w $1E1F
	dey
	lda.b [a1],y
	and.w #$00F0
	beq .1x
	lda.w $1E1F
	clc
	adc.w #$001A
	sta.w $1E1F
.1x:
	stz.b a2
	jsl.l GetPlayerCount
	lda.b d0
	sta.w $1E21
	jsl.l GoalieCount
	lda.b d0
	sta.w $1E23
	ldx.w #$0000
CODE_9C9DA1:
	phx
	cpx.w $1E21
	bmi .t1
	jmp.w CODE_9C9E8E

.t1:
	jsl.l CODE_9C9EC5
	lda.b $A7
	sec
	sbc.w $1E33
	bmi .t2
	bvc CODE_9C9DBC
	bra CODE_9C9DD6

.t2:
	bvc CODE_9C9DD6
CODE_9C9DBC:
	beq CODE_9C9DC6
	bmi .t1
	bvs CODE_9C9DC6
	bra CODE_9C9E29

.t1:
	bvs CODE_9C9E29
CODE_9C9DC6:
	lda.b d0
	sec
	sbc.w $1E31
	beq CODE_9C9DD6
	bmi .t1
	bvs CODE_9C9DD6
	bra CODE_9C9E29

.t1:
	bvs CODE_9C9E29
CODE_9C9DD6:
	lda.b $A7
	sec
	sbc.w $1E37
	bmi .t1
	bvc CODE_9C9DE4
	bra CODE_9C9DFE

.t1:
	bvc CODE_9C9DFE
CODE_9C9DE4:
	beq CODE_9C9DEE
	bmi .t1
	bvs CODE_9C9DEE
	bra CODE_9C9E55

.t1:
	bvs CODE_9C9E55
CODE_9C9DEE:
	lda.b d0
	sec
	sbc.w $1E35
	beq CODE_9C9DFE
	bmi .t1
	bvs CODE_9C9DFE
	bra CODE_9C9E55

.t1:
	bvs CODE_9C9E55
CODE_9C9DFE:
	lda.b $A7
	sec
	sbc.w $1E3B
	bmi CODE_9C9E0B
	bvc CODE_9C9E0D
CODE_9C9E08:
	jmp.w CODE_9C9E8E
