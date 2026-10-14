; NMI: send the sprite table to OAM when it is ready and there is time
NMI_SendOAM:
	stx.b $3A
	rep #$20
	lda.b $3E
	cmp.w #$026E
	bcc NMI_Tick
	sep #$20
	lda.w OAMReady
	beq NMI_Tick
	stz.w OAMReady
	lda.b #$7E
	sta.w A1B0
	rep #$20
	lda.w #DMA_OAM
	sta.w DMAP0
	lda.w OAMShowBuf
	sta.w A1T0L
	lda.w #$0220
	sta.w DAS0L
	stz.w OAMADDL
	sep #$20
	lda.b #$01
	sta.w MDMAEN
NMI_Tick:
	rep #$30
	lda.l $7E35D8
	clc
	adc.l $7E35DA
	sta.l $7E35D8
	lda.b $83
	adc.w #$0001
	sta.b $83
	bcc .2
.1:
	inc.b $85
.2:
	lda.w fadestep
	beq CODE_80843E
	bmi CODE_80841F
	cmp.w #$0001
	bne .t1
	lda.w brightness
	cmp.w #$000F
	bcs CODE_808435
	lda.w STAT77
	bmi CODE_80843E
	inc.w brightness
	bra CODE_80843E

.t1:
	dec.w fadestep
	bra CODE_80843E
