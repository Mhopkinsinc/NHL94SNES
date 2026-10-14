; Unidentified routine.
CODE_9D9B9B:
	stz.b $14
	ldy.w #$0000
.1:
	lda.b [$0C],y
	and.w #$00FF
	beq .5
	cmp.w #$0020
	bne .t3
	cpy.w #$0000
	beq .4
	lda.w #$0005
	bra .3

.t3:
	cmp.w #$002E
	bne .t1
	lda.w #$0003
	bra .3

.t1:
	cmp.w #$0040
	bne .t2
	lda.l $9C963E
	and.w #$00FF
	bra .3

.t2:
	cmp.w #$0030
	bcc .t1x
	cmp.w #$003A
	bcs .t1x
	sec
	sbc.w #$0030
	clc
	adc.w #$001C
	bra .2

.t1x:
	and.w #$00DF
	sec
	sbc.w #$0041
.2:
	tax
	lda.l DATA8_9C9623,x
	and.w #$00FF
.3:
	clc
	adc.b $14
	sta.b $14
.4:
	iny
	bra .1
.5:
	lda.b $14
	rts
