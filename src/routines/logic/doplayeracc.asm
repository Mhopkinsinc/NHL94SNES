; The player skates in direction d0 (or glides or stops), turning toward it
doplayeracc:
	lda.w position,x
	bne .t4
	jml.l goalieacc

.t4:
	lda.w SPA,x
	cmp.w #SPAsweepchk
	beq .t2
	lda.w #SPAglide
	sta.b d1
	lda.w $1523,x
	beq .1
	lda.w #SPAglideback
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
	cpx.w puckc
	bne .t2x
	jmp.w .4

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
	bpl .4
	lda.b d2
	cmp.w #$0004
	bne .4
	jsl.l vtoa
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .4
	bra .3

.t1x:
	lda.b d2
	sec
	sbc.w #$0003
	and.w #$0007
	cmp.w #$0003
	bcs .4
	jsl.l vtoa
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcs .4
.3:
	lda.w $1523,x
	bne .9
	lda.w $0EC3,x
	sta.b d0
	ora.w $0EE3,x
	beq .1xx
	lda.w $0EE3,x
	sta.b d1
	jsl.l vtoa
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .9
.1xx:
	inc a
	sta.w $1523,x
	bra .9
.4:
	stz.w $1523,x
.9:
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w facedir,x
	sta.b d2
	lda.b d0
	sec
	sbc.b d2
	and.w #$0007
	asl a
	sta.b d0
	tax
	lda.l DATA8_9EAAA3,x
	ldx.b a3
	cmp.w #$0000
	bne .t2xx
	jmp.w noturn0

.t2xx:
	tax
	lda.b d7
	jsl.l CODE_808F5D
	ldx.b a3
	sta.b tmp0
	lda.w $0EC3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .1xxx
	ora.w #$FF00
.1xxx:
	tax
	jsl.l CODE_808F7D
	sta.b d4
	ldx.b a3
	lda.w $0EE3,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .2x
	ora.w #$FF00
.2x:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d4
	sta.b d3
	lda.w #$0300
	sec
	sbc.b d3
	sta.b d4
	sec
	sbc.w #$0180
	bpl .3x
	lda.w #$0180
	sta.b d4
.3x:
	lda.b tmp0
	ldx.b d4
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b d4
	ldx.b a3
	lda.w $1523,x
	beq .4x
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	lda.w #$0000
	sbc.b $B7
	sta.b $B7
.4x:
	lda.w $1183,x
	clc
	adc.b d4
	sta.w $1183,x
	lda.w facedir,x
	adc.b $B7
	and.w #$0007
	sta.w facedir,x
	sta.b d2
	lda.b d3
	cmp.w #$0015
	bcc .7
	stz.b d1
	lda.b tmp0
	bpl .5
	lda.w #$FFCE
	sta.b d1
.5:
	lda.w attribute,x
	bit.w #$0800
	beq .6
	lda.b d1
	eor.w #$FFCE
	sta.b d1
.6:
	lda.b d1
	clc
	adc.w #SPAturnr
	sta.b d1
.7:
	lda.w $1543,x
	bne .8
	jsl.l SetSPA
	lda.w #$0001
	sta.w $1543,x
.8:
	lda.b d3
	cmp.w #$0003
	bcc .t1xx
	jmp.w CODE_9EAB64

.t1xx:
	rtl
