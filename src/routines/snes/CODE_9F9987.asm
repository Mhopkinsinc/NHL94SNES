; Unidentified routine.
CODE_9F9987:
	cpx.w #$000C
	beq CODE_9F9991
	cpx.w #$001A
	bne CODE_9F9993
CODE_9F9991:
	inc.b $A7
CODE_9F9993:
	lda.w #$000F
	sec
	sbc.b $AD
	sta.b $10
	lsr a
	clc
	adc.b $89
	sta.b $0C
	lda.b $8B
	sta.b $0E
	lda.b [$0C]
	sta.b $B1
	lda.b $AD
	lsr a
	bcc CODE_9F99B6
	lda.b $B1
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b $B1
CODE_9F99B6:
	lda.b $B1
	and.w #$000F
	sta.b $B1
	lda.b $10
	dec a
	dec a
	dec a
	cmp.w #$0006
	bcc CODE_9F99C8
	dec a
CODE_9F99C8:
	clc
	adc.b $00
	tax
	lda.l $7E35F2
	beq CODE_9F99D8
	lda.w $1A12,x
	and.w #$00FF
CODE_9F99D8:
	sta.b $16
	cmp.w #$0080
	bcc CODE_9F99E4
	lda.w #$0100
	sbc.b $16
CODE_9F99E4:
	sta.b $14
	asl a
	clc
	adc.b $14
	lsr a
	lsr a
	bit.w #$2000
	beq CODE_9F99F4
	ora.w #$C000
CODE_9F99F4:
	sta.b $14
	lda.b $16
	bit.w #$0080
	beq CODE_9F9A05
	lda.w #$0000
	sec
	sbc.b $14
	sta.b $14
CODE_9F9A05:
	lda.b $B7
	bmi CODE_9F9A3B
	ldx.b $10
	lda.l DATA8_9F9AF8,x
	and.w #$00FF
	beq CODE_9F9A33
	lda.w #$0012
	ldx.b $B1
	jsl.l CODE_808F4C
	clc
	adc.b $14
	bpl CODE_9F9A25
	lda.w #$0000
CODE_9F9A25:
	cmp.w #$0064
	bcc CODE_9F9A2D
	lda.w #$0064
CODE_9F9A2D:
	sta.b $A5
	plx
	jmp.w CODE_9F9ABD
