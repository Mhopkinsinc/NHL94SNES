; Unidentified routine.
CODE_9C8FD7:
	lda.w #$2800
	sta.w $0D0D
	lda.w #$0009
	sta.w printx
	lda.w $1DB9
	sta.b d0
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9168
	sta.b a1
	lda.l OptPen
	bne CODE_9C9002
CODE_9C8FF8:
	lda.w #$009C
	sta.b $8F
	lda.w #$9258
org $9C9000
	sta.b a1
CODE_9C9002:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$2400
	sta.w $0D0D
	stz.b a2
	lda.w #$001C
	sta.w printx
	jsr.w CODE_9C902A
	lda.w #$0002
	sta.b a2
	lda.w #$0007
	sta.w printx
	jsr.w CODE_9C902A
	rts
