; Do not skate through the goal: aim beside the net when the path crosses it
avdgoal:
	phb
	phk
	plb
	stz.b tmp2
	lda.w Xpos,x
	sta.b $0C
	lda.w Ypos,x
	sta.b $0E
	lda.b d0
	sta.b $10
	lda.b d1
	sta.b $12
	lda.w position,x
	bne .t1
	jmp.w .28

.t1:
	ldx.w #$00E5
	ldy.w #$011C
	jsr.w .27
	ldx.w #$00E4
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.w #$0108
	sta.b $22
	lda.w topgoalie
	sta.b $20
	lda.b tmp2
	bne .t2
	ldx.w #$FEE4
	ldy.w #$FF1B
	jsr.w .27
	ldx.w #$FEE3
	ldy.w #$FF1C
	stx.b $14
	sty.b $16
	lda.w #$FEF8
	sta.b $22
	lda.w botgoalie
	sta.b $20
	lda.b tmp2
	bne .2
	ldx.b $E4
	plb
	rtl

.t2:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b tmp0
	bit.w #$000A
	beq .1
	eor.w #$000A
	sta.b tmp0
.1:
	lda.b tmp1
	bit.w #$000A
	beq .2
	eor.w #$000A
	sta.b tmp1
.2:
	lda.b tmp1
	beq .t1x
	ldx.b tmp0
	jsr (.26,x)
	ldx.b $E4
	plb
	rtl

.t1x:
	jsr.w .t2x
	ldx.b $E4
	plb
	rtl

.t2x:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl .t1xx
	lda.b $12
	cmp.w #$FEF8
	bmi .3
	bra .8

.t1xx:
	lda.b $12
	cmp.w #$FEF8
	bmi .5
	ldy.b $20
	bmi .3
	lda.b $0C
	cmp.b $10
	bmi .4
	cmp.w Xpos,y
	bmi .3
	lda.b $16
	sta.b d1
.3:
	rts
.4:
	cmp.w Xpos,y
	bpl .rts
	lda.b $16
	sta.b d1
.rts:
	rts
.5:
	lda.b $16
	sta.b d1
	bra .10
.6:
	lda.w #$FFCA
	sta.b d0
	rts
.7:
	lda.b $0E
	cmp.w #$FEF8
	bpl .9
.8:
	lda.b $0C
	cmp.w #$FFCB
	bmi .6
	cmp.w #$0036
	bpl .17
	lda.b $14
	sta.b d1
	bra .12
.9:
	lda.b $12
	cmp.w #$FEF8
	bpl .t1xxx
	lda.b $22
	sta.b d1
	ldy.b $20
	bmi .12
	lda.b $0C
	cmp.w Xpos,y
	bmi .6
	bra .17

.t1xxx:
	ldy.b $20
	bmi .13
.10:
	lda.b $10
	sec
	sbc.w Xpos,y
	pha
	lda.b $0C
	sec
	sbc.b $10
	eor.b $01,s
	bpl .14
	pla
	lda.b $0C
	cmp.w Xpos,y
	bpl .17
	bra .23
.11:
	lda.b $16
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne .13
.12:
	lda.b $10
	bpl .t1xxxx
	cmp.w #$FFCB
	bmi .13
	lda.w #$FFCA
	sta.b d0
	rts

.t1xxxx:
	cmp.w #$0036
	bpl .13
	lda.w #$0036
	sta.b d0
.13:
	rts
.14:
	pla
	rts
.15:
	lda.b tmp1
	cmp.w #$0010
	bne .17
.16:
	lda.b $16
	sta.b d1
	rts
.17:
	lda.w #$0036
	sta.b d0
	rts
.18:
	lda.w #$0036
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq .16
	rts
.19:
	lda.b tmp1
	cmp.w #$0010
	bne .17
.20:
	lda.b $14
	sta.b d1
	rts
.21:
	lda.b $14
	sta.b d1
	lda.b tmp1
	and.w #$0002
	bne .12
	rts
.22:
	lda.b tmp1
	cmp.w #$0004
	beq .20
.23:
	lda.w #$FFCA
	sta.b d0
	rts
.24:
	lda.w #$FFCA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq .16
	rts
.25:
	lda.b tmp1
	cmp.w #$0004
	beq .16
.1x:
	lda.w #$FFCA
	sta.b d0
	rts
.26:		; jump table for jsr (.26,x)
	dw .7,.11,.18,.15,.21,$0000,.19
	dw $0000,.24,.25,$0000,$0000,.22
.27:
	stx.b $14
	sty.b $16
	stz.b tmp0
	stz.b tmp1
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl .4x
	lda.w #$0008
	sta.b tmp0
	cpy.b $14
	bpl .5x
.1xx:
	rts
.2x:
	cpy.b $16
	bmi .6x
	lda.w #$0002
	sta.b tmp1
	bra .6x
.3x:
	cpy.w #$002C
	bmi .7x
	lda.b tmp1
	ora.w #$0004
	sta.b tmp1
	bra .7x
.4x:
	cpy.b $14
	bpl .5x
	lda.w #$0008
	sta.b tmp1
.5x:
	cpx.b $16
	bmi .2x
	lda.w #$0002
	sta.b tmp0
	cpy.b $16
	bpl .1xx
.6x:
	ldx.b $0C
	ldy.b $10
	cpx.w #$002C
	bmi .3x
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$002C
	bpl .1xx
.7x:
	cpx.w #$FFD4
	bpl .2xx
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFD4
	bmi .1xx
.1xxx:
	inc.b tmp2
	rts
.2xx:
	cpy.w #$FFD4
	bpl .1xxx
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
.28:
	ldx.w #$0102
	ldy.w #$011C
	jsr.w .48
	ldx.w #$0101
	ldy.w #$011D
	stx.b $14
	sty.b $16
	lda.b tmp2
	bne .t1xxxxx
	ldx.w #$FEE4
	ldy.w #$FEFE
	jsr.w .48
	ldx.w #$FEE3
	ldy.w #$FEFF
	stx.b $14
	sty.b $16
	lda.b tmp2
	bne .2xxx
	ldx.b $E4
	plb
	rtl

.t1xxxxx:
	lda.b $14
	ldy.b $16
	sty.b $14
	sta.b $16
	lda.b $0E
	eor.w #$FFFF
	inc a
	sta.b $0E
	lda.b $12
	eor.w #$FFFF
	inc a
	sta.b $12
	lda.b tmp0
	bit.w #$000A
	beq .1xxxx
	eor.w #$000A
	sta.b tmp0
.1xxxx:
	lda.b tmp1
	bit.w #$000A
	beq .2xxx
	eor.w #$000A
	sta.b tmp1
.2xxx:
	lda.b tmp1
	beq .t1xxxxxx
	ldx.b tmp0
	jsr (.47,x)
	ldx.b $E4
	plb
	rtl

.t1xxxxxx:
	jsr.w .t3
	ldx.b $E4
	plb
	rtl

.t3:
	ldx.b $E4
	lda.b $0E
	cmp.w #$FEF8
	bpl .t1xxxxxxx
	lda.b $12
	cmp.w #$FEF8
	bmi .t2xx
	bra .31

.t1xxxxxxx:
	lda.b $12
	cmp.w #$FEF8
	bpl .t2xx
	bra .33

.t2xx:
	rts

.t1xxxxxxxx:
	cmp.w Xpos,y
	bpl .36
	lda.b $16
	sta.b d1
	rts
.29:
	lda.w #$FFDA
	sta.b d0
	rts
.30:
	lda.b $0E
	cmp.w #$FEF8
	bpl .32
.31:
	lda.b $0C
	cmp.w #$FFDB
	bmi .29
	cmp.w #$0026
	bpl .39
	lda.b $14
	sta.b d1
	bra .35
.32:
	lda.b tmp1
	bit.w #$0002
	bne .36
.33:
	lda.b $16
	sta.b d1
	bra .35
.34:
	lda.b $16
	sta.b d1
	lda.b tmp1
	and.w #$0008
	bne .36
.35:
	lda.b $10
	bpl .t1xxxxxxxxx
	cmp.w #$FFDB
	bmi .36
	lda.w #$FFDA
	sta.b d0
	rts

.t1xxxxxxxxx:
	cmp.w #$0026
	bpl .36
	lda.w #$0026
	sta.b d0
.36:
	rts
.37:
	lda.b tmp1
	cmp.w #$0010
	bne .39
.38:
	lda.b $16
	sta.b d1
	rts
.39:
	lda.w #$0026
	sta.b d0
	rts
.40:
	lda.w #$0026
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq .38
	rts
.41:
	lda.b tmp1
	cmp.w #$0010
	bne .39
.42:
	lda.b $14
	sta.b d1
	rts
.43:
	lda.b $14
	sta.b d1
	lda.b tmp1
	and.w #$0002
	bne .35
	rts
.44:
	lda.b tmp1
	cmp.w #$0004
	beq .42
	lda.w #$FFDA
	sta.b d0
	rts
.45:
	lda.w #$FFDA
	sta.b d0
	lda.b tmp1
	and.w #$000A
	beq .38
	rts
.46:
	lda.b tmp1
	cmp.w #$0004
	beq .38
	lda.w #$FFDA
	sta.b d0
	rts
.47:		; jump table for jsr (.47,x)
	dw .30,.34,.40,.37,.43,$0000,.41
	dw $0000,.45,.46,$0000,$0000,.44
.48:
	stx.b $14
	sty.b $16
	stz.b tmp0
	stz.b tmp1
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl .4xx
	lda.w #$0008
	sta.b tmp0
	cpy.b $14
	bpl .5xx
.1xxxxx:
	rts
.2xxxx:
	cpy.b $16
	bmi .6xx
	lda.w #$0002
	sta.b tmp1
	bra .6xx
.3xx:
	cpy.w #$0024
	bmi .7xx
	lda.b tmp1
	ora.w #$0004
	sta.b tmp1
	bra .7xx
.4xx:
	cpy.b $14
	bpl .5xx
	lda.w #$0008
	sta.b tmp1
.5xx:
	cpx.b $16
	bmi .2xxxx
	lda.w #$0002
	sta.b tmp0
	cpy.b $16
	bpl .1xxxxx
.6xx:
	ldx.b $0C
	ldy.b $10
	cpx.w #$0024
	bmi .3xx
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$0024
	bpl .1xxxxx
.7xx:
	cpx.w #$FFDC
	bpl .2xxxxx
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFDC
	bmi .1xxxxx
.1xxxxxx:
	inc.b tmp2
	rts
.2xxxxx:
	cpy.w #$FFDC
	bpl .1xxxxxx
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
