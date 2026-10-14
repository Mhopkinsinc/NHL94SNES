; Unidentified routine.
CODE_9BAE77:
	lda.w $0CAB
	cmp.w #$FFFF
	bne .9
	lda.w $0AE7
	cmp.w #$000F
	beq .t1
	asl a
	tax
	lda.w #$000F
	sta.w $0AF3
	lda.w Xpos,x
	sta.w $0D75
	lda.w Ypos,x
	sta.w $0DD7
	bra .9

.t1:
	lda.w #$000F
	sta.w $0AF3
	lda.w $0D71
	cmp.w #$FF78
	bpl .2
.1:
	lda.w #$FF78
.2:
	cmp.w #$0088
	bmi .4
.3:
	lda.w #$0088
.4:
	sta.w $0D75
	lda.w pucky
	cmp.w #$FED4
	bpl .6
.5:
	lda.w #$FED4
.6:
	cmp.w #$012C
	bmi .8
.7:
	lda.w #$012C
.8:
	sta.w $0DD7
.9:
	lda.b d1
	bit.w #$8000
	beq .2x
	lda.l $7E35F0
	beq .1x
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0180
	ldy.w #$0000
	jsl.l CODE_808862
	jsl.l WaitFrame
	lda.w #$0000
	sta.l $7E35F0
.1x:
	lda.w sflags3
	eor.w #$0002
	sta.w sflags3
.2x:
	lda.b d3
	bit.w #$0020
	bne .t1x
	bit.w #$0050
	bne .t5
	lda.b d1
	bit.w #$2000
	bne .t3
	bit.w #$1000
	bne .t2
	lda.b d3
	bit.w #$0080
	bne .t4
	bit.w #$4000
	beq .12
	jsl.l suba4
	jsl.l suba4
	bra .11

.t1x:
	jsl.l suba4
	ldx.w #$0006
	bra .10

.t2:
	jmp.w CODE_9BB020

.t3:
	lda.w #$FFFF
	sta.w $0CAB
	lda.w #$0020
	trb.w sflags
	jmp.w CODE_9BACE5

.t4:
	jsl.l adda4
	jsl.l adda4
	bra .11

.t5:
	jsl.l adda4
	ldx.w #$0006
	lda.b d3
	bit.w #$0010
	bne .10
	ldx.w #$000C
.10:
	ldy.w #$0000
	jsl.l WaitFrames_Inc
.11:
	jsl.l SoundVoicesOff
	lda.w #$0001
	sta.b d7
	lda.w #$0002
	trb.w sflags3
	jmp.w CODE_9BABAB
.12:
	lda.w sflags3
	bit.w #$0002
	bne .t1xx
	jmp.w CODE_9BACE5

.t1xx:
	jsl.l adda4
	lda.b d7
	beq .11
	lda.w $0CB3
	and.w #$00FF
	cmp.w #$00FF
	beq .13
	cmp.w #$0016
	bcs .t2x
	lda.w $0CB7
	sta.b $64
	lda.w $0CB3
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1xx
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CB5
	sta.w $094A,y
.1xx:
	rep #$20
	bra .13

.t2x:
	sec
	sbc.w #$0015
	jsl.l CODE_9C9A7F
.13:
	lda.w $0CAD
	and.w #$00FF
	cmp.w #$00FF
	beq .14
	cmp.w #$0016
	bcs .t1xxx
	lda.w $0CB1
	sta.b $64
	lda.w $0CAD
	and.w #$00FF
	jsl.l CODE_80A17D
	tay
	sep #$20
	lda.w $08F2,y
	cmp.b #$02
	bne .1xxx
org $9BB001
	lda.b #$03
	sta.w $08F2,y
	rep #$20
	tya
	asl a
	tay
	lda.w $0CAF
	sta.w $094A,y
.1xxx:
	rep #$20
	bra .14

.t1xxx:
	sec
	sbc.w #$0015
	jsl.l CODE_9C9A7F
.14:
	jmp.w CODE_9BABAB
