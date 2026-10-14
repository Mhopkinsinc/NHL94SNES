; Unidentified routine.
CODE_9E9484:
	lda.w pflags,x
	bit.w #$8000
	bne .rtl
	cpx.w #$0018
	bcc .t2
.rtl:
	rtl

.t2:
	lda.w OOlistpos,x
	sta.b d1
.loop:
	ldy.b d1
	cpy.w #$000F
	beq .t1
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.b d3
	sec
	sbc.w #$000E
	bpl .t1
	lda.w position,y
	bmi .1
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi .1
	cmp.w #$000F
	bpl .1
	lda.w pflags,y
	and.w #$8000
	ora.w $1563,y
	bne .1
	cpy.w #$0018
	bcs .1
	jsl.l .t3
.1:
	inc.b d1
	bra .loop

.t1:
	lda.w OOlistpos,x
	beq .rtlx
	sta.b d1
.loopx:
	ldy.b d1
	lda.w $15C2,y
	and.w #$00FF
	tay
	lda.b d3
	sec
	sbc.w Ylist,y
	sec
	sbc.w #$000E
	bpl .rtlx
	lda.w position,y
	bmi .1x
	lda.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFF1
	bmi .1x
	cmp.w #$000F
	bpl .1x
	lda.w pflags,y
	and.w #$8000
	ora.w $1563,y
	bne .1x
	cpy.w #$0018
	bcs .1x
	jsl.l .t3
.1x:
	dec.b d1
	bne .loopx
.rtlx:
	rtl

.t3:
	lda.b d0
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b d3
	pha
	lda.b d4
	pha
	lda.b d5
	pha
	sty.b a2
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d2
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d3
	ldy.b d2
	jsl.l CODE_9CA554
	cmp.w #$0010
	bmi .t1x
	jmp.w CODE_9E976E

.t1x:
	ldy.b a2
	lda.w $0EC3,x
	sec
	sbc.w $0EC3,y
	sta.b d0
	lda.w $0EE3,x
	sec
	sbc.w $0EE3,y
	sta.b d1
	lda.b d0
	ora.b d1
	bne .t2x
	jmp.w CODE_9E976E

.t2x:
	lda.b d1
	pha
	lda.b d0
	pha
	lda.b d3
	ldx.b d1
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $AB
	lda.b $08
	sta.b d1
	lda.b d2
	ldx.b d0
	jsl.l CODE_808FEB
	ldx.b a3
	lda.b $08
	clc
	adc.b d1
	sta.b d1
	lda.b $0A
	adc.b $AB
	sta.b $AB
	bpl .t1xx
	jmp.w CODE_9E9784

.t1xx:
	lda.w SPA,x
	cmp.w #$F3A6
	bcc .2
	cmp.w #$F46B
	bcs .2
	stz.w pfalock,x
	stz.w $1543,x
	ldy.w $0F03,x
	lda.w SPA,y
	cmp.w #$F3A6
	bcc .1x2
	cmp.w #$F46B
	bcs .1x2
	lda.w #$0000
	sta.w pfalock,y
	sta.w $1543,y
.1x2:
	ldy.b a2
.2:
	lda.w SPA,y
	cmp.w #$F3A6
	bcc .4
	cmp.w #$F46B
	bcs .4
	lda.w #$0000
	sta.w pfalock,y
	sta.w $1543,y
	ldx.w $0F03,y
	lda.w SPA,x
	cmp.w #$F3A6
	bcc .3
	cmp.w #$F46B
	bcs .3
	stz.w pfalock,x
	stz.w $1543,x
.3:
	ldx.b a3
.4:
	lda.b $AA
	sta.b d1
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9E9692
	lda.b d1
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0005
	bcs .5
	lda.w #$0005
.5:
	sta.b d4
	lda.w SPA,x
	cmp.w #$F208
	bcc CODE_9E963C
	cmp.w #$F343
	bcs CODE_9E963C
CODE_9E9633:
	lda.b d4
	lsr a
	adc.b d4
	sta.b d4
	bra CODE_9E9649
