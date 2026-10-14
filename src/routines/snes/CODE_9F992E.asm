; Unidentified routine.
CODE_9F992E:
	lda.b d0
	asl a
	adc.b d0
	asl a
	asl a
	sta.b $00
	stz.b $A7
	ldy.b a2
	beq .1
	lda.b $00
	clc
	adc.w #$0138
	sta.b $00
.1:
	lda.w #$009C
	sta.b $8B
	lda.w tmdata,y
	sta.b a0
	clc
	ldy.w #$0000
	adc.b [a0],y
	sta.b a0
	dec.b d0
	bmi .2
.loop:
	lda.b a0
	clc
	adc.b [a0]
	adc.w #$0008
	sta.b a0
	dec.b d0
	bpl .loop
.2:
	lda.b [a0]
	clc
	adc.b a0
	sta.b a0
	stz.b d0
	stz.b d1
	phx
	lda.w #$0000
.11:
	sta.b d2
	asl a
	tax
	lda.l DATA8_80DA26,x
	bit.b $B7
	bne .t2
	jmp.w .12

.t2:
	cpx.w #$000C
	beq .1x
	cpx.w #$001A
	bne .2x
.1x:
	inc.b $A7
.2x:
	lda.w #$000F
	sec
	sbc.b d2
	sta.b $10
	lsr a
	clc
	adc.b a0
	sta.b $0C
	lda.b $8B
	sta.b $0E
	lda.b [$0C]
	sta.b d3
	lda.b d2
	lsr a
	bcc .3
	lda.b d3
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d3
.3:
	lda.b d3
	and.w #$000F
	sta.b d3
	lda.b $10
	dec a
	dec a
	dec a
	cmp.w #$0006
	bcc .4
	dec a
.4:
	clc
	adc.b $00
	tax
	lda.l $7E35F2
	beq .5
	lda.w $1A12,x
	and.w #$00FF
.5:
	sta.b $16
	cmp.w #$0080
	bcc .6
	lda.w #$0100
	sbc.b $16
.6:
	sta.b $14
	asl a
	clc
	adc.b $14
	lsr a
	lsr a
	bit.w #$2000
	beq .7
	ora.w #$C000
.7:
	sta.b $14
	lda.b $16
	bit.w #$0080
	beq .8
	lda.w #$0000
	sec
	sbc.b $14
	sta.b $14
.8:
	lda.b $B7
	bmi .t3
	ldx.b $10
	lda.l DATA8_9F9AF8,x
	and.w #$00FF
	beq .t1
	lda.w #$0012
	ldx.b d3
	jsl.l CODE_808F4C
	clc
	adc.b $14
	bpl .9
	lda.w #$0000
.9:
	cmp.w #$0064
	bcc .10
	lda.w #$0064
.10:
	sta.b d0
	plx
	jmp.w .17

.t1:
	lda.b d3
	sta.b d0
	plx
	jmp.w .17

.t3:
	lda.b $10
	clc
	adc.b $08
	tax
	lda.l DATA8_9F9AD8,x
	ldx.b d3
	jsl.l CODE_808F4C
	clc
	adc.b d0
	sta.b d0
	lda.b $14
	ldy.b $08
	beq .1xx
	asl a
.1xx:
	clc
	adc.b d1
	sta.b d1
.12:
	lda.b d2
	inc a
	cmp.w #$000F
	bpl .t2x
	jmp.w .11

.t2x:
	lda.b d1
	bpl .14
	eor.w #$FFFF
	inc a
	ldx.b $08
	bne .t1x
	tax
	lda.w #$000A
	bra .13

.t1x:
	tax
	lda.w #$0007
.13:
	jsl.l DivX8U
	sec
	eor.w #$FFFF
	adc.b d0
	sta.b d0
	lda.b d0
	bpl .16
	stz.b d0
	lda.w #$0000
	bra .16
.14:
	ldx.b $08
	bne .t1xx
	tax
	lda.w #$000A
	bra .15

.t1xx:
	tax
	lda.w #$0007
.15:
	jsl.l DivX8U
	clc
	adc.b d0
	sta.b d0
	lda.b d0
	bpl .16
	stz.b d0
	lda.w #$0000
.16:
	sta.b d0
	plx
	lda.b $08
	beq .17
	lsr.b d0
.17:
	lda.b $A7
	bne .rtl
	lda.b d0
	cmp.w #$0064
	bcc .1xxx
	lda.w #$0064
.1xxx:
	cmp.w #$0032
	bcs .2xx
	lsr a
	clc
	adc.w #$0019
.2xx:
	sta.b d0
.rtl:
	rtl
