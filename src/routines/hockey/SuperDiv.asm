; Password bits divided by d0, remainder left in d0
SuperDiv:
	lda.b d0
	cmp.w #$0100
	bcs .t2
	sep #$30
	phx
	ldx.b #$0E
	lda.b #$00
	xba
	lda.l $7E3517
	sta.b $14
.loop:
	lda.l passbits,x
	sta.w WRDIVL
	lda.b $14
	sta.w WRDIVH
	lda.b d0
	sta.w WRDIVB
	nop
	nop
	nop
	nop
	nop
	nop
	xba
	clc
	adc.w RDDIVL
	sta.l passbits,x
	lda.w RDDIVH
	adc.b #$00
	xba
	lda.w RDMPYL
	sta.b $14
	dex
	bpl .loop
	lda.b $14
	sta.b d0
	plx
	rep #$30
	clc
	rtl

.t2:
	cmp.w #$0200
	bne .t1
	lda.l passbits
	and.w #$01FF
	sta.b d0
	sep #$30
	phx
	phy
	clc
	ldx.b #$0E
	lda.l $7E3517
	sta.b $14
.loopx:
	ldy.b $14
	lda.l passbits,x
	sta.b $14
	tya
	ror a
	sta.l passbits,x
	dex
	bpl .loopx
	lda.b #$00
	sta.l $7E3517
	ply
	plx
	rep #$30
	clc
	rtl

.t1:
	lda.l passbits
	and.w #$3FFF
	sta.b d0
	phx
	ldx.w #$0000
.loopxx:
	lda.l $7E3509,x
	asl a
	asl a
	xba
	sep #$20
	sta.l passbits,x
	rep #$20
	inx
	cpx.w #$000E
	bcc .loopxx
	lda.w #$0000
	sta.l $7E3517
	sta.l $7E3516
	plx
	clc
	rtl
