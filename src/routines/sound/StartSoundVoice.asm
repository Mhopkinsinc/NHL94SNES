; Put sound entry $4E on a free voice (FindFreeVoice) with its pitch, volume and envelope (SeqCmd07)
StartSoundVoice:
	php
	rep #$20
	lda.w $086A,x
	beq .3
	sta.b $4E
	cmp.w #$DF80
	beq .1
	cmp.w #$DFB0
	bne .2
.1:
	lda.b $5E
	bmi .3
	beq .3
.2:
	sep #$30
	jsr.w FindFreeVoice
	stx.b $4B
	txa
	bpl .t1
.3:
	plp
	rts

.t1:
	asl a
	sta.w $0800
	lda.b $4A
	sta.w $08FA,x
	ldy.b #$2A
	lda.b ($4E),y
	sta.w $0912,x
	ldy.b #$15
	lda.b ($4E),y
	bpl .t2
	lda.b #$02
	bra .4

.t2:
	lda.b #$01
.4:
	sta.w $08F2,x
	ldx.w $0800
	rep #$20
	lda.b $4E
	cmp.w #$E130
	bne .t1x
	lda.w #$002D
	bra .5

.t1x:
	lda.b $5E
.5:
	dec a
	sta.w $091A,x
	stz.w $096A,x
	stz.w $097A,x
	stz.w $098A,x
	ldy.b #$1C
	lda.b ($4E),y
	sta.w $099A,x
	stz.w $09AA,x
	ldy.b #$20
	lda.b ($4E),y
	sta.w $09BA,x
	stz.w $09CA,x
	ldy.b #$1E
	lda.b ($4E),y
	sta.w $09DA,x
	stz.w $09EA,x
	ldy.b #$2D
	lda.b ($4E),y
	bmi .t1xx
	lda.w #$FFFF
	bra .6

.t1xx:
	lda.w #$0000
.6:
	sta.w $09FA,x
	ldy.b #$0A
	lda.b ($4E),y
	sta.w $093A,x
	sta.b $5C
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne .1x
	lda.w sflags
	bit.w #$0800
	bne .1x
	lda.b $5C
	sta.w recsfxvol
.1x:
	lda.b $4E
	sta.w $092A,x
	sep #$20
	ldx.b $5A
	lda.l VolumeCurve,x
	and.b #$FF
	cmp.b #$40
	bne .t1xxx
	ldx.b $4A
	lda.w $08AE,x
	sta.w $07FC
	iny
	lda.w $08BF,x
	sta.w $07FE
	jmp.w .7

.t1xxx:
	asl a
	sta.b $5A
	ldx.b $4B
	sta.w $0902,x
	ldx.b $4A
	xba
	lda.w $08AE,x
	jsr.w MulFrac8
	sta.w $07FC
	lda.b $5A
	xba
	lda.w $08BF,x
	jsr.w MulFrac8
	sta.w $07FE
.7:
	lda.w $0802
	beq .1xx
	lda.b $4A
	cmp.b #$10
	beq .1xx
	lsr.w $07FE
	lsr.w $07FC
	lda.w $0802
	bpl .1xx
	lsr.w $07FE
	lsr.w $07FC
.1xx:
	ldy.b #$04
	lda.b $60
	clc
	adc.b ($4E),y
	sta.b $60
	ldx.b $4B
	sta.w $090A,x
	ldx.b $4A
	cpx.b #$09
	bne .2x
	lda.b #$3F
	clc
	adc.b ($4E),y
.2x:
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	ldx.w $0800
	sta.w $095A,x
	sta.b $5A
	sep #$20
	ldy.b $4A
	lda.w $089D,y
	beq .9
	lda.w $088C,y
	beq .9
	bmi .t2x
	lda.b $60
	clc
	adc.w $089D,y
	asl a
	tax
	rep #$20
	lda.l PitchTable,x
	sec
	sbc.b $5A
	sta.b $5E
	sep #$20
	lda.w $088C,y
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
	clc
	adc.b $5A
	sta.b $5A
	bra .9

.t2x:
	lda.b $60
	sec
	sbc.w $089D,y
	asl a
	tax
	rep #$20
	lda.b $5A
	sec
	sbc.l PitchTable,x
	sta.b $5E
	sep #$20
	lda.b #$00
	sec
	sbc.w $088C,y
	bpl .t1xxxx
	rep #$20
	lda.b $5E
	sta.b $43
	bra .8

.t1xxxx:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
.8:
	lda.b $5A
	sec
	sbc.b $43
	sta.b $5A
.9:
	rep #$20
	ldy.b #$02
	lda.b ($4E),y
	ldx.w $0800
	clc
	adc.b $5A
	sta.w $094A,x
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne .1xxx
	lda.w sflags
	bit.w #$0800
	bne .1xxx
	lda.w $094A,x
	sta.w recsfxpitch
.1xxx:
	sep #$20
	jsr.w SeqCmd07
	tya
	plp
	rts
