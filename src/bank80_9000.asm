; Bank $80, second 4 KB: the math library, the sine table, the sound driver commands and the heap.
; The multiplies and divides work in direct page $00-$0B (products in $08-$0B, divisor in $04, quotient in $00) with the
; CPU multiplier and divider; the fraction multiplies use the mode 7 multiplier unless a flag asks for the slow loop. Sin and
; Cos read a quarter-wave table. The sound commands talk to the sound driver through APUIO0-APUIO3: each waits for APUIO0
; to read 0, writes its arguments and command number, waits for the echo and clears APUIO0. They also copy blocks to and
; from sound RAM and stream a long upload one block per call. The heap hands out movable blocks in banks $7E and $7F
; through a table of handles.

org $809002

; Multiplies. X is the 16-bit operand of the 16 x 8 forms.
Mul16x8HiU_Pre:		; A * Y (low byte) / 256 into A and $09, unsigned, no zero test
	phy
	bra Mul16x8HiU_Go
Mul16x8HiU:		; X * A (low byte) / 256 into A and $09, unsigned
	phy
	tay
	beq Mul16x8Hi_Zero
	txa
	beq Mul16x8Hi_Zero
Mul16x8HiU_Go:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $0A
	xba
	sta.w WRMPYA
	lda.w RDMPYH
	sta.b $09
	sty.w WRMPYB
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	ply
	rtl
Mul16x8Hi_Zero:
	stz.b $09
	ply
	rtl
Mul16x8HiXS:		; X * A (low byte) / 256 into A and $09, X signed
	phy
	tay
	beq Mul16x8Hi_Zero
Mul16x8HiXS_TestX:
	txa
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiU_Go
	eor.w #$FFFF
	inc a
Mul16x8HiXS_Neg:
	jsl.l Mul16x8HiU_Pre
	eor.w #$FFFF
	inc a
	sta.b $09
	ply
	rtl
Mul16x8HiS:		; X * A / 256 into A and $09, both signed
	phy
	tay
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiXS_TestX
	eor.w #$FFFF
	inc a
	tay
	txa
	beq Mul16x8Hi_Zero
	bpl Mul16x8HiXS_Neg
	eor.w #$FFFF
	inc a
	jmp.w Mul16x8HiU_Go
Mul16S:		; A * X into $08-$0B, both signed
	phy
	tay
	beq Mul16_Zero
	bpl Mul16XS_TestX
	eor.w #$FFFF
	inc a
	tay
	sta.b $00
	txa
	beq Mul16_Zero
	bpl Mul16XS_Neg
	eor.w #$FFFF
	inc a
	bra Mul16U_Go
Mul16_Zero:
	stz.b $08
	stz.b $0A
	ply
	rtl
Mul16XS:		; A * X into $08-$0B, X signed
	phy
	tay
	beq Mul16_Zero
Mul16XS_TestX:
	sta.b $00
	txa
	beq Mul16_Zero
	bpl Mul16U_Go
	eor.w #$FFFF
	inc a
Mul16XS_Neg:
	jsl.l Mul16U_Pre
	jmp.w CODE_808FDA
Mul16U_Pre:		; A * Y into $08-$0B, unsigned, Y also in $00, no zero test
	phy
	bra Mul16U_Go
Mul16U:		; A * X into $08-$0B, unsigned
	phy
	tay
	beq Mul16_Zero
	sta.b $00
	txa
	beq Mul16_Zero
Mul16U_Go:
	sep #$20
	sta.w WRMPYA
	sty.w WRMPYB
	stz.b $08
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $04
	sty.w WRMPYB
	stz.b $0B
	ldy.b $01
	ldx.w RDMPYL
	stx.b $09
	sty.w WRMPYB
	xba
	sta.w WRMPYA
	ldx.w RDMPYL
	stx.b $06
	sty.w WRMPYB
	rep #$20
	lda.b $09
	clc
	adc.w RDMPYL
	sta.b $09
	bcc .nocarry
	inc.b $0B
.nocarry:
	lda.b $04
	clc
	adc.b $08
	sta.b $08
	lda.b $06
	adc.b $0A
	sta.b $0A
	ply
	rtl
MulFrac8:		; A * B (high byte of C) / 128 into A (8-bit); bit 6 of $07E2 set: shift-and-add loop instead of the mode 7 multiplier
	bit.w $07E2
	bvc .hw
	rep #$20
	asl a
	sta.b $40
	lsr a
	and.w #$00FF
	sta.b $3E
	lda.w #$0000
	asl.b $40
	bcc .0
	adc.b $3E
.0:
	asl a
	asl.b $40
	bcc .1
	adc.b $3E
.1:
	asl a
	asl.b $40
	bcc .2
	adc.b $3E
.2:
	asl a
	asl.b $40
	bcc .3
	adc.b $3E
.3:
	asl a
	asl.b $40
	bcc .4
	adc.b $3E
.4:
	asl a
	asl.b $40
	bcc .5
	adc.b $3E
.5:
	asl a
	asl.b $40
	bcc .6
	adc.b $3E
.6:
	asl a
	xba
	sep #$20
	rts
.hw:
	asl a
	sta.w M7A
	stz.w M7A
	xba
	sta.w M7B
	lda.w MPYM
	rts
MulFrac16:		; A * Y / 128 into A and $43; bit 6 of $07E2 set: shift-and-add loop instead of the mode 7 multiplier
	bit.w $07E1
	bvc .hw
	cpy.b #$00
	beq .zero
	cmp.w #$0000
	bne .soft
.zero:
	lda.w #$0000
	rts
.soft:
	sty.b $46
	sta.b $3E
	stz.b $40
	stz.b $42
	stz.b $44
	ldy.b #$07
.loop:
	asl.b $3E
	rol.b $40
	lda.b $46
	beq .done
	lsr a
	sta.b $46
	bcc .next
	lda.b $42
	clc
	adc.b $3E
	sta.b $42
	lda.b $44
	adc.b $40
	sta.b $44
.next:
	dey
	bne .loop
.done:
	lda.b $43
	rts
.hw:
	sep #$20
	sta.w M7A
	xba
	sta.w M7A
	sty.w M7B
	rep #$20
	lda.w MPYM
	asl a
	sta.b $43
	rts

; Divides.
Div16S:		; $08 / $04 into $00, signed
	lda.b $04
	bmi .divneg
	lda.b $08
	bmi .dividendneg
	jmp.w Div16U
.divneg:
	eor.w #$FFFF
	inc a
	sta.b $04
	lda.b $08
	bpl .negate
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	jmp.w Div16U
.dividendneg:
	eor.w #$FFFF
	inc a
	sta.b $08
.negate:
	jsl.l Div16U
	lda.w #$0000
	sec
	sbc.b $00
	sta.b $00
	rtl
Div32x32U:		; $08-$0B / $04-$07 into $00-$03, remainder in $08-$0B, unsigned
	phx
	phy
	stz.b $00
	stz.b $02
	ldy.w #$0000
	lda.b $06
	bmi .loop
.norm:
	iny
	asl.b $04
	rol.b $06
	bpl .norm
.loop:
	lda.b $08
	sec
	sbc.b $04
	tax
	lda.b $0A
	sbc.b $06
	bcc .bit
	stx.b $08
	sta.b $0A
.bit:
	rol.b $00
	rol.b $02
	lsr.b $06
	ror.b $04
	dey
	bpl .loop
	ply
	plx
	rtl
Div32S:		; $08-$0B / $04 into $00, signed; $7FFF when the quotient does not fit
	lda.b $04
	bmi .divneg
	lda.b $0A
	bmi .dividendneg
	jmp.w Div32U
.divneg:
	eor.w #$FFFF
	inc a
	sta.b $04
	lda.b $0A
	bpl .negate
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
	jmp.w Div32U
.dividendneg:
	lda.w #$0000
	sec
	sbc.b $08
	sta.b $08
	lda.w #$0000
	sbc.b $0A
	sta.b $0A
.negate:
	jsl.l Div32U
	lda.w #$0000
	sec
	sbc.b $00
	sta.b $00
	rtl
Div32U:		; $08-$0B / $04 into $00, unsigned; $7FFF when the quotient does not fit
	sep #$20
	lda.b $0B
	beq .hi0
	cmp.b $05
	bcc .go
	jmp.w Div_Overflow
.go:
	rep #$20
	lda.b $0A
	ldx.w #$0010
.loop:
	asl.b $08
	rol a
	bcs .sub
	cmp.b $04
	bcc .bit
.sub:
	sbc.b $04
	sec
.bit:
	rol.b $00
	dex
	bne .loop
	rtl
	sep #$20		; not reached
.hi0:
	lda.b $05
	beq Div32U_ByteDivisor
	lda.b $0A
	beq Div16U_Go
	cmp.b $05
	bcc Div_8Bits
	rep #$20
	lda.b $0A
	and.w #$00FF
	ldx.w #$0010
.loop2:
	asl.b $08
	rol a
	bcs .sub2
	cmp.b $04
	bcc .bit2
.sub2:
	sbc.b $04
	sec
.bit2:
	rol.b $00
	dex
	bne .loop2
	rtl
Div_8Bits:		; $09-$0A:$08 / $04 when the quotient fits in 8 bits
	stz.b $00
	rep #$20
	lda.b $09
	ldx.w #$0008
.loop:
	asl.b $07
	rol a
	bcs .sub
	cmp.b $04
	bcc .bit
.sub:
	sbc.b $04
	sec
.bit:
	rol.b $00
	dex
	bne .loop
	rtl
Div16U:		; $08 / $04 into $00, unsigned
	sep #$20
Div16U_Go:
	lda.b $05
	beq Div16x8U_Go
	stz.b $0A
	lda.b $09
	cmp.b $05
	bcs Div_8Bits
	rep #$20
	stz.b $00
	rtl
Div_Overflow:		; quotient $7FFF
	rep #$20
	lda.w #$7FFF
	sta.b $00
	rtl
	sep #$20		; not reached
Div32U_ByteDivisor:		; $08-$0A / $04 (8-bit) with the hardware divider, high byte first
	lda.b $0A
	beq Div16x8U_Go
	cmp.b $04
	bcs Div_Overflow
	ldx.b $09
	lda.b $04
	stx.w WRDIVL
	sta.w WRDIVB
	phx
	plx
	nop
	nop
	lda.w RDDIVL
	sta.b $01
	lda.w RDMPYL
	sta.b $09
	lda.b $04
	ldx.b $08
	stx.w WRDIVL
	sta.w WRDIVB
	phx
	plx
	nop
	nop
	lda.w RDDIVL
	sta.b $00
	rep #$20
	rtl
Div16x8U:		; $08 / $04 (8-bit) into $00 with the hardware divider; $7FFF when $04 is 0
	sep #$20
Div16x8U_Go:
	lda.b $04
	beq Div_Overflow
	ldx.b $08
	stx.w WRDIVL
	sta.w WRDIVB
	rep #$20
	phx
	plx
	nop
	lda.w RDDIVL
	sta.b $00
	rtl
DivX8U:		; X / A (8-bit) into A with the hardware divider
	sep #$20
	stx.w WRDIVL
	sta.w WRDIVB
	rep #$20
	phx
	plx
	nop
	lda.w RDDIVL
	rtl
DivX8S:		; X / A (8-bit) into A, X signed
	cpx.w #$0000
	bpl DivX8U
	phy
	tay
	txa
	eor.w #$FFFF
	inc a
	sta.w WRDIVL
	sep #$10
	sty.w WRDIVB
	rep #$10
	ply
	nop
	lda.w #$0000
	sec
	sbc.w RDDIVL
	rtl

SineTable:		; sin of 0 to a quarter circle in 256 steps, $0100 = 1
	dw $0000,$0002,$0003,$0005,$0006,$0008,$0009,$000B,$000D,$000E,$0010,$0011,$0013,$0014,$0016,$0018
	dw $0019,$001B,$001C,$001E,$001F,$0021,$0022,$0024,$0026,$0027,$0029,$002A,$002C,$002D,$002F,$0030
	dw $0032,$0033,$0035,$0037,$0038,$003A,$003B,$003D,$003E,$0040,$0041,$0043,$0044,$0046,$0047,$0049
	dw $004A,$004C,$004D,$004F,$0050,$0052,$0053,$0055,$0056,$0058,$0059,$005B,$005C,$005E,$005F,$0061
	dw $0062,$0063,$0065,$0066,$0068,$0069,$006B,$006C,$006D,$006F,$0070,$0072,$0073,$0075,$0076,$0077
	dw $0079,$007A,$007B,$007D,$007E,$0080,$0081,$0082,$0084,$0085,$0086,$0088,$0089,$008A,$008C,$008D
	dw $008E,$0090,$0091,$0092,$0093,$0095,$0096,$0097,$0098,$009A,$009B,$009C,$009D,$009F,$00A0,$00A1
	dw $00A2,$00A4,$00A5,$00A6,$00A7,$00A8,$00AA,$00AB,$00AC,$00AD,$00AE,$00AF,$00B1,$00B2,$00B3,$00B4
	dw $00B5,$00B6,$00B7,$00B8,$00B9,$00BA,$00BC,$00BD,$00BE,$00BF,$00C0,$00C1,$00C2,$00C3,$00C4,$00C5
	dw $00C6,$00C7,$00C8,$00C9,$00CA,$00CB,$00CC,$00CD,$00CE,$00CF,$00CF,$00D0,$00D1,$00D2,$00D3,$00D4
	dw $00D5,$00D6,$00D7,$00D7,$00D8,$00D9,$00DA,$00DB,$00DC,$00DC,$00DD,$00DE,$00DF,$00E0,$00E0,$00E1
	dw $00E2,$00E3,$00E3,$00E4,$00E5,$00E5,$00E6,$00E7,$00E7,$00E8,$00E9,$00E9,$00EA,$00EB,$00EB,$00EC
	dw $00ED,$00ED,$00EE,$00EE,$00EF,$00EF,$00F0,$00F1,$00F1,$00F2,$00F2,$00F3,$00F3,$00F4,$00F4,$00F5
	dw $00F5,$00F5,$00F6,$00F6,$00F7,$00F7,$00F8,$00F8,$00F8,$00F9,$00F9,$00F9,$00FA,$00FA,$00FA,$00FB
	dw $00FB,$00FB,$00FC,$00FC,$00FC,$00FC,$00FD,$00FD,$00FD,$00FD,$00FE,$00FE,$00FE,$00FE,$00FE,$00FF
	dw $00FF,$00FF,$00FF,$00FF,$00FF,$00FF,$0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100,$0100
	dw $0100
Cos:		; cos A into A; 1024 steps a circle, $0100 = 1
	clc
	adc.w #$0100
Sin:		; sin A into A; 1024 steps a circle, $0100 = 1
	phx
	and.w #$03FF
	cmp.w #$0200
	bcc .pos
	sbc.w #$0200
	cmp.w #$0100
	bcc .neg
	eor.w #$FFFF
	adc.w #$0200
.neg:
	asl a
	tax
	lda.w #$0000
	sec
	sbc.l SineTable,x
	plx
	rtl
.pos:
	cmp.w #$0100
	bcc .look
	eor.w #$FFFF
	adc.w #$0200
.look:
	asl a
	tax
	lda.l SineTable,x
	plx
	rtl

SPCCmd01:		; sound driver command $01
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$01
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
SPCCmd02:		; sound driver command $02; returns its answers in A (a byte) and X
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$02
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.w APUIO1
	tay
	lda.b #$80
	sta.w APUIO0
.ack2:
	cmp.w APUIO0
	bne .ack2
	ldx.w APUIO1
	stz.w APUIO0
	rep #$20
	tya
	and.w #$00FF
	rtl
SPCUpload:		; sound driver command $03: X bytes from [$0C] to sound RAM address Y
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$03
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
	ldy.w #$0000
.loop:
	lda.b [$0C],y
	sta.w APUIO2
	iny
	tya
	sta.w APUIO1
.ackbyte:
	cmp.w APUIO1
	bne .ackbyte
	nop
	nop
	nop
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	rtl
SPCCmd04:		; sound driver command $04
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$04
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
SPCCmd05:		; sound driver command $05, X in APUIO1
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$05
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd06:		; sound driver command $06, Y in APUIO2-APUIO3, X in APUIO1
	sty.w APUIO2
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$06
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd07:		; sound driver command $07, X and 5 bytes from [$0C]
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	ldy.b #$00
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	iny
	lda.b #$07
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	ldx.b #$81
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd08:		; sound driver command $08, 5 bytes from [$0C]
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	ldy.b #$00
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	iny
	lda.b #$08
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	ldx.b #$82
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd09:		; sound driver command $09, 5 bytes from [$0C]
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	ldy.b #$00
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	iny
	lda.b #$09
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	ldx.b #$83
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd0A:		; sound driver command $0A, 8 bytes from [$0C]
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	ldy.b #$00
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	iny
	lda.b #$0A
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	iny
	lda.b [$0C],y
	sta.w APUIO3
	ldx.b #$84
	stx.w APUIO0
.ack2:
	cpx.w APUIO0
	bne .ack2
	lda.b [$0C],y
	sta.w APUIO1
	iny
	lda.b [$0C],y
	sta.w APUIO2
	inx
	stx.w APUIO0
.ack3:
	cpx.w APUIO0
	bne .ack3
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd0B:		; sound driver command $0B, Y in APUIO2-APUIO3, X in APUIO1
	sty.w APUIO2
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	stx.w APUIO1
	lda.b #$0B
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd0C:		; sound driver command $0C, Y in APUIO2, X in APUIO1
	sep #$30
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	stx.w APUIO1
	lda.b #$0C
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
SPCCmd0D:		; sound driver command $0D
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$0D
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$20
	rtl
SPCCmd0E:		; sound driver command $0E, X in APUIO1, A in APUIO2, Y in APUIO3
	sep #$30
	pha
.wait:
	lda.w APUIO0
	bne .wait
	pla
	sty.w APUIO3
	sta.w APUIO2
	stx.w APUIO1
	lda.b #$0E
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stz.w APUIO0
	rep #$30
	rtl
SPCStreamStart:		; sound driver command $0F: start sending X bytes from [$3E] to sound RAM address Y; sends the first block
	lda.w STAT78
	bit.w #$007E
	beq .small
	txa
	sec
	sbc.w #$008A
	sta.l SPCStreamLeft
	ldx.w #$008A
	bra .send
.small:
	txa
	sec
	sbc.w #$0073
	sta.l SPCStreamLeft
	ldx.w #$0073
.send:
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$0F
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
	ldy.w #$0000
.loop:
	lda.b [$3E],y
	sta.w APUIO2
	iny
	tya
	sta.w APUIO1
.ackbyte:
	cmp.w APUIO1
	bne .ackbyte
	nop
	nop
	nop
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	tya
	clc
	adc.b $3E
	sta.l SPCStreamPtr
	lda.b $40
	sta.l SPCStreamPtr+2
	rtl
SPCStreamNext:		; sound driver command $10: send the next block of the stream; returns the bytes still left
	lda.l SPCStreamPtr
	sta.b $3E
	lda.l SPCStreamPtr+2
	sta.b $40
	lda.w STAT78
	bit.w #$0010
	beq .small
.big:
	lda.l SPCStreamLeft
	cmp.w #$008B
	bcc .last
	sbc.w #$008A
	sta.l SPCStreamLeft
	ldx.w #$008A
	bra .send
.small:
	lda.l SPCStreamLeft
	cmp.w #$0074
	bcc .last
	sbc.w #$0073
	sta.l SPCStreamLeft
	ldx.w #$0073
	bra .send
.last:
	tax
	lda.w #$0000
	sta.l SPCStreamLeft
.send:
	ldy.w #$0000
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	lda.b #$10
	sta.w APUIO0
	stz.w APUIO1
.ack:
	cmp.w APUIO0
	bne .ack
.loop:
	lda.b [$3E],y
	sta.w APUIO2
	iny
	tya
.ackbyte:
	cmp.w APUIO1
	bne .ackbyte
	nop
	nop
	nop
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	tya
	clc
	adc.b $3E
	sta.l SPCStreamPtr
	lda.l SPCStreamLeft
	rtl
SPCDownload:		; sound driver command $11: X bytes from sound RAM address Y to [$0C]
	sep #$20
.wait:
	lda.w APUIO0
	bne .wait
	sty.w APUIO2
	lda.b #$11
	sta.w APUIO0
.ack:
	cmp.w APUIO0
	bne .ack
	stx.w APUIO2
	lda.b #$86
	sta.w APUIO0
.ack2:
	cmp.w APUIO0
	bne .ack2
	lda.b #$87
	sta.w APUIO0
	lda.b #$00
	sta.w APUIO1
	ldy.w #$0000
.loop:
	tya
.waitbyte:
	cmp.w APUIO1
	beq .waitbyte
	lda.w APUIO2
	sta.b [$0C],y
	iny
	tya
	sta.w APUIO1
	dex
	bne .loop
	stz.w APUIO0
	rep #$20
	rtl
SPCUploadBlock:		; SPCUpload of the block at [$0C]: address and length (big-endian words), then the data
	sep #$20
	dec.w SoundLock
	rep #$20
	ldy.w #$0000
	lda.b [$0C],y
	xba
	sta.b $14
	ldy.w #$0002
	lda.b [$0C],y
	xba
	tax
	ldy.b $14
	lda.b $0C
	clc
	adc.w #$0004
	sta.b $0C
	jsl.l SPCUpload
	sep #$20
	inc.w SoundLock
	rep #$20
	rtl

; The heap. Each bank holds a chain of blocks from HeapStart7E / HeapStart7F up to $FFF8. A block is a header of words
; (size, flags, next, previous) and its data. Flags 0 = free, bit 15 = used, bit 14 = locked (compaction does not move it).
; Callers keep handles: HandleTable entries that point at the data, so blocks can move.
HeapInit:		; start the heaps at X in bank $7E (at least $E68C) and Y in bank $7F: one free block each, all handles free
	cpx.w #$E68C
	bcs .base
	ldx.w #$E68C
.base:
	stx.w HeapStart7E
	sty.w HeapStart7F
	lda.w #$FFFF
	sta.l $7E0006,x
	lda.w #$0000
	sta.l $7E0004,x
	sta.l $7E0002,x
	lda.w #$FFF8
	sec
	sbc.w HeapStart7E
	sta.l $7E0000,x
	tyx
	lda.w #$FFFF
	sta.l $7F0006,x
	lda.w #$0000
	sta.l $7F0004,x
	sta.l $7F0002,x
	lda.w #$FFF8
	sec
	sbc.w HeapStart7F
	sta.l $7F0000,x
	ldx.w #$00FE
	lda.w #$0000
.clear:
	sta.l HandleTable,x
	dex
	dex
	bpl .clear
	rtl
HeapReset:		; HeapInit at the same starts
	pha
	phx
	phy
	ldx.w HeapStart7E
	ldy.w HeapStart7F
	jsl.l HeapInit
	ply
	plx
	pla
	rtl
NewHandle:		; a block of X bytes; A bit 14 = locked; Y = $7E or $7F for that bank only, else either. Returns the handle, 0 if no room
	stx.b $14
	and.w #$4000
	sta.b $16
	ldx.w #$2000
.find:
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .slot
	inx
	inx
	inx
	inx
	cpx.w #$2100
	bne .find
	lda.w #$0000
	bra .exit
.slot:
	stx.w NewHandleSlot
	tya
	eor.w #$0001
	sta.w NewHandleSkipBank
	lda.w #$007E
	sta.b $0E
	cmp.w NewHandleSkipBank
	beq .try7F
	ldy.w HeapStart7E
	jsr.w HeapAllocBlock
	cmp.w #$FFFF
	bne .found
.try7F:
	lda.w #$007F
	sta.b $0E
	cmp.w NewHandleSkipBank
	beq .compact
	ldy.w HeapStart7F
	jsr.w HeapAllocBlock
	cmp.w #$FFFF
	bne .found
.compact:
	jsl.l HeapCompact
	lda.w #$007E
	sta.b $0E
	cmp.w NewHandleSkipBank
	beq .retry7F
	ldy.w HeapStart7E
	jsr.w HeapAllocBlock
	cmp.w #$FFFF
	bne .found
.retry7F:
	lda.w #$007F
	sta.b $0E
	cmp.w NewHandleSkipBank
	beq .fail
	ldy.w HeapStart7F
	jsr.w HeapAllocBlock
	cmp.w #$FFFF
	bne .found
.fail:
	lda.w #$0000
	bra .exit
.found:
	ldx.w NewHandleSlot
	sta.l $7E0000,x
	lda.b $0E
	sta.l $7E0002,x
	txa
.exit:
	rtl
HeapAllocBlock:		; first free block of size $14 or more (flags $16) from header Y in the bank in $0E; splits it when 16 or more bytes are left.
		;   returns the data address, $FFFF for none
	stz.b $0C
.walk:
	lda.b [$0C],y
	iny
	iny
	cmp.b $14
	bcs .fit
.next:
	iny
	iny
	lda.b [$0C],y
	beq .none
	tay
	bra .walk
.none:
	lda.w #$FFFF
	rts
.fit:
	lda.b [$0C],y
	bne .next
	dey
	dey
	lda.b [$0C],y
	sty.b $02
	sec
	sbc.b $14
	beq .whole
	cmp.w #$0010
	bcc .whole
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	lda.b $16
	ora.w #$8000
	sta.b [$0C],y
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	lda.b $02
	clc
	adc.b $14
	adc.w #$0008
	sta.b [$0C],y
	tay
	lda.b $00
	sec
	sbc.w #$0008
	sta.b [$0C],y
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $04
	sta.b [$0C],y
	iny
	iny
	lda.b $02
	sta.b [$0C],y
.ret:
	lda.b $02
	clc
	adc.w #$0008
	rts
.whole:
	iny
	iny
	lda.b $16
	ora.w #$8000
	sta.b [$0C],y
	bra .ret
DisposeHandle:		; free handle A and its block, joined with free neighbours
	cmp.w #$2000
	bcc .exit
	cmp.w #$2100
	bcs .exit
	tax
	lda.l $7E0002,x
	tay
	lda.l $7E0000,x
	pha
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
	pla
	tyx
	ldy.w HeapStart7E
	cpx.w #$007E
	beq .heap
	ldy.w HeapStart7F
	cpx.w #$007F
	beq .heap
.exit:
	rtl
.heap:
	sec
	sbc.w #$0008
	sta.b $14
	stx.b $0E
	stz.b $0C
.find:
	cpy.b $14
	beq .found
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .exit
	tay
	bra .find
.found:
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .prev
	tay
	tax
	iny
	iny
	lda.b [$0C],y
	bne .prev
	txy
	lda.b [$0C],y
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	tay
	lda.b $14
	cpy.w #$0000
	beq .size
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.size:
	tay
	lda.b [$0C],y
	clc
	adc.b $00
	adc.w #$0008
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.prev:
	ldy.b $14
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	cmp.w #$FFFF
	beq .done
	tay
	tax
	iny
	iny
	lda.b [$0C],y
	bne .done
	ldy.b $14
	lda.b [$0C],y
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $04
	tay
	txa
	cpy.w #$0000
	beq .size2
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.size2:
	tay
	lda.b [$0C],y
	clc
	adc.b $00
	adc.w #$0008
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.done:
	rtl
HeapCompact:		; HeapCompactBank for both banks
	pha
	phx
	phy
	lda.w #$007E
	sta.b $0E
	stz.b $0C
	ldy.w HeapStart7E
	jsr.w HeapCompactBank
	lda.w #$007F
	sta.b $0E
	stz.b $0C
	ldy.w HeapStart7F
	jsr.w HeapCompactBank
	ply
	plx
	pla
	rtl
HeapCompactBank:		; join free blocks and move unlocked blocks down over them, fixing their handles
	iny
	iny
	lda.b [$0C],y
	beq .free
.next:
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	bra HeapCompactBank
.done:
	rts
.merge:
	tyx
	dey
	dey
	lda.b [$0C],y
	sta.b $04
	txy
	iny
	iny
	lda.b [$0C],y
	sta.b $08
	tay
	beq .size
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $00
	sta.b [$0C],y
.size:
	ldy.b $00
	lda.b $04
	clc
	adc.w #$0008
	adc.b $06
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $08
	sta.b [$0C],y
	dey
	dey
.free:
	dey
	dey
	sty.b $00
	lda.b [$0C],y
	sta.b $06
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	iny
	iny
	lda.b [$0C],y
	beq .merge
	and.w #$4000
	bne .next
	dey
	dey
	sty.b $0A
	lda.b [$0C],y
	sta.b $04
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $08
	tay
	lda.b $00
	clc
	adc.w #$0008
	adc.b $04
	cpy.w #$0000
	beq .move
	iny
	iny
	iny
	iny
	iny
	iny
	sta.b [$0C],y
.move:
	tax
	ldy.b $00
	lda.b $04
	sta.b [$0C],y
	iny
	iny
	lda.w #$8000
	sta.b [$0C],y
	iny
	iny
	txa
	sta.b [$0C],y
	phx
	phy
	phb
	lda.b $0A
	clc
	adc.w #$0008
	tax
	lda.b $00
	clc
	adc.w #$0008
	tay
	lda.b $0E
	cmp.w #$007E
	beq .mvn7E
	lda.b $04
	dec a
	mvn $7F,$7F
	bra .moved
.mvn7E:
	lda.b $04
	dec a
	mvn $7E,$7E
.moved:
	plb
	ply
	plx
	txy
	lda.b $06
	sta.b [$0C],y
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $08
	sta.b [$0C],y
	iny
	iny
	lda.b $00
	sta.b [$0C],y
	lda.b $0A
	clc
	adc.w #$0008
	txy
	ldx.w #$00FC
.scan:
	cmp.l HandleTable,x
	beq .fix
	dex
	dex
	dex
	dex
	bpl .scan
	bra .again
.fix:
	lda.b $00
	clc
	adc.w #$0008
	sta.l HandleTable,x
.again:
	iny
	iny
	jmp.w .free
	rts		; not reached
LockHandle:		; set the locked bit of handle A's block
	pha
	cmp.w #$2000
	bcc .exit
	cmp.w #$2100
	bcs .exit
	tax
	lda.l $7E0002,x
	tay
	lda.l $7E0000,x
	tyx
	ldy.w HeapStart7E
	cpx.w #$007E
	beq .heap
	ldy.w HeapStart7F
	cpx.w #$007F
	bne .exit
.heap:
	sec
	sbc.w #$0008
	sta.b $14
	stx.b $0E
	stz.b $0C
.find:
	cpy.b $14
	beq .found
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .exit
	tay
	bra .find
.found:
	iny
	iny
	lda.b [$0C],y
	beq .exit
	ora.w #$4000
	sta.b [$0C],y
.exit:
	pla
	rtl
UnlockHandle:		; clear the locked bit of handle A's block
	pha
	cmp.w #$2000
	bcc .exit
	cmp.w #$2100
	bcs .exit
	tax
	lda.l $7E0002,x
	tay
	lda.l $7E0000,x
	tyx
	ldy.w HeapStart7E
	cpx.w #$007E
	beq .heap
	ldy.w HeapStart7F
	cpx.w #$007F
	bne .exit
.heap:
	sec
	sbc.w #$0008
	sta.b $14
	stx.b $0E
	stz.b $0C
.find:
	cpy.b $14
	beq .found
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	beq .exit
	tay
	bra .find
.found:
	iny
	iny
	lda.b [$0C],y
	beq .exit
	and.w #$8000
	sta.b [$0C],y
.exit:
	pla
	rtl
NewPtrHandle:		; a handle for fixed memory at A in bank X; returns the handle, 0 if none is free
	stx.b $16
	sta.b $14
	ldx.w #$2000
.find:
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .slot
	inx
	inx
	inx
	inx
	cpx.w #$2100
	bne .find
	lda.w #$0000
	bra .exit
.slot:
	lda.b $14
	sta.l $7E0000,x
	lda.b $16
	sta.l $7E0002,x
	txa
.exit:
	rtl
DisposePtrHandle:		; free handle A unless it is a heap block
	cmp.w #$2000
	bcc .exit
	cmp.w #$2100
	bcs .exit
	tax
	lda.l $7E0002,x
	cmp.w #$007E
	beq .exit
	cmp.w #$007F
	beq .exit
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
.exit:
	rtl
SetHandleSize:		; resize handle A's block to X bytes: in place when it can, else in a new block
	cmp.w #$2000
	bcc .bad
	cmp.w #$2100
	bcs .bad
	stx.b $14
	tax
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .bad
	lda.l $7E0002,x
	cmp.w #$007E
	beq .heap
	cmp.w #$007F
	bne .bad
.heap:
	stx.b $08
	sta.b $0E
	stz.b $0C
	lda.l $7E0000,x
	sec
	sbc.w #$0006
	tay
	lda.b [$0C],y
	beq .bad
	dey
	dey
	tyx
	lda.b [$0C],y
	sta.b $16
	iny
	iny
	iny
	iny
	sec
	sbc.b $14
	bcc .togrow
	cmp.w #$0009
	bcs .shrink
	jmp.w .exit
.togrow:
	jmp.w .grow
.bad:
	jmp.w .exit
.shrink:
	lda.b [$0C],y
	sta.b $02
	beq .split
	tay
	iny
	iny
	lda.b [$0C],y
	beq .mergenext
.split:
	txy
	lda.b $16
	sec
	sbc.w #$0008
	sbc.b $14
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	tya
	clc
	adc.b $14
	adc.w #$0008
	iny
	iny
	iny
	iny
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	sta.b [$0C],y
	jmp.w .newfree
.mergenext:
	dey
	dey
	lda.b [$0C],y
	sta.b $06
	ldy.b $02
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	lda.b $16
	sec
	sbc.b $14
	sta.b $00
	lda.b $14
	sta.b [$0C],y
	tya
	clc
	adc.b $14
	adc.w #$0008
	iny
	iny
	iny
	iny
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	clc
	adc.b $06
	sta.b [$0C],y
.newfree:
	iny
	iny
	lda.w #$0000
	sta.b [$0C],y
	iny
	iny
	lda.b $02
	sta.b [$0C],y
	iny
	iny
	txa
	sta.b [$0C],y
	ldy.b $02
	beq .done
.linkprev:
	iny
	iny
	iny
	iny
	iny
	iny
	lda.b $04
	sta.b [$0C],y
.done:
	jmp.w .exit
.grow:
	lda.b [$0C],y
	sta.b $02
	beq .move
	tay
	iny
	iny
	lda.b [$0C],y
	bne .move
	dey
	dey
	lda.b [$0C],y
	clc
	adc.w #$0008
	adc.b $16
	cmp.b $14
	beq .wholenext
	bcc .move
	lda.b $14
	sec
	sbc.b $16
	sta.b $00
	lda.b [$0C],y
	sec
	sbc.b $00
	sta.b $00
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	tya
	clc
	adc.b $14
	adc.w #$0004
	sta.b [$0C],y
	sta.b $04
	tay
	lda.b $00
	sta.b [$0C],y
	jmp.w .newfree
.wholenext:
	ldy.b $02
	iny
	iny
	iny
	iny
	lda.b [$0C],y
	sta.b $02
	txy
	sty.b $04
	lda.b $14
	sta.b [$0C],y
	iny
	iny
	iny
	iny
	lda.b $02
	sta.b [$0C],y
	tay
	bne .tolinkprev
	jmp.w .exit
.tolinkprev:
	jmp.w .linkprev
.move:
	txy
	iny
	iny
	lda.b [$0C],y
	and.w #$4000
	lda.b $16
	pha
	lda.b $08
	pha
	lda.w #$0000
	ldx.b $14
	phx
	ldy.w #$0000
	jsl.l NewHandle
	plx
	stx.b $14
	plx
	stx.b $08
	plx
	stx.b $16
	tax
	sta.b $0A
	lda.l $7E0000,x
	tay
	sep #$20
	lda.b #$54
	sta.b $10
	lda.l $7E0002,x
	sta.b $11
	ldx.b $08
	lda.l $7E0002,x
	sta.b $12
	lda.b #$6B
	sta.b $13
	rep #$20
	lda.l $7E0000,x
	tax
	lda.b $16
	phb
	jsl.l $000010		; mvn written to $10-$13 above, then rtl
	plb
	lda.b $08
	jsl.l DisposeHandle
	ldx.b $0A
	lda.l $7E0000,x
	tay
	lda.l $7E0002,x
	ldx.b $08
	sta.l $7E0002,x
	tya
	sta.l $7E0000,x
	ldx.b $0A
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
.exit:
	rtl
DerefHandle:		; address of handle A in A, bank in X; 0 and 0 for a bad handle
	cmp.w #$2000
	bcc .bad
	cmp.w #$2100
	bcs .bad
	stx.b $14
	tax
	lda.l $7E0000,x
	ora.l $7E0002,x
	beq .bad
	lda.l $7E0002,x
	pha
	lda.l $7E0000,x
	plx
	bra .exit
.bad:
	lda.w #$0000
	tax
.exit:
	rtl
FindHandle:		; the handle of address A in bank X, 0 if none
	stx.b $16
	sta.b $14
	ldx.w #$2000
.loop:
	lda.l $7E0000,x
	cmp.b $14
	bne .next
	lda.l $7E0002,x
	cmp.b $16
	beq .found
.next:
	inx
	inx
	inx
	inx
	cpx.w #$2100
	bne .loop
	lda.w #$0000
	bra .exit
.found:
	txa
.exit:
	rtl
HeapFree:		; free bytes of both heaps in X:A
	stz.b $14
	stz.b $16
	stz.b $0C
	lda.w #$007E
	sta.b $0E
	ldy.w HeapStart7E
	jsr.w HeapFreeBank
	lda.w #$007F
	sta.b $0E
	ldy.w HeapStart7F
	jsr.w HeapFreeBank
	ldx.b $16
	lda.b $14
	rtl
HeapFreeBank:
	iny
	iny
	lda.b [$0C],y
	bne .next
	dey
	dey
	lda.b [$0C],y
	clc
	adc.b $14
	sta.b $14
	lda.w #$0000
	adc.b $16
	sta.b $16
	iny
	iny
.next:
	iny
	iny
	lda.b [$0C],y
	beq .done
	tay
	bra HeapFreeBank
.done:
	rts

ByteBitMasks:		; bits 0-7
	db $01,$02,$04,$08,$10,$20,$40,$80
