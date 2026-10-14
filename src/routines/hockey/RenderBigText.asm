; Draw string [$0C] in the big proportional font: letter tiles into $7E4EF4 from tile $7E3466, centred in $24 pixels from printx, with the jmlvector hook placing each letter on the map
RenderBigText:
	phb
	phk
	plb
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	jsr.w .9
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0024
	sta.b $14
	lsr a
	lsr a
	lsr a
	sta.b $16
	clc
	adc.w printx
	sta.w printx
	lda.b $16
	asl a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $14
	sta.b $14
	ldy.w #$0000
.1:
	lda.b $14
	asl a
	sta.b $02
	lda.b [$0C],y
	and.w #$00FF
	bne .t2
	lda.w #$FFFF
	sta.b $08
	jmp.w .4

.t2:
	cmp.w #$0020
	beq .2
	cmp.w #$002E
	bne .t1
	lda.w #$001A
	bra .2

.t1:
	and.w #$00DF
	sec
	sbc.w #$0041
.2:
	phy
	sta.b $08
	cmp.w #$0020
	bne .t1x
	lda.w #$0005
	bra .3

.t1x:
	lda.b $08
	asl a
	tax
	lda.l BigLetterMap+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	sta.b $06
	lda.l $7E3466
	jsr.w .10
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l BigLetterMap+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w .10
	ldx.b $08
	lda.l LetterWidths,x
	and.w #$00FF
.3:
	clc
	adc.b $14
	cmp.w #$0008
	bcc .5
.4:
	jsl.l jmlvector
	inc.w printx
	lda.b $06
	sta.b $04
	lda.l $7E3466
	inc a
	inc a
	sta.l $7E3466
	lda.b $08
	bmi .7
	cmp.w #$0020
	beq .5
	lda.b $14
	eor.w #$0007
	sta.b $16
	asl a
	sta.b $0A
	lda.l $7E3466
	jsr.w .11
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l BigLetterMap+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w .11
.5:
	ldx.b $08
	cmp.w #$0020
	bne .t1xx
	lda.w #$0005
	bra .6

.t1xx:
	lda.l LetterWidths,x
	and.w #$00FF
.6:
	clc
	adc.b $14
	and.w #$0007
	sta.b $14
	ply
	iny
	jmp.w .1
.7:
	plb
	rtl
.8:
	db $FE,$FE,$FC,$FC,$F8,$F8,$F0,$F0,$E0,$E0,$C0,$C0,$80,$80,$00,$00
	db $FF,$FF,$7F,$7F,$3F,$3F,$1F,$1F,$0F,$0F,$07,$07,$03,$03,$01,$01
.9:
	stz.b $14
	ldy.w #$0000
.1x:
	lda.b [$0C],y
	and.w #$00FF
	beq .5x
	cmp.w #$0020
	bne .t3
	cpy.w #$0000
	beq .4x
	lda.w #$0005
	bra .3x

.t3:
	cmp.w #$002E
	bne .t1xxx
	lda.w #$0003
	bra .3x

.t1xxx:
	cmp.w #$0040
	bne .t2x
	lda.l $9C963E
	and.w #$00FF
	bra .3x

.t2x:
	cmp.w #$0030
	bcc .t1xxxx
	cmp.w #$003A
	bcs .t1xxxx
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra .2x

.t1xxxx:
	and.w #$00DF
	sec
	sbc.w #$0041
.2x:
	tax
	lda.l LetterWidths,x
	and.w #$00FF
.3x:
	clc
	adc.b $14
	sta.b $14
.4x:
	iny
	bra .1x
.5x:
	lda.b $14
	rts
.10:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
.loop:
	ldy.b $04
	lda.b [$10],y
	ldy.b $14
	beq .1xx
.loop2:
	lsr a
	dey
	bne .loop2
.1xx:
	ldy.b $02
	and.w .8+16,y
	ora.l $7E4EF4,x
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne .loop
	rts
.11:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
.loopx:
	ldy.b $04
	lda.b [$10],y
	ldy.b $16
	iny
.loop2x:
	asl a
	dey
	bne .loop2x
	ldy.b $0A
	and.w .8,y
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne .loopx
	rts
; jmlvector letter hook of PlayoffScreen: put letter tile $7E3466 (two rows) at printx / printy of the $7EC67C map
BigLetterPlayoff:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w $0D0D
	sta.l $7EC67C,x
	inc a
	sta.l $7EC77C,x
	rtl
; jmlvector letter hook of DrawSelectTeam: put letter tile $7E3466 (two rows) at printx / printy of the $7EA67C map
BigLetterSelect:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	tax
	lda.l $7E3466
	ora.w #$2000
	ora.w #$0400
	sta.l $7EA67C,x
	inc a
	sta.l $7EA6BC,x
	rtl
