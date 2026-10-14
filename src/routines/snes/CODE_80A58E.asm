; Unidentified routine.
CODE_80A58E:
	lda.b $4C
	sta.b $56
	jsr.w CODE_80A568
	lda.b [$56]
	inc.b $56
	tay
	sty.b $60
	cpy.b #$D9
	bcc .t3
	cpy.b #$E7
	bne .t1
	lda.b [$56]
	and.w #$00FF
	sec
	adc.b $56
	sta.b $56
	jmp.w CODE_80A60F

.t1:
	cpy.b #$D9
	beq CODE_80A60F
	cpy.b #$DA
	beq CODE_80A60F
	cpy.b #$DB
	beq CODE_80A60F
	cpy.b #$E3
	beq CODE_80A60F
	cpy.b #$DC
	beq .1
	cpy.b #$EA
	beq .1
	cpy.b #$DD
	beq .1
	cpy.b #$DE
	beq .1
	cpy.b #$E2
	bne .t2
.1:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jmp.w CODE_80A60F

.t2:
	cpy.b #$DF
	bne .t1x
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5E
	jmp.w CODE_80A60F

.t1x:
	cpy.b #$E5
	bne CODE_80A60F
	lda.b [$56]
	inc.b $56
	inc.b $56
	sta.b $5E
	jmp.w CODE_80A60F

.t3:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jsr.w CODE_80A568
	sta.b $5E
CODE_80A60F:
	rts
