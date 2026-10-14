; LZ data at [$0C] (after its header) to WRAM
DecompressLZ:
	lda.b $10
	sta.b $6F
	lda.b $12
	sta.b $6D
	stz.b $71
	stz.b $73
	stz.b $75
	stz.b $77
	sep #$20
	ldy.w #$0005
.2:
	lda.b [$0C],y
	iny
	sta.b $71
	and.b #$80
	beq .t1
	jmp.w .t3

.t1:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b $71
	rep #$20
	and.w #$0003
	beq .1
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loop:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loop
.1:
	rep #$20
	lda.b $71
	and.w #$0060
	asl a
	asl a
	asl a
	clc
	adc.b $73
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$001C
	lsr a
	lsr a
	clc
	adc.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	sty.b $79
	ldy.w #$0000
	sep #$20
.loop2:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne .loop2
	ldy.b $79
	jmp.w .2

.t3:
	lda.b $71
	and.b #$40
	beq .t1x
	jmp.w .t2

.t1x:
	lda.b [$0C],y
	iny
	sta.b $73
	lda.b [$0C],y
	iny
	sta.b $75
	rep #$20
	lda.b $73
	asl a
	asl a
	xba
	and.w #$0003
	beq .1x
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loopx:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loopx
.1x:
	rep #$20
	lda.b $73
	and.w #$003F
	xba
	clc
	adc.b $75
	sta.b $7B
	lda.b $6F
	clc
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$003F
	clc
	adc.w #$0004
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
.loop2x:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne .loop2x
	ldy.b $79
	jmp.w .2

.t2:
	lda.b $71
	and.b #$20
	beq .t1xx
	jmp.w .4

.t1xx:
	lda.b $71
	rep #$20
	and.w #$0003
	tax
	clc
	adc.b $6F
	sta.b $6F
	lda.b [$0C],y
	xba
	sta.b $7B
	iny
	iny
	sep #$20
	lda.b [$0C],y
	iny
	sta.b $77
	txa
	beq .1xx
.loopxx:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loopxx
.1xx:
	rep #$20
	clc
	lda.b $6F
	sbc.b $7B
	sta.b $6B
	lda.b $71
	and.w #$000C
	lsr a
	lsr a
	xba
	clc
	adc.b $77
	adc.w #$0005
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
	sty.b $79
	ldy.w #$0000
.3:
	lda.b [$6B],y
	iny
	sta.w WMDATA
	dex
	bne .3
	ldy.b $79
	jmp.w .2
.4:
	lda.b $71
	and.b #$1F
	asl a
	asl a
	adc.b #$04
	cmp.b #$71
	bcs .t1xxx
	rep #$20
	and.w #$00FF
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loopxxx:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loopxxx
	jmp.w .2

.t1xxx:
	lda.b $71
	rep #$20
	and.w #$0003
	beq .1xxx
	tax
	clc
	adc.b $6F
	sta.b $6F
	sep #$20
.loopxxxx:
	lda.b [$0C],y
	iny
	sta.w WMDATA
	dex
	bne .loopxxxx
.1xxx:
	rep #$20
	rts
