; Unidentified routine.
CODE_9EA719:
	asl.b d2
	asl.b d2
	ldx.b d2
	lda.l DATA8_9EA889+2,x
	sta.b d1
	lda.l DATA8_9EA889,x
	sta.b d0
	ldx.b $E4
	lda.w $1123,x
	beq .1
	eor.b d0
	bpl .1
	stz.b d0
.1:
	lda.w $1103,x
	beq .2
	eor.b d1
	bmi .2
	stz.b d1
.2:
	lda.w $12C3,x
	lsr a
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0020
	clc
	adc.w $12E3,x
	sta.b d2
	lda.w $12E3,x
	lsr a
	adc.b d2
	sta.b d2
	lda.w position,x
	bne .7
	lda.w $19D4,x
	bmi .t1
	cpx.w shotPlIdx
	beq .t1
	lda.w $12E3,x
	asl a
	adc.b d2
	adc.w #$0008
	sta.b d2
	bra .7

.t1:
	lda.b d2
	ldy.w $0D07
	bmi .1x
	sec
	sbc.w $12E3,x
.1x:
	clc
	adc.w #$0008
	sta.b d2
.7:
	lda.b d2
	pha
	ldx.b d0
	jsl.l CODE_808F5D
	tax
	lda.b d7
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EC3,x
	sta.b d0
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .1xx
	ora.w #$FF00
.1xx:
	tax
	jsl.l CODE_808F7D
	sta.b d3
	pla
	ldx.b d1
	jsl.l CODE_808F5D
	tax
	lda.b d7
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EE3,x
	sta.b d1
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .2x
	ora.w #$FF00
.2x:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d3
	sta.b d3
	lda.b d1
	pha
	lda.b d0
	pha
	ldx.b $E4
	jsl.l CODE_9FDCB2
	lda.w $1303,x
	pha
	lda.l $7E34C6
	cmp.w #$0002
	bne .3
	lda.w #$1000
	sta.b d0
.3:
	lda.b d0
	lsr a
	clc
	adc.w #$0800
	tax
	pla
	asl a
	asl a
	asl a
	asl a
	jsl.l CODE_808F98
	lda.b $0A
	asl a
	asl a
	tax
	lda.l DATA8_80D9C6,x
	sta.b d2
	lda.l DATA8_80D9C6+2,x
	sta.b $AF
	ldx.b $E4
	lda.w position,x
	bne .4
	lda.w $19D4,x
	bmi .4
	lda.w $0B05,x
	bit.w #$0004
	bne .4
	lda.b $AF
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	adc.b $AF
	sta.b $AF
.4:
	pla
	sta.b d0
	pla
	sta.b d1
	lda.b $AF
	cmp.b d3
	bcc .5
	lda.b d0
	sta.w $0EC3,x
	lda.b d1
	sta.w $0EE3,x
.5:
	lda.l $7E34C6
	beq .t1x
	lda.w $0792
	and.w #$003F
	bne .t1x
	jsl.l CODE_9FDCB2
	lda.b d0
	sec
	sbc.w #$0021
	sta.b d0
	cmp.w #$0C00
	bmi .6
	lda.w $1423,x
	sta.b d2
	clc
	adc.b d0
	sta.b d0
.6:
	jml.l setpde

.t1x:
	rtl
