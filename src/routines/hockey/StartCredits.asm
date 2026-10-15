; Title: reset the credits state (entry $0BDD, step $0BD9, the two text y positions $0BDF / $0BE3)
StartCredits:
	stz.w CreditTitleIdx
	stz.w CreditNameIdx
	lda.w #$0000
	sta.w CreditStep
	lda.w #$00E0
	sta.w CreditTitleY
	lda.w #$00F0
	sta.w CreditNameY
	stz.w CreditTime
	rts

RollCredits:
	lda.w $0764
	cmp.w CreditTime
	bcc .rts
	lda.w CreditStep
	cmp.w #$0003
	bne .t1
.rts:
	rts

.t1:
	cmp.w #$0000
	bne .2
	lda.w CreditTitleY
	dec a
	dec a
	cmp.w #$00B9
	bmi .3
	dec.w CreditTitleY
	dec.w CreditTitleY
.1:
	dec.w CreditNameY
	dec.w CreditNameY
	lda.w #$0002
	bra .5
.2:
	cmp.w #$0001
	bne .4
	lda.w CreditNameY
	dec a
	dec a
	cmp.w #$00C9
	bpl .1
.3:
	lda.w #$0002
	sta.w CreditStep
	lda.w #$0046
	bra .5
.4:
	inc.w CreditNameIdx
	lda.w CreditNameIdx
	asl a
	tax
	lda.l CreditNames,x
	bne .t2
	inc.w CreditTitleIdx
	lda.w CreditTitleIdx
	asl a
	tax
	lda.l CreditTitles,x
	beq .t1x
	inc.w CreditNameIdx
	lda.w #$00E0
	sta.w CreditTitleY
	lda.w #$00F0
	sta.w CreditNameY
	lda.w #$0000
	sta.w CreditStep
	lda.w #$000F
	bra .5

.t1x:
	lda.w #$0003
	sta.w CreditStep
	lda.w #$00E0
	sta.w CreditTitleY
	lda.w #$00F0
	sta.w CreditNameY
	lda.w #$002D
	bra .5

.t2:
	lda.w #$0001
	sta.w CreditStep
	lda.w #$00E0
	sta.w CreditNameY
	lda.w #$000F
.5:
	clc
	adc.w $0764
	sta.w CreditTime
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w DrawTitleSprite
	lda.w #$000A
	jsr.w DrawTitleSprite
	lda.w CreditTitleIdx
	asl a
	tax
	lda.l CreditTitles,x
	sta.b a1
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w CreditTitleY
	jsl.l PrintStringSprites
	lda.w CreditNameIdx
	asl a
	tax
	lda.l CreditNames,x
	sta.b a1
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w CreditNameY
	jsl.l PrintStringSprites
	jsl.l SpriteFrameEnd
	rts
