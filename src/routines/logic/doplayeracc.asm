; The player skates in direction d0 (or glides or stops), turning toward it
doplayeracc:
	lda.w position,x
	bne .t4
	jml.l goalieacc

.t4:
	lda.w SPA,x
	cmp.w #$F208
	beq .t2
	lda.w #$EA1A
	sta.b d1
	lda.w $1523,x
	beq .1
	lda.w #$F0D2
	sta.b d1
.1:
	lda.b d0
	and.w #$000F
	sta.b d0
	cmp.w #$0008
	bcc .t3
	cmp.w #$0009
	bne .t1
	lda.w $0EC3,x
	ora.w $0EE3,x
	beq .t1
	jmp.w dostop

.t1:
	lda.w $1543,x
	bne .t2
	jmp.w SetSPA

.t2:
	rtl

.t3:
	lda.b d1
	pha
	lda.b d0
	pha
	sta.b d2
	cpx.w shotPlIdx
	bne .t2x
	jmp.w CODE_9EA9AD

.t2x:
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,x
	sta.b d3
	lda.w puckvy
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .1x
	ora.w #$FF00
.1x:
	clc
	adc.w pucky
	sec
	sbc.b d3
	sta.b d1
	lda.w pfgoal,x
	bne .2
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
	lda.b d2
	eor.w #$0004
	sta.b d2
.2:
	lda.w $1523,x
	bne .t1x
	lda.b d3
	bpl CODE_9EA9AD
	lda.b d2
	cmp.w #$0004
	bne CODE_9EA9AD
	jsl.l vtoa
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	bra CODE_9EA983

.t1x:
	lda.b d2
	sec
	sbc.w #$0003
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9AD
	jsl.l vtoa
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcs CODE_9EA9AD
CODE_9EA983:
	lda.w $1523,x
	bne CODE_9EA9B0
	lda.w $0EC3,x
	sta.b d0
	ora.w $0EE3,x
	beq .1
	lda.w $0EE3,x
	sta.b d1
	jsl.l vtoa
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs CODE_9EA9B0
.1:
	inc a
	sta.w $1523,x
	bra CODE_9EA9B0
