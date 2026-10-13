; Unidentified routine.
CODE_9DC0EE:
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DCCBA
	lda.w #$0001
	sta.l $7E3464
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6E0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	ldy.b $91
	lda.w HomeTeam,y
	sta.b $A9
	jsl.l CODE_9FBE08
	lda.w #$0000
	sta.l $7E3464
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$0004
	clc
	adc.b [$8D],y
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	clc
	adc.b [$8D]
	sta.b $8D
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$0007
	sta.w printy
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	lda.w #$0009
	sta.w printy
	jsl.l CODE_9EC7BE
	lda.w #$0060
	sta.w printy
	ldx.w #$0080
	ldy.w #$0004
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$0008
	sta.w printy
	ldx.w #$0040
	ldy.w #$0003
	jsl.l CODE_9DC2B8
	ldx.w #$00C0
	ldy.w #$0005
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$000E
	sta.w printy
	ldx.w #$0058
	ldy.w #$0001
	jsl.l CODE_9DC2B8
	ldx.w #$00A8
	ldy.w #$0002
	jsl.l CODE_9DC2B8
	lda.w printy
	clc
	adc.w #$000E
	sta.w printy
	ldx.w #$0080
	ldy.w #$0000
	jsl.l CODE_9DC2B8
	ldx.w #$0066
	ldy.w #$0098
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF6E5
	sta.b $8D
	jsl.l CODE_9C9590
	jsl.l CODE_9D87B5
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	ldx.w #$0070
	ldy.w #$00A2
	jsl.l CODE_9C9590
CODE_9DC208:
	lda.w $1DB9
	beq CODE_9DC27C
	lda.w $1D9B
	ldx.w #$000D
	ldy.w #$0004
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.l $7E3470
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2000
	tay
	ldx.w #$0600
	jsl.l WaitFrame
	jsl.l CODE_80891F
	lda.w #$007F
	sta.b $0E
	lda.l $7E3472
	sta.b $0C
	lda.l $7E35D2
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$2300
	tay
	ldx.w #$0600
	jsl.l CODE_80891F
	jsl.l CODE_9DD923
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #$0400
	sta.w $079C
	ldx.w #$000C
	ldy.w #$0004
	jsl.l CODE_808ADF
	bra CODE_9DC280
