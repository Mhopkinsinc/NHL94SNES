; Unidentified routine.
CODE_9EE502:
	lda.w facedir,x
	sec
	sbc.w $1EAB
	beq CODE_9EE4D3
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .t1
	jsl.l RandomWord
	and.w #$0F80
	bne CODE_9EE4D3
	bra CODE_9EE528

.t1:
	jsl.l RandomWord
	and.w #$0600
	bne CODE_9EE4D3
CODE_9EE528:
	jsl.l RandomWord
	and.w #$0001
	inc a
	inc a
	sta.b d0
	ldy.w $1EA9
	bpl .1
	lda.b d0
	clc
	adc.w #$0003
	sta.b d0
.1:
	lda.b d0
	sta.w passdir
	lda.w #$0014
	sta.w passspeed
	lda.w #$0000
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pfgoal,x
	bne .t1
	lda.w #$FEF8
	sec
	sbc.w Ypos,x
	sta.b d1
	bra CODE_9EE56D

.t1:
	lda.w #$0108
	sec
	sbc.w Ypos,x
	sta.b d1
CODE_9EE56D:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1
	lda.w #$F020
	bra CODE_9EE57F

.t1:
	lda.w #$EF6E
CODE_9EE57F:
	jsl.l SetSPAFromA
	jsl.l CODE_9EA419
	lda.w #$0002
	sta.w SPAcnt,x
	jsl.l CODE_9EE220
	rtl
	rtl
