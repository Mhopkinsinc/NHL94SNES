; Unidentified routine.
CODE_9EA9AD:
	stz.w pfrev,x
CODE_9EA9B0:
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w facedir,x
	sta.b d2
	lda.b d0
	sec
	sbc.b d2
	and.w #$0007
	asl a
	sta.b d0
	tax
	lda.l DATA8_9EAAA3,x
	ldx.b a3
	cmp.w #$0000
	bne .t2
	jmp.w noturn0

.t2:
	tax
	lda.b d7
	jsl.l CODE_808F5D
	ldx.b a3
	sta.b tmp0
	lda.w Xvel,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .1
	ora.w #$FF00
.1:
	tax
	jsl.l CODE_808F7D
	sta.b d4
	ldx.b a3
	lda.w Yvel,x
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc .2
	ora.w #$FF00
.2:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d4
	sta.b d3
	lda.w #$0300
	sec
	sbc.b d3
	sta.b d4
	sec
	sbc.w #$0180
	bpl .3
	lda.w #$0180
	sta.b d4
.3:
	lda.b tmp0
	ldx.b d4
	jsl.l CODE_808FEB
	lda.b $0A
	sta.b $B7
	lda.b $08
	sta.b d4
	ldx.b a3
	lda.w pfrev,x
	beq .4
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	lda.w #$0000
	sbc.b $B7
	sta.b $B7
.4:
	lda.w facefrac,x
	clc
	adc.b d4
	sta.w facefrac,x
	lda.w facedir,x
	adc.b $B7
	and.w #$0007
	sta.w facedir,x
	sta.b d2
	lda.b d3
	cmp.w #$0015
	bcc .7
	stz.b d1
	lda.b tmp0
	bpl .5
	lda.w #$FFCE
	sta.b d1
.5:
	lda.w attribute,x
	bit.w #$0800
	beq .6
	lda.b d1
	eor.w #$FFCE
	sta.b d1
.6:
	lda.b d1
	clc
	adc.w #SPAturnr
	sta.b d1
.7:
	lda.w pf2aip,x
	bne .8
	jsl.l SetSPA
	lda.w #$0001
	sta.w pf2aip,x
.8:
	lda.b d3
	cmp.w #$0003
	bcc .t1
	jmp.w CODE_9EAB64

.t1:
	rtl
