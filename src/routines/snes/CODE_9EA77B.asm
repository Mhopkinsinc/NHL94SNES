; Unidentified routine.
CODE_9EA77B:
	lda.b d2
	ldy.w $0D07
	bmi CODE_9EA786
	sec
	sbc.w $12E3,x
CODE_9EA786:
	clc
	adc.w #$0008
	sta.b d2
CODE_9EA78C:
	lda.b d2
	pha
	ldx.b d0
	jsl.l CODE_808F5D
	tax
	lda.b d7
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EC3,x
	sta.b d0
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7B1
	ora.w #$FF00
CODE_9EA7B1:
	tax
	jsl.l CODE_808F7D
	sta.b d3
	pla
	ldx.b d1
	jsl.l CODE_808F5D
	tax
	lda.b d7
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EE3,x
	sta.b d1
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7DB
	ora.w #$FF00
CODE_9EA7DB:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b d3
	sta.b d3
	lda.b d1
	pha
	lda.b d0
	pha
	ldx.b $E4
	jsl.l CODE_9FDCB2
	lda.w $1303,x
	pha
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9EA803
	lda.w #$1000
	sta.b d0
CODE_9EA803:
	lda.b d0
	lsr a
	clc
	adc.w #$0800
	tax
	pla
	asl a
	asl a
	asl a
	asl a
	jsl.l CODE_808F98
	lda.b $0A
	asl a
	asl a
	tax
	lda.l DATA8_80D9C6,x
	sta.b d2
	lda.l DATA8_80D9C6+2,x
	sta.b $AF
	ldx.b $E4
	lda.w position,x
	bne CODE_9EA845
	lda.w $19D4,x
	bmi CODE_9EA845
	lda.w $0B05,x
	bit.w #$0004
	bne CODE_9EA845
	lda.b $AF
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	adc.b $AF
	sta.b $AF
CODE_9EA845:
	pla
	sta.b d0
	pla
	sta.b d1
	lda.b $AF
	cmp.b d3
	bcc CODE_9EA85B
	lda.b d0
	sta.w $0EC3,x
	lda.b d1
	sta.w $0EE3,x
CODE_9EA85B:
	lda.l $7E34C6
	beq CODE_9EA888
	lda.w $0792
	and.w #$003F
	bne CODE_9EA888
	jsl.l CODE_9FDCB2
	lda.b d0
	sec
	sbc.w #$0021
	sta.b d0
	cmp.w #$0C00
	bmi CODE_9EA884
	lda.w $1423,x
	sta.b d2
	clc
	adc.b d0
	sta.b d0
CODE_9EA884:
	jml.l setpde
