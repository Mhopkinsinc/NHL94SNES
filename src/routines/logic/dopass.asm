; Pass the puck in the pass direction, to the best teammate there if any
dopass:
	stz.w $0BAB
	lda.w #$0004
	trb.w sflags
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0010
	sta.w $1203,x
	txa
	lsr a
	sta.w $0CF3
	lda.w #$0007
	sta.b d0
	lda.w position,x
	beq .1
	lda.w $13A3,x
	sta.b d0
.1:
	lda.b d0
	asl a
	asl a
	adc.w #$0090
	sta.w passspeed
	lda.w #$FFFF
	sta.b d4
	lda.w #$0005
	sta.b d3
	stz.b a1
	cpx.w #$000C
	bcc .2
	lda.w #$000C
	sta.b a1
.2:
	cpx.b a1
	beq .5
	ldy.b a1
	lda.w position,y
	bmi .5
	beq .5
	lda.w pflags,y
	bit.w #$1000
	bne .5
	lda.w $0B5D,y
	sec
	sbc.w passdir
	sec
	sbc.w #$0004
	stz.b $00
	and.w #$0007
	beq .4
	cmp.w #$0001
	beq .3
	cmp.w #$0007
	bne .5
.3:
	lda.w #$1000
	sta.b $00
.4:
	lda.b $00
	clc
	adc.w $0B3D,y
	bcs .5
	cmp.b d4
	bcs .5
	sta.b d4
	lda.b a1
	sta.b a0
.5:
	inc.b a1
	inc.b a1
	dec.b d3
	bmi .t1
	jmp.w .2

.t1:
	ldx.b a3
	lda.b d4
	bmi .t2
	jsl.l CODE_9EEB2E
	lda.w #$0000
	jsl.l PuckSfx
	jmp.w CODE_9EEACC

.t2:
	lda.w passdir
	asl a
	asl a
	adc.w #$DA08
	sta.b a0
	lda.w #$0080
	sta.b $8B
	lda.b [a0]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l Mul8XS
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w puckvy
	dec.b a0
	dec.b a0
	lda.b [a0]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l Mul8XS
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w puckvx
	jsl.l RandomWord
	and.w #$0FFF
	sta.w $0E01
CODE_9EEACC:
	lda.w position,x
	bne .2
	lda.w pfgoal,x
	beq .t1
	lda.w puckvy
	bmi .1
	bra .2

.t1:
	lda.w puckvy
	bmi .2
.1:
	eor.w #$FFFF
	inc a
	sta.w puckvy
.2:
	lda.w puckvx
	sta.b d0
	lda.w puckvy
	sta.b d1
	jsl.l vtoa
	ldy.w #SPAgswing
	lda.w position,x
	beq .1x
	ldy.w #SPApassf
	jsl.l Findhittype
	beq .1x
	ldy.w #SPApassb
.1x:
	sty.b d1
	jsl.l SetSPA
	lda.w #$0001
	sta.w pfalock,x
	lda.w position,x
	bne .rtl
	lda.w $19D4,x
	bmi .rtl
	stz.w $0EC3,x
	stz.w $0EE3,x
	sta.b d4
	jsl.l findpc
.rtl:
	rtl
CODE_9EEB2E:
	jsl.l loadTeamStruct
	lda.w gmclock
	bne .1
	ldy.b a2
	lda.w $17BE,y
	inc a
	sta.w $17BE,y
.1:
	ldx.w $0B9D,y
	lda.w $1343,x
	lsr a
	clc
	adc.w #$0001
	adc.w $1003,x
	sta.w $1003,x
	lda.b a0
	sta.w $0D07
	ldx.b a0
	lda.w #$0015
	sta.b d0
	jsl.l assinsert
	ldx.b a3
	ldy.b a0
	lda.w $0D97,y
	pha
	lda.w attribute,y
	bit.w #$0800
	beq .t1
	lda.w #$0000
	sec
	sbc.w facedir,y
	bra .2

.t1:
	lda.w facedir,y
.2:
	and.w #$0007
	asl a
	tax
	lda.l $9DEF6E,x
	tax
	lda.l $9D0000,x
	ldx.b a3
	ldy.b a0
	sta.w $0D97,y
	lda.b a0
	jsl.l GetHot
	ldy.b a0
	pla
	sta.w $0D97,y
	lda.b d1
	clc
	adc.w Ypos,y
	sec
	sbc.w pucky
	sta.b d1
	lda.b d0
	clc
	adc.w Xpos,y
	sec
	sbc.w $0D71
	sta.b d0
	lda.w #$0018
	sta.b d6
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldy.b a0
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d0
	sta.b d2
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d1
	sta.b d3
	ldy.b d2
	jsl.l ApproxLength
	sta.b d4
	asl a
	tax
	lda.w #$0003
	jsl.l DivX8U
	cmp.w #$0040
	bcc .t1x
	cmp.w #$0050
	bcc .4
	ldx.b d4
	lda.w #$0005
	jsl.l DivX8U
	sta.b d6
	lda.w #$0050
	bra .3

.t1x:
	lda.b d4
	lsr a
	lsr a
	sta.b d6
	lda.w #$0040
.3:
	pha
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldy.b a0
	ldx.w $0EC3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d0
	sta.b d2
	lda.b d6
	asl a
	asl a
	asl a
	asl a
	ldx.w $0EE3,y
	jsl.l Mul16XS
	lda.b $0A
	clc
	adc.b d1
	sta.b d3
	ldy.b d2
	jsl.l ApproxLength
	sta.b d4
	pla
.4:
	sta.b d5
	sta.w passspeed
	ldx.b $E4
	lda.w #$0010
	sec
	sbc.w $13A3,x
	jsl.l randomd0s
	clc
	adc.b d5
	sta.b d5
	ldx.b d2
	jsl.l Mul16x8XS
	lda.b d4
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b d5
	ldx.b d3
	jsl.l Mul16x8XS
	lda.b d4
	sta.b $04
	jsl.l Div32S
	lda.b $00
	xba
	and.w #$FF00
	sta.w puckvy
	lda.b d2
	clc
	adc.w $0D71
	sta.w $0BA7
	lda.b d3
	clc
	adc.w pucky
	sta.w $0BA9
	lda.b d4
	asl a
	asl a
	asl a
	sta.w $0E01
	lda.w #$000A
	sta.w $121F
	ldy.b a0
	lda.b d6
	clc
	adc.w #$0006
	sta.w $0BAD,y
	ldx.b $E4
	lda.b d6
	sta.w $1203,x
	ldy.b a2
	lda.w $19D4,x
	sta.w $0B01,y
	lda.w position,x
	bne .rtl
	lda.w $19D4,x
	bmi .rtl
	stz.w $0EC3,x
	stz.w $0EE3,x
	lda.w $19D4,x
	sta.b d4
	lda.w $0D07
	sta.b d0
	jsl.l AssignPadIfFree
	lda.w $19D4,x
	bmi .rtl
	jsl.l findpc
.rtl:
	rtl
