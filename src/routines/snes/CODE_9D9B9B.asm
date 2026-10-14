; Unidentified routine.
CODE_9D9B9B:
	stz.b $14
	ldy.w #$0000
CODE_9D9BA0:
	lda.b [$0C],y
	and.w #$00FF
	beq CODE_9D9BF9
	cmp.w #$0020
	bne .t3
	cpy.w #$0000
	beq CODE_9D9BF6
	lda.w #$0005
	bra CODE_9D9BF1

.t3:
	cmp.w #$002E
	bne .t1
	lda.w #$0003
	bra CODE_9D9BF1

.t1:
	cmp.w #$0040
	bne .t2
	lda.l $9C963E
	and.w #$00FF
	bra CODE_9D9BF1

.t2:
	cmp.w #$0030
	bcc .t1x
	cmp.w #$003A
	bcs .t1x
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra CODE_9D9BE9

.t1x:
	and.w #$00DF
	sec
	sbc.w #$0041
CODE_9D9BE9:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
CODE_9D9BF1:
	clc
	adc.b $14
	sta.b $14
CODE_9D9BF6:
	iny
	bra CODE_9D9BA0
