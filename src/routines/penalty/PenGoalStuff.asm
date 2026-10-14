; After a power play goal, let the first player whose penalty is not coincidental out of the box
PenGoalStuff:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w gsp
	cmp.w #$0003
	beq .4
	lda.w #PenBuf
	sta.b a0
.3:
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .3
	cmp.w #$0000
	bne .t1
	jmp.w .5

.t1:
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq .2
	dec.b a0
	dec.b a0
	lda.w #$0000
	sta.b d0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$FF00
	cmp.w #$0600
	bcc .1
	lda.w #$0002
	sta.b d0
.1:
	lda.b a2
	cmp.b d0
	beq .3
.2:
	dec.b a0
	dec.b a0
	lda.w #$0034
	sta.b (a0)
	inc.b a0
	inc.b a0
	bra .3
.4:
	jsl.l ClearPenaltyBuffer
.5:
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	sec
	sbc.w tmap,y
	beq .3x
	bmi .3x
	lda.b a1
	beq .1x
	lda.w #$001A
.1x:
	sta.b a0
.loop:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d2
	bit.w #$0080
	bne .3x
	lda.b a1
	beq .2x
	lda.w #$0034
.2x:
	clc
	adc.b d2
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne .loop
	lda.w #$0000
	sta.w tmpdst,y
	jsl.l RemovePlayerFromList
	ldy.b a1
	lda.w tmap,y
	inc a
	sta.w tmap,y
	ldy.b a2
	lda.w gmStatBase,y
	inc a
	sta.w gmStatBase,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w $17E0
.3x:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
