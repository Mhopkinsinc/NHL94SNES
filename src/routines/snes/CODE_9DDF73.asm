; Unidentified routine.
CODE_9DDF73:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AE9F0
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$7780
	sta.b $10
	jsl.l Decompress
	lda.l $7F7780
	asl a
	sta.b $14
	lda.l $7F7782
	tax
	lda.b $10
	clc
	adc.w #$0006
	sta.b $10
.loop:
	ldy.b $14
	dey
	dey
.loop2:
	lda.b [$10],y
	clc
	adc.l $7E35AC
	clc
	adc.w #$0C00
	sta.b [$10],y
	dey
	dey
	bpl .loop2
	lda.b $10
	clc
	adc.b $14
	sta.b $10
	dex
	bne .loop
	rtl
