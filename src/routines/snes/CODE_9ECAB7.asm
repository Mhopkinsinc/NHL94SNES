; Unidentified routine.
CODE_9ECAB7:
	lda.w #$FFFF
	sta.w $0D3F
	lda.w #$0000
	sta.b $8B
	lda.w #$0A2C
	sta.b $89
	stz.b $A9
CODE_9ECAC9:
	lda.b [$91]
	and.w #$00FF
	cmp.w #$000D
	beq CODE_9ECB1A
	inc.b $A5
CODE_9ECAD5:
	sep #$20
	lda.b [$91]
	sta.b [$89]
	rep #$30
	inc.b $89
	inc.b $A9
	lda.b [$91]
	and.w #$00FF
	cmp.w #$002C
	beq CODE_9ECAF0
	cmp.w #$002E
	bne CODE_9ECAFA
CODE_9ECAF0:
	lda.w $0D45
	clc
	adc.w #$0028
	sta.w $0D45
CODE_9ECAFA:
	lda.b [$91]
	inc.b $91
	and.w #$00FF
	cmp.w #$0020
	bne CODE_9ECAC9
	lda.b [$91]
	and.w #$00FF
	cmp.w #$0020
	beq CODE_9ECAD5
	lda.b $91
	sec
	sbc.b $8D
	sta.b $91
	sta.w $0D3F
CODE_9ECB1A:
	lda.b $A9
	inc a
	inc a
	sta.w $0A2A
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
CODE_9ECB2B:
	lda.b $A5
	sec
	sbc.w #$0014
	beq CODE_9ECB3F
	bmi CODE_9ECB3D
	bvs CODE_9ECB3F
CODE_9ECB37:
	jsl.l CODE_9ECD9D
	bra CODE_9ECB3F
