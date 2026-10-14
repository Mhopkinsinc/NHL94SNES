; Unidentified routine.
CODE_9DBAAB:
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
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BDF
	jsl.l CODE_9C9415
	lda.w $0BE1
	asl a
	tax
	lda.l CreditNames,x
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	ldx.w #$0080
	ldy.w $0BE3
	jsl.l CODE_9C9415
	jsl.l SpriteFrameEnd
	rts
