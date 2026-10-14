; Unidentified routine.
CODE_9DBA5E:
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
	beq .t1
	inc.w $0BE1
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$0000
	sta.w $0BD9
	lda.w #$000F
	bra CODE_9DBABA

.t1:
	lda.w #$0003
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BDF
	lda.w #$00F0
	sta.w $0BE3
	lda.w #$002D
	bra CODE_9DBABA

.t2:
	lda.w #$0001
	sta.w $0BD9
	lda.w #$00E0
	sta.w $0BE3
	lda.w #$000F
CODE_9DBABA:
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
	jsl.l CODE_9C9415
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	sta.b a1
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BE3
	jsl.l CODE_9C9415
	jsl.l SpriteFrameEnd
	rts
