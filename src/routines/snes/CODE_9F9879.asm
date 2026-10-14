; Unidentified routine.
	asl.b d0
	lda.b a2
	beq CODE_9F9879
	lda.w #$0034
CODE_9F9879:
	adc.b d0
	tay
	lda.w tmpde,y
	sta.b $08
	lda.l $7E34C6
	cmp.w #$0002
	bne .2
.1:
	lda.w #$1000
	sta.b $08
.2:
	lda.w #$0028
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	cmp.w #$0065
	bcc .3
	lda.w #$0064
.3:
	sta.b d0
	bra .4

.t1:
	lda.b d0
	and.w #$000E
	sta.b d0
	dec.b d1
.4:
	lda.w #$0004
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF813
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	rtl
	lda.b d0
	and.w #$0001
	eor.w #$0001
	sta.b d0
	lda.w #$009F
	sta.b $8F
	lda.w #HandedTextTbl
	sta.b a1
	jml.l PrintStringFromList
