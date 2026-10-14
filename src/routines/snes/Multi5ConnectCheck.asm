; Unidentified routine.
Multi5ConnectCheck:	; read 16 signature bits from each port; $1A00 bit 7 (port 1) or 6 (port 2) = multitap
	php
	sep #$30
	stz.w $1A00
CODE_9B83C4:
	lda.w HVBJOY
	and.b #$01
	bne CODE_9B83C4
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	ldx.b #$08
CODE_9B83D5:
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w $0782
	lda.w JOYSER1
	lsr a
	lsr a
	rol.w $0784
	dex
	bne CODE_9B83D5
	stz.w JOYSER0
	ldx.b #$08
CODE_9B83ED:
	lda.w JOYSER0
	lsr a
	lsr a
	rol.w $0781
	lda.w JOYSER1
	lsr a
	lsr a
	rol.w $0783
	dex
	bne CODE_9B83ED
	lda.w $0782
	cmp.b #$FF
	bne CODE_9B8413
	lda.w $0781
	cmp.b #$FF
	beq CODE_9B8413
	lda.b #$80
	sta.w $1A00
CODE_9B8413:
	lda.w $0784
	cmp.b #$FF
	bne CODE_9B8426
	lda.w $0783
	cmp.b #$FF
	beq CODE_9B8426
	lda.b #$40
	tsb.w $1A00
CODE_9B8426:
	plp
	rtl
	db "MODIFIED FROM SHVC MULTI5 CONNECT CHECK VER1.00"
	db "END OF MULTI5 CONNECT CHECK"
