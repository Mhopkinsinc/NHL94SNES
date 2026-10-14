; Unidentified routine.
CODE_9C943E:
	phb
	phk
	plb
	stx.w $1E17
	sty.w $1E1B
	stz.b $14
	stz.b $16
	lda.b d1
	pha
	bmi .t1
	asl a
	tay
	lda.w $9649,y
	sta.b d1
	ldy.w #$0000
	bra CODE_9C9479

.t1:
	inc.b $16
	sep #$30
	lda.b $8F
	pha
	plb
	rep #$30
	lda.b (a1)
	tay
	dey
	dey
	lda.b a1
	inc a
	inc a
	sta.b d1
	lda.w #$0000
	sta.b (d1),y
	ldy.w #$0000
CODE_9C9479:
	lda.b (d1),y
	and.w #$00FF
	beq CODE_9C94D2
	cmp.w #$0020
	bne .t3
	cpy.w #$0000
	beq CODE_9C94CF
	lda.w #$0005
	bra CODE_9C94CA

.t3:
	cmp.w #$002E
	bne .t1
	lda.w #$0003
	bra CODE_9C94CA

.t1:
	cmp.w #$0040
	bne .t2
	lda.l DATA8_9C9623+$1B
	and.w #$00FF
	bra CODE_9C94CA

.t2:
	cmp.w #$0030
	bcc .t1x
	cmp.w #$003A
	bcs .t1x
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9C94C2

.t1x:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9C94C2:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9C94CA:
	clc
	adc.b $14
	sta.b $14
CODE_9C94CF:
	iny
	bra CODE_9C9479
