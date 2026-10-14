; d0 = the line for line choice d0 of team a2, by the man advantage. -1 = none.
getlchoice:
	lda.b d1
	pha
	lda.b d1+2
	pha
	lda.b d2
	pha
	lda.b d2+2
	pha
	lda.b a2
	eor.w #$0002
	tay
	lda.w tmap,y
	ldy.b a2
	sec
	sbc.w tmap,y
	sta.b d2
	beq .1
	lda.b d0
	clc
	adc.w #$0015
	sta.b d0
	lda.b d2
	bmi .1
	lda.b d0
	clc
	adc.w #$0015
	sta.b d0
.1:
	ldy.b a2
	lda.w tmline,y
	sta.b d1
	lda.b d0
	clc
	adc.b d1
	clc
	adc.b d1
	clc
	adc.b d1
	sta.b d0
	tay
	lda.w #$009F
	sta.b a0+2
	lda.w #.tab
	sta.b a0
	lda.b [a0],y
	and.w #$00FF
	bit.w #$0080
	beq .sext
	ora.w #$FF00
.sext:
	sta.b d0
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	rtl
.tab:
	db $00,$01,$02,$01,$02,$00,$02,$00,$01,$00,$01,$02,$00,$01,$02,$00
	db $01,$02,$00,$01,$02,$03,$04,$FF,$03,$04,$FF,$03,$04,$FF,$03,$04
	db $FF,$04,$03,$FF,$03,$04,$FF,$03,$04,$FF,$05,$06,$FF,$05,$06,$FF
	db $05,$06,$FF,$05,$06,$FF,$05,$06,$FF,$05,$06,$FF,$06,$05,$FF

; Follows the line-choice table. Compares one object word with 100, then continues.
.t1:
	lda.w $1003,x
	cmp.w #$0064
	bne .t2
	jmp.w CODE_9FD96E

.t2:
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$4000
	beq .t1x
.1x:
	jml.l CODE_9E8BE6

.t1x:
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	lda.w #$0050
	sta.b d0
	lda.w pfteam,x
	bne .1xx
	lda.w #$FFB0
	sta.b d0
.1xx:
	lda.b d0
	sta.w $1063,x
	lda.w #$FF70
	sta.w $1043,x
	stz.w $1003,x
.2:
	lda.w newpnum,x
	cmp.w pnum,x
	bne .t3
.3:
	jmp.w CODE_9FD9C2

.t3:
	lda.w position,x
	bne .1x2
	lda.w $0B05,x
	ora.w #$0003
	sta.w $0B05,x
.1x2:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bmi .t1x2
	jmp.w CODE_9FD99D

.t1x2:
	lda.w $1003,x
	adc.w #$0008
	sta.w $1003,x
	lda.w Ypos,x
	sec
	sbc.w $1063,x
	bit.w #$8000
	beq .2x
.1xx2:
	eor.w #$FFFF
	inc a
.2x:
	cmp.w #$0029
	bcc .t2x
	jmp.w CODE_9FD99D

.t2x:
	lda.w Xpos,x
	sec
	sbc.w $1043,x
	sta.b d0
	sec
	sbc.w #$0020
	beq .t1xx
	bmi .t1xx
	jmp.w CODE_9FD99D

.t1xx:
	lda.w #$EA1A
	ldy.w position,x
	bne .1x2x
	lda.w #$E0FE
.1x2x:
	jsl.l CODE_9EA3F1
	lda.w #$0001
	sta.w $1563,x
	lda.w facedir,x
	cmp.w #$0004
	beq .2xx
	inc a
	and.w #$0007
	sta.w facedir,x
.2xx:
	stz.w $0EE3,x
	lda.w #$F800
	sta.w $0EC3,x
	lda.b d0
	sec
	sbc.w #$0010
	beq .3x
	bpl CODE_9FD96D
.3x:
	stz.w $0EC3,x
	lda.w facedir,x
	cmp.w #$0004
	bne CODE_9FD96D
	lda.w #$F800
	sta.w $0EC3,x
	lda.w #$0002
	sta.w facedir,x
	lda.w #$E936
	ldy.w position,x
	bne .4
	lda.w #$E484
.4:
	jsl.l CODE_9EA3F1
	lda.w #$0064
	sta.w $1003,x
	sta.w pfalock,x
CODE_9FD96D:
	rtl
