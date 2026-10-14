; Unidentified routine.
CODE_9B9F7A:
	lda.b $81
	beq .t1
	cmp.w #$003C
	bcc .1
	lda.w #$003C
.1:
	sec
	sbc.b d7
	bpl .2
	lda.w #$0000
.2:
	sta.b $81
	rtl

.t1:
	lda.l $7E35E0
	cmp.w #$0480
	bcc .1x
	lda.w #$0480
.1x:
	sec
	sbc.w $0CDD
	sta.l $7E35E0
	bpl .rtl
	lda.w #$0000
	sta.l $7E35E0
.rtl:
	rtl
