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
	jsr.w ReleaseVoice
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
	jsr.w SeqCmd08
	rep #$20
	jmp.w CODE_80ABA5

.t1x2:
	cpy.b #$33
	bne .t2x
	sep #$20
	lda.b $5E
	sta.w $07EA
	jsr.w SeqCmd08
	rep #$20
	jmp.w CODE_80ABA5

.t2x:
	cpy.b #$34
	bne .t1xx
	sep #$20
	lda.b $5E
	sta.w $07EB
	jsr.w SeqCmd08
	rep #$20
	jmp.w CODE_80ABA5

.t1xx:
	cpy.b #$35
	bne .t3
	sep #$20
	lda.b $5E
	sta.w $07EC
	jsr.w SeqCmd08
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
	jmp.w .9

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
	jmp.w .8

.t1x3:
	sta.b $60
	ldy.b #$07
.4:
	lda.w $08FA,y
	cmp.b $4A
	beq .t3x
	jmp.w .7

.t3x:
	phy
	tya
	asl a
	tax
	phx
	lda.b $5C
	beq .t1xxxx
	bmi .t2xxx
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
	bra .6

.t1xxxx:
	rep #$20
	plx
	lda.w $095A,x
	sta.b $5A
	bra .6

.t2xxx:
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
	bpl .t1xxxxx
	rep #$20
	lda.b $5E
	sta.b $43
	bra .5

.t1xxxxx:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
.5:
	lda.w $095A,x
	sec
	sbc.b $43
	sta.b $5A
.6:
	ldy.b #$02
	lda.b ($4E),y
	clc
	adc.b $5A
	sta.w $094A,x
	ply
.7:
	sep #$20
	dey
	bmi .8
	jmp.w .4
.8:
	rep #$20
	jmp.w CODE_80ABA5
.9:
	cpy.b #$DC
	bne .4x
	lda.b $5A
	and.w #$00FF
	cmp.w #$006A
	bne .2x
.1xx:
	lda.w #$0014
.2x:
	asl a
	tay
	lda.b [$34],y
	clc
	adc.b $34
	sta.w $086A,x
	sta.b $4E
	sep #$20
	ldx.b $4A
	ldy.b #$2F
	lda.b ($4E),y
	sta.w $089D,x
	stz.w $088C,x
	lda.w $07E3
	bne .t1xxxxxx
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08AE,x
	iny
	lda.b ($4E),y
	bra .3x

.t1xxxxxx:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08AE,x
.3x:
	sta.w $08BF,x
.4x:
	rep #$20
	cpy.b #$EA
	bne .2xx
.1xxx:
	lda.b $5A
	and.w #$00FF
	sta.b $62
.2xx:
	rep #$20
	jmp.w CODE_80ABA5
