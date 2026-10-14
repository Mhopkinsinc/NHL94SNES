; Unidentified routine.
CODE_9DB9F7:
	stz.w $0BDD
	stz.w $0BE1
	lda.w #$0000
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	stz.w $0BDB
	rts

CODE_9DBA13:
	lda.w $0764
	cmp.w $0BDB
	bcc .rts
	lda.w $0BD9
	cmp.w #$0003
	bne .t1
.rts:
	rts

.t1:
	cmp.w #$0000
	bne .2
	lda.w $0BDF
	dec a
	dec a
	cmp.w #$00B9
	bmi .3
	dec.w $0BDF
	dec.w $0BDF
.1:
	dec.w $0BE3
	dec.w $0BE3
	lda.w #$0002
	bra .5
.2:
	cmp.w #$0001
	bne .4
	lda.w $0BE3
	dec a
	dec a
	cmp.w #$00C9
	bpl .1
.3:
	lda.w #$0002
	sta.w $0BD9
	lda.w #$0046
	bra .5
.4:
	inc.w $0BE1
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	bne .t2
	inc.w $0BDD
	lda.w $0BDD
	asl a
	tax
	lda.l CreditTitles,x
	beq .t1x
	inc.w $0BE1
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$0000
	sta.w $0BD9
	lda.w #$000F
	bra .5

.t1x:
	lda.w #$0003
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$002D
	bra .5

.t2:
	lda.w #$0001
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BE3
	lda.w #$000F
.5:
	clc
	adc.w $0764
	sta.w $0BDB
	jsl.l SpriteFrameStart
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.w #$0009
	jsr.w CODE_9DB754
	lda.w #$000A
	jsr.w CODE_9DB754
	lda.w $0BDD
	asl a
	tax
	lda.l CreditTitles,x
	sta.b a1
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BDF
	jsl.l PrintStringSprites
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	sta.b a1
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BE3
	jsl.l PrintStringSprites
	jsl.l SpriteFrameEnd
	rts
