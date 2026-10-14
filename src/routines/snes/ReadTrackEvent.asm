; Read the next event of the track at $4C
ReadTrackEvent:
	lda.b $4C
	sta.b $56
	jsr.w ReadVarLen
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
	jmp.w .2

.t1:
	cpy.b #$D9
	beq .2
	cpy.b #$DA
	beq .2
	cpy.b #$DB
	beq .2
	cpy.b #$E3
	beq .2
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
	jmp.w .2

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
	jmp.w .2

.t1x:
	cpy.b #$E5
	bne .2
	lda.b [$56]
	inc.b $56
	inc.b $56
	sta.b $5E
	jmp.w .2

.t3:
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	jsr.w ReadVarLen
	sta.b $5E
.2:
	rts
