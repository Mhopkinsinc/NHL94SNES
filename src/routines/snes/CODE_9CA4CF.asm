; Unidentified routine.
CODE_9CA4CF:
	phx
	ldx.w #$000E
.loop:
	lda.l passbits,x
	sta.b $DD,x
	lda.w #$0000
	sta.l passbits,x
	dex
	dex
	bpl .loop
	lda.b d0
	sta.b $CD
.loop2:
	lsr.b $CD
	bcc .1
	lda.l passbits
	clc
	adc.b $DD
	sta.l passbits
	lda.l $7E350A
	adc.b $DF
	sta.l $7E350A
	lda.l $7E350C
	adc.b $E1
	sta.l $7E350C
	lda.l $7E350E
	adc.b $E3
	sta.l $7E350E
	lda.l $7E3510
	adc.b $E5
	sta.l $7E3510
	lda.l $7E3512
	adc.b $E7
	sta.l $7E3512
	lda.l $7E3514
	adc.b $E9
	sta.l $7E3514
	lda.l $7E3516
	adc.b $EB
	sta.l $7E3516
.1:
	asl.b $DD
	rol.b $DF
	rol.b $E1
	rol.b $E3
	rol.b $E5
	rol.b $E7
	rol.b $E9
	rol.b $EB
	lda.b $CD
	bne .loop2
	plx
	clc
	rtl
