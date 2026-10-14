; d0 = the crowd meter: sroot(CwdExciteLvl * 4) + 65, at most 128; keeps CrowdPeak and the running average $19C6
UpdateCrowdMeter:
	phx
	phy
	lda.w CwdExciteLvl
	asl a
	asl a
	stz.b $A7
	sta.b d0
	jsl.l sroot
	lda.b d0
	clc
	adc.w #$0041
	cmp.w #$0080
	bcc .1
	lda.w #$0080
.1:
	sta.b d0
	cmp.w CrowdPeak
	bmi .2
	sta.w CrowdPeak
.2:
	lda.w $19CA
	clc
	adc.b d0
	sta.w $19CA
	bcc .3
	inc.w $19CC
.3:
	inc.w $19C8
	lda.w $19CC
	sta.b $0A
	lda.w $19CA
	sta.b $08
	lda.w $19C8
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $19C6
	ply
	plx
	rtl
