; "<team> Wins!" once the shootout is decided
ShootoutWonBy:		; "<team> Wins!" once the shootout is decided
	lda.w $1D81
	bne .t1
	jmp.w .3

.t1:
	lda.w #$000A
	sta.b d0
	lda.w $1D89
	bne .t3
	jmp.w .3

.t3:
	lda.w $178E
	sec
	sbc.w $1790
	bne .t1x
	jmp.w .3

.t1x:
	phx
	phy
	lda.b d1
	pha
	lda.b a1
	pha
	lda.w $178E
	sec
	sbc.w $1790
	bmi .t2
	ldy.w #$0000
	bra .1

.t2:
	ldy.w #$0002
.1:
	phy
	lda.w HomeTeam,y
	jsl.l GetTeamLongName
	lda.b [a1]
	and.w #$00FF
	dec a
	dec a
	asl a
	tax
	txa
	clc
	adc.w #$0002
	sta.b d0
	lda.w #$0020
	sec
	sbc.b d0
	lsr a
	sta.w printx
	sta.b $00
	lda.w #$000D
	sta.w printy
	lda.w #$0006
	sta.b d1
	jsl.l Framer
	lda.b $00
	inc a
	sta.w printx
	lda.w #$000E
	sta.w printy
	jsl.l printbig
	lda.w #$000C
	sta.w printx
	lda.w #$0010
	sta.w printy
	ply
	lda.w HomeTeam,y
	cmp.w #$000E
	beq .t1xx
	cmp.w #$000D
	beq .t1xx
	lda.w #$009C
	sta.b $8F
	lda.w #WinsMark
	sta.b a1
	jsl.l printbig
	bra .2

.t1xx:
	lda.w #$009C
	sta.b $8F
	lda.w #WinMark
	sta.b a1
	jsl.l printbig
.2:
	pla
	sta.b a1
	pla
	sta.b d1
	ply
	plx
	lda.w #$0010
	sta.b d0
.3:
	jsl.l AddPenalty2
	rtl
