; Track X: count down its wait, or play its events until the next wait
StepTrack:
	txa
	sta.b $4A
	asl a
	tax
	stx.w $07FF
.1:
	rep #$20
	lda.w $0848,x
	beq .t1
	jmp.w .13

.t1:
	lda.w $0804,x
	sta.b $4C
.2:
	jsr.w ReadTrackEvent
	lda.b $56
	sta.b $4C
	ldx.w $07FF
	ldy.b $60
	cpy.b #$D9
	bcs .t1x
	jmp.w .11

.t1x:
	cpy.b #$D9
	beq .1x
	cpy.b #$DA
	bne .t3
.1x:
	jsl.l MusicStop
	jmp.w .14

.t3:
	cpy.b #$E2
	bne .t1xx
	lda.w $0804,x
	sta.w $0826,x
	jmp.w .12

.t1xx:
	cpy.b #$DB
	bne .t2
	lda.w $0826,x
	sta.w $0804,x
	bra .1

.t2:
	cpy.b #$DD
	bne .t1xxx
.1xx:
	ldy.b $5A
	sty.w $07F6
	jmp.w .12

.t1xxx:
	cpy.b #$DE
	beq .3
	jmp.w .10
.3:
	lda.w $086A,x
	sta.b $4E
	sep #$20
	lda.w $07E3
	bne .t1xxxx
	ldy.b #$12
	lda.b ($4E),y
	sta.w $07FB
	iny
	lda.b ($4E),y
	bra .2x

.t1xxxx:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $07FB
.2x:
	sta.w $07FD
	ldx.b $4A
	lda.w $07FB
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08AE,x
	lda.w $07FD
	xba
	lda.b $5A
	jsr.w MulFrac8
	sta.w $08BF,x
	ldy.b #$07
.loop:
	lda.w $08FA,y
	cmp.b $4A
	bne .1xxx
	ldx.b $4A
	lda.w $08AE,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FC
	lda.w $08BF,x
	xba
	lda.w $0902,y
	jsr.w MulFrac8
	sta.w $07FE
.loop2:
	lda.w APUIO0
	bne .loop2
	lda.w $07FE
	sta.w APUIO3
	lda.w $07FC
	sta.w APUIO2
	sty.w APUIO1
	lda.b #$0E
	sta.w APUIO0
.loop3:
	cmp.w APUIO0
	bne .loop3
	stz.w APUIO0
.1xxx:
	dey
	bpl .loop
	rep #$20
	jmp.w .12
.4:
	lda.b $5E
	sta.b $5A
	jmp.w .3
.10:
	cpy.b #$DF
	beq .t1xxxxx
	jmp.w .t5

.t1xxxxx:
	ldy.b $5A
	cpy.b #$07
	beq .4
.1xxxx:
	cpy.b #$40
	bne .t2x
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08D0,x
	bne .3x
	ldx.b #$07
.loopx:
	lda.w $08FA,x
	cmp.b $4A
	bne .2xx
	lda.w $08F2,x
	beq .2xx
	phx
	txy
	txa
	asl a
	tax
	rep #$20
	jsr.w ReleaseVoice
	sep #$20
	plx
.2xx:
	dex
	bpl .loopx
.3x:
	rep #$20
	jmp.w .12

.t2x:
	cpy.b #$0B
	bne .t1xxxxxx
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08AE,x
	rep #$20
	jmp.w .12

.t1xxxxxx:
	cpy.b #$0C
	bne .t4
	sep #$20
	ldx.b $4A
	lda.b $5E
	sta.w $08BF,x
	rep #$20
	jmp.w .12

.t4:
	cpy.b #$32
	bne .t1x2
	sep #$20
	lda.b $5E
	sta.w $07E7
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t1x2:
	cpy.b #$33
	bne .t2xx
	sep #$20
	lda.b $5E
	sta.w $07EA
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t2xx:
	cpy.b #$34
	bne .t1xxxxxxx
	sep #$20
	lda.b $5E
	sta.w $07EB
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t1xxxxxxx:
	cpy.b #$35
	bne .t3x
	sep #$20
	lda.b $5E
	sta.w $07EC
	jsr.w SeqCmd08
	rep #$20
	jmp.w .12

.t3x:
	cpy.b #$37
	bne .t1x2x
	sep #$20
	lda.b $5E
	sta.w $07F8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w .12

.t1x2x:
	cpy.b #$38
	bne .t2xxx
	jmp.w .12

.t2xxx:
	cpy.b #$39
	bne .t1xxxxxxxx
	sep #$20
	lda.b $5E
	sta.w $07E8
	jsr.w CODE_80A40F
	rep #$20
	jmp.w .12

.t1xxxxxxxx:
	cpy.b #$3A
	bne .1xxxxx
.1xxxxx:
	jmp.w .12

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
.4x:
	lda.w $08FA,y
	cmp.b $4A
	beq .t3xx
	jmp.w .7

.t3xx:
	phy
	tya
	asl a
	tax
	phx
	lda.b $5C
	beq .t1xxxxxxxxx
	bmi .t2xxxx
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

.t1xxxxxxxxx:
	rep #$20
	plx
	lda.w $095A,x
	sta.b $5A
	bra .6

.t2xxxx:
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
	bpl .t1xxxxxxxxxx
	rep #$20
	lda.b $5E
	sta.b $43
	bra .5

.t1xxxxxxxxxx:
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
	jmp.w .4x
.8:
	rep #$20
	jmp.w .12
.9:
	cpy.b #$DC
	bne .4xx
	lda.b $5A
	and.w #$00FF
	cmp.w #$006A
	bne .2xxx
.1xxxxxx:
	lda.w #$0014
.2xxx:
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
	bne .t1xxxxxxxxxxx
	ldy.b #$12
	lda.b ($4E),y
	sta.w $08AE,x
	iny
	lda.b ($4E),y
	bra .3xx

.t1xxxxxxxxxxx:
	ldy.b #$17
	lda.b ($4E),y
	sta.w $08AE,x
.3xx:
	sta.w $08BF,x
.4xx:
	rep #$20
	cpy.b #$EA
	bne .2xxxx
.1xxxxxxx:
	lda.b $5A
	and.w #$00FF
	sta.b $62
.2xxxx:
	rep #$20
	jmp.w .12
.11:
	sep #$20
	lda.b $4A
	cmp.b #$09
	bne .1xxxxxxxx
	asl a
	tax
	tya
	sec
	sbc.b #$2F
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	lda.b $4E
	sta.w $086A,x
	sep #$20
	ldx.b $4A
	ldy.b #$12
	lda.b [$4E],y
	sta.w $08AE,x
	iny
	lda.b [$4E],y
	sta.w $08BF,x
	ldy.b #$2F
	lda.b [$4E],y
	sta.w $089D,x
	stz.w $088C,x
.1xxxxxxxx:
	lda.b $4A
	asl a
	tax
	rep #$20
	jsr.w CODE_80A697
.12:
	jsr.w ReadVarLen
	ldx.w $07FF
	cmp.w #$0000
	bne .t2xxxxx
	jmp.w .2

.t1xxxxxxxxxxxx:
	rep #$20
	bra .12

.t2xxxxx:
	sta.w $0848,x
	lda.b $4C
	sta.w $0804,x
.13:
	dec.w $0848,x
.14:
	sep #$30
	ldx.b $4A
	rts
