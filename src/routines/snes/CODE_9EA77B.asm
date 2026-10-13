; Unidentified routine.
CODE_9EA77B:
	lda.b $AD
	ldy.w $0D07
	bmi CODE_9EA786
	sec
	sbc.w $12E3,x
CODE_9EA786:
	clc
	adc.w #$0008
	sta.b $AD
CODE_9EA78C:
	lda.b $AD
	pha
	ldx.b $A5
	jsl.l CODE_808F5D
	tax
	lda.b $C1
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EC3,x
	sta.b $A5
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7B1
	ora.w #$FF00
CODE_9EA7B1:
	tax
	jsl.l CODE_808F7D
	sta.b $B1
	pla
	ldx.b $A9
	jsl.l CODE_808F5D
	tax
	lda.b $C1
	jsl.l CODE_808FC9
	ldx.b $E4
	lda.b $08
	adc.w $0EE3,x
	sta.b $A9
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9EA7DB
	ora.w #$FF00
CODE_9EA7DB:
	tax
	jsl.l CODE_808F7D
	clc
	adc.b $B1
	sta.b $B1
	lda.b $A9
	pha
	lda.b $A5
	pha
	ldx.b $E4
	jsl.l CODE_9FDCB2
	lda.w $1303,x
	pha
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9EA803
	lda.w #$1000
	sta.b $A5
CODE_9EA803:
	lda.b $A5
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
	sta.b $AD
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
	sta.b $A5
	pla
	sta.b $A9
	lda.b $AF
	cmp.b $B1
	bcc CODE_9EA85B
	lda.b $A5
	sta.w $0EC3,x
	lda.b $A9
	sta.w $0EE3,x
CODE_9EA85B:
	lda.l $7E34C6
	beq CODE_9EA888
	lda.w $0792
	and.w #$003F
	bne CODE_9EA888
	jsl.l CODE_9FDCB2
	lda.b $A5
	sec
	sbc.w #$0021
	sta.b $A5
	cmp.w #$0C00
	bmi CODE_9EA884
	lda.w $1423,x
	sta.b $AD
	clc
	adc.b $A5
	sta.b $A5
CODE_9EA884:
	jml.l setpde
