; Unidentified routine.
CODE_9D9007:
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	ldy.w #$4000
	lda.l $7E3466
	inc a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l CODE_80891F
CODE_9D9022:
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	cmp.w #$00FF
	beq CODE_9D906E
	asl a
	adc.w #$B72C
	sta.b $C5
	lda.w #$0099
	sta.b $C7
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	asl a
	tax
	lda.l DATA8_99B726+2
	tay
CODE_9D9047:
	lda.b [$C5]
	sta.l $7EA876,x
	lda.b $C5
	clc
	adc.l DATA8_99B726
	adc.l DATA8_99B726
	sta.b $C5
	txa
	adc.w #$0100
	tax
	dey
	bne CODE_9D9047
	bra CODE_9D9022
