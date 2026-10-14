; Unidentified routine.
CODE_9EE9BF:
	stz.w $0BAB
	lda.w #$0004
	trb.w sflags
	lda.w #$FFFF
	sta.w shotPlIdx
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
	jsl.l CODE_9C9ABC
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
	jsl.l CODE_808F5D
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
	jsl.l CODE_808F5D
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
	ldy.w #$E34E
	lda.w position,x
	beq .1x
	ldy.w #$EC66
	jsl.l Findhittype
	beq .1x
	ldy.w #$ECD8
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
