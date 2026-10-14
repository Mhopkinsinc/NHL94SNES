; Unidentified routine.
CODE_9BA31C:
	lda.l $7E3420,x
	sec
	sbc.w $0ADB
	bpl .t1
	clc
	adc.l DATA8_9BA414,x
	sta.l $7E3420,x
	lda.l $7E340C,x
	inc a
	cmp.w #$0004
	bne .1
	lda.w #$0001
.1:
	sta.l $7E340C,x
	bra CODE_9BA346

.t1:
	sta.l $7E3420,x
CODE_9BA346:
	ldy.w $0ADB
	beq .1
.loop:
	jsl.l .t3
	dey
	bne .loop
.1:
	jmp.w CODE_9BA293

.t3:
	lda.l $7E33D0,x
	ora.l $7E33E4,x
	beq .rtl
	lda.l $7E3394,x
	clc
	adc.l $7E33D0,x
	sta.l $7E3394,x
	lda.l $7E33A8,x
	clc
	adc.l $7E33E4,x
	sta.l $7E33A8,x
	lda.l $7E33BC,x
	beq .t2
	lda.l $7E33F8,x
	lsr a
	lsr a
	bit.w #$2000
	beq .1x
	ora.w #$C000
.1x:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33BC,x
	bmi .t1
	sta.l $7E33BC,x
	lda.l $7E33F8,x
	clc
	adc.w #$0006
	sta.l $7E33F8,x
.rtl:
	rtl

.t1:
	lda.w #$0000
	sta.l $7E33BC,x
	rtl

.t2:
	lda.w #$0000
	sta.l $7E33F8,x
	sta.l $7E33BC,x
	lda.w #$03E8
	sta.l $7E3420,x
	lda.l $7E33D0,x
	cmp.w #$0010
	bcc .t1x
	cmp.w #$FFF0
	bcs .t1x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .1xx
	ora.w #$F000
.1xx:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33D0,x
	sta.l $7E33D0,x
	lda.l $7E33E4,x
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .2
	ora.w #$F000
.2:
	eor.w #$FFFF
	inc a
	clc
	adc.l $7E33E4,x
	sta.l $7E33E4,x
	rtl

.t1x:
	lda.w #$0000
	sta.l $7E33D0,x
	sta.l $7E33E4,x
	rtl
