; password bits *= d0
SuperMult:
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
	sta.b tmp4
.loop2:
	lsr.b tmp4
	bcc .1
	lda.l passbits
	clc
	adc.b $DD
	sta.l passbits
	lda.l passbits+2
	adc.b $DF
	sta.l passbits+2
	lda.l passbits+4
	adc.b $E1
	sta.l passbits+4
	lda.l passbits+6
	adc.b $E3
	sta.l passbits+6
	lda.l passbits+8
	adc.b $E5
	sta.l passbits+8
	lda.l passbits+$A
	adc.b $E7
	sta.l passbits+$A
	lda.l passbits+$C
	adc.b $E9
	sta.l passbits+$C
	lda.l passbits+$E
	adc.b $EB
	sta.l passbits+$E
.1:
	asl.b $DD
	rol.b $DF
	rol.b $E1
	rol.b $E3
	rol.b $E5
	rol.b $E7
	rol.b $E9
	rol.b $EB
	lda.b tmp4
	bne .loop2
	plx
	clc
	rtl
