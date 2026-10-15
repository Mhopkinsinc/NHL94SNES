; read 16 signature bits from each port; $1A00 bit 7 (port 1) or 6 (port 2) = multitap
Multi5ConnectCheck:
	php
	sep #$30
	stz.w mp5connect
.loop:
	lda.w HVBJOY
	and.b #$01
	bne .loop
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	ldx.b #$08
.loop2:
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w $0782
	lda.w JOYSER1
	lsr a
	lsr a
	rol.w $0784
	dex
	bne .loop2
	stz.w JOYSER0
	ldx.b #$08
.loop3:
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w $0781
	lda.w JOYSER1
	lsr a
	lsr a
	rol.w $0783
	dex
	bne .loop3
	lda.w $0782
	cmp.b #$FF
	bne .1
	lda.w $0781
	cmp.b #$FF
	beq .1
	lda.b #$80
	sta.w mp5connect
.1:
	lda.w $0784
	cmp.b #$FF
	bne .2
	lda.w $0783
	cmp.b #$FF
	beq .2
	lda.b #$40
	tsb.w mp5connect
.2:
	plp
	rtl
	db "MODIFIED FROM SHVC MULTI5 CONNECT CHECK VER1.00"
	db "END OF MULTI5 CONNECT CHECK"
