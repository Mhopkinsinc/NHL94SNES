; Unidentified routine.
CODE_80A965:
	cpy.b #$DF
	beq .t1
	jmp.w .t5

.t1:
	ldy.b $5A
	cpy.b #$07
	beq CODE_80A95E
.1:
	cpy.b #$40
	bne .t2
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08D0,x
	bne .3
	ldx.b #$07
.loop:
	lda.w $08FA,x
	cmp.b $4A
	bne .2
	lda.w $08F2,x
	beq .2
	phx
	txy
	txa
	asl a
	tax
	rep #$20
	jsr.w CODE_80ABF7
	sep #$20
	plx
.2:
	dex
	bpl .loop
.3:
	rep #$20
	jmp.w CODE_80ABA5

.t2:
	cpy.b #$0B
	bne .t1x
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08AE,x
	rep #$20
	jmp.w CODE_80ABA5

.t1x:
	cpy.b #$0C
	bne .t4
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08BF,x
	rep #$20
	jmp.w CODE_80ABA5

.t4:
	cpy.b #$32
	bne .t1x2
	sep #$20
	lda.b $5E
	sta.w $07E7
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5

.t1x2:
	cpy.b #$33
	bne .t2x
	sep #$20
	lda.b $5E
	sta.w $07EA
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5

.t2x:
	cpy.b #$34
	bne .t1xx
	sep #$20
	lda.b $5E
	sta.w $07EB
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5

.t1xx:
	cpy.b #$35
	bne .t3
	sep #$20
	lda.b $5E
	sta.w $07EC
	jsr.w CODE_80ADE9
	rep #$20
	jmp.w CODE_80ABA5

.t3:
	cpy.b #$37
	bne .t1x2x
	sep #$20
	lda.b $5E
	sta.w $07F8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5

.t1x2x:
	cpy.b #$38
	bne .t2xx
	jmp.w CODE_80ABA5

.t2xx:
	cpy.b #$39
	bne .t1xxx
	sep #$20
	lda.b $5E
	sta.w $07E8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w CODE_80ABA5

.t1xxx:
	cpy.b #$3A
	bne .1x
.1x:
	jmp.w CODE_80ABA5

.t5:
	cpy.b #$E5
	beq .t2x2
	jmp.w CODE_80AB0B

.t2x2:
	lda.b $5E
	sep #$20
	asl a
	rep #$20
	sec
	sbc.w #$4000
	asl a
	sep #$20
	xba
	ldx.b $4A
	sta.w $088C,x
	sta.b $5C
	lda.w $089D,x
	bne .t1x3
.1x2:
	jmp.w CODE_80AB06

.t1x3:
	sta.b $60
	ldy.b #$07
CODE_80AA71:
	lda.w $08FA,y
	cmp.b $4A
	beq .t3
	jmp.w CODE_80AAFE

.t3:
	phy
	tya
	asl a
	tax
	phx
	lda.b $5C
	beq .t1
	bmi .t2
	lda.w $090A,y
	clc
	adc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	plx
	sec
	sbc.w $095A,x
	sta.b $5E
	sep #$20
	lda.b $5C
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.w $095A,x
	sta.b $5A
	bra CODE_80AAF3

.t1:
	rep #$20
	plx
	lda.w $095A,x
	sta.b $5A
	bra CODE_80AAF3

.t2:
	lda.w $090A,y
	sec
	sbc.b $60
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sta.b $5A
	plx
	lda.w $095A,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.b $5C
	bpl .t1x
	rep #$20
	lda.b $5E
	sta.b $43
	bra CODE_80AAEB

.t1x:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
CODE_80AAEB:
	lda.w $095A,x
	sec
	sbc.b $43
	sta.b $5A
CODE_80AAF3:
	ldy.b #$02
	lda.b ($4E),y
	clc
	adc.b $5A
	sta.w $094A,x
	ply
CODE_80AAFE:
	sep #$20
	dey
	bmi CODE_80AB06
	jmp.w CODE_80AA71
