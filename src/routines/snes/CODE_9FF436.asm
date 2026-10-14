; Unidentified routine.
CODE_9FF436:
	stz.w brightness
	jsl.l forceblack
	jsl.l CheckPAL
	jsl.l CODE_9C97E9
	sep #$20
	lda.b #$FF
	sta.w $07E2
	rep #$30
	ldy.w #$01A0
	lda.w #$6000
	ldx.w #$0000
	jsl.l InitSprites
	stz.b $3A
	stz.b $3C
	lda.w #.1
	sta.b $0C
	lda.w #$009F
	sta.b $0E
	jsl.l .33
	jsr.w .2
	stz.b $C3
	jsr.w .3
	stz.w fadestep
	stz.w brightness
	jsl.l SpriteFrameStart
	jsl.l SpriteFrameEnd
	ldx.w #.framehook>>16
	lda.w #.framehook
	jsl.l SetFrameHook
	jsl.l ScreenOn
	lda.w #$7000
	sta.b $64
	ldx.w #$003C
.loop:
	jsl.l WaitFrame
	dex
	bpl .loop
	ldx.w #.framehook>>16
	lda.w #.framehook
	jsl.l SetFrameHook
.loop2:
	jsl.l RandomWord
	jsr.w .4
	bne .t1
	lda.b $3C
	cmp.b $3A
	beq .loop2
	bra .loop2

.t1:
	jsl.l forceblack
	rtl
.1:
	db $07,$C0,$11,$00,$00,$00,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00
.2:
	sep #$20
	stz.w CGADD
	lda.b #$FF
	sta.w CGDATA
	sta.w CGDATA
	rep #$20
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0030
	ldx.w #$0010
	jsl.l DMAToCGRAM
	ldy.w #$00B0
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	ldy.w #$0040
	ldx.w #$0010
	jsl.l DMAToCGRAM
	ldy.w #$00C0
	ldx.w #$0010
	jsl.l DMAToCGRAM
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0020
	jsl.l .31
	lda.w #$FFFF
	ldx.w #$000F
	ldy.w #$0010
	jsl.l .31
	ldx.w #$0000
	lda.w #$0000
.loopx:
	sta.l $7F4000,x
	inx
	inx
	cpx.w #$4000
	bcc .loopx
	lda.w #DATA8_949A00
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$8010
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	lda.w #DATA8_9ADC8D
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	stz.w VMADDL
	sep #$20
	lda.b #$80
	sta.w VMAIN
	ldy.w #$4000
	ldx.w #$0000
.loop2x:
	lda.l $7F4006,x
	sta.w VMDATAL
	lda.l $7F8010,x
	sta.w VMDATAH
	inx
	dey
	bne .loop2x
	rep #$20
	ldx.w #$1C00
	ldy.w #$0000
	sep #$20
.loop3:
	lda.l $7F4000,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	iny
	lda.l $7F8010,x
	phx
	tyx
	sta.l $7F4040,x
	plx
	inx
	iny
	cpy.w #$0A00
	bmi .loop3
	rep #$20
	lda.w #DATA8_94F8EC
	sta.b $0C
	lda.w #$0094
	sta.b $0E
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsl.l Decompress
	rts
.3:
	lda.w #$0180
	sta.b $D5
	sta.w $07D6
	lda.w #$0190
	sta.b $D7
	sta.w $07D8
	lda.w #$0010
	tsb.b $C3
	lda.w #$0003
	sta.b $B7
	stz.b $BB
	lda.b $83
	tax
	clc
	adc.w #$02D0
	sta.b d6
	txa
	clc
	adc.w #$00F0
	sta.b d7
	jsr.w .22
	rts
.4:
	lda.b $B7
	sta.b d4
	lda.b d4
	cmp.w #$000D
	beq .1x
	lda.w JoyPad
	beq .1x
.1x:
	lda.b $C3
	beq .t1x
	jmp.w .20

.t1x:
	lda.b d4
	asl a
	tax
	jmp (.5,x)
.5:		; jump table for jmp (.5,x)
	dw .6,.7,.8,.9,.10,.11,.12
	dw .13,.14,.15,.16,.17,.18,.19
.6:
	ldx.b $BB
	bne .t1xx
	lda.b $D9
	clc
	adc.w #$000C
	sta.b $D9
	sta.b $DB
	cmp.w #$0100
	bpl .t1xx
	lda.w #$0040
	tsb.b $C3
	bra .1xx

.t1xx:
	jsr.w .23
	lda.w #$0040
	tsb.b $C3
	lda.b d5
	sta.b $B7
.1xx:
	jmp.w .20
.7:
	ldx.b $BB
	bne .t1xxx
	jsr.w .30
	bne .t1xxx
	jsr.w .30
	bne .t1xxx
	jsr.w .30
	bne .t1xxx
	lda.w #$0008
	tsb.b $C3
	bra .1xxx

.t1xxx:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w .32
	lda.w #$0008
	tsb.b $C3
	lda.b d5
	sta.b $B7
.1xxx:
	jmp.w .20
.8:
	ldx.b $BB
	bne .1xxxx
	lda.b $83
	cmp.b $BF
	bmi .2x
.1xxxx:
	lda.b d5
	sta.b $B7
.2x:
	jmp.w .20
.9:
	lda.b $BB
	bne .t1xxxx
	lda.w #$0000
	jsl.l CODE_80A200
	jsr.w .24
	bra .2xx

.t1xxxx:
	jsr.w .23
.2xx:
	lda.w #DATA8_9ADBD3
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l .26
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0004
	ldx.b $BB
	bne .1xxxxx
	sta.b d5
	lda.w #$0000
.1xxxxx:
	sta.b $B7
	jmp.w .20
.10:
	jsl.l SpriteFrameStart
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	lda.w #$0009
	sta.b $B7
	jmp.w .20
.11:
	lda.b $BB
	bne .t1xxxxx
	jsr.w .24
	bra .2xxx

.t1xxxxx:
	jsr.w .23
.2xxx:
	lda.w #DATA8_9ADB19
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	jsl.l .26
	lda.w #$00C0
	tsb.b $C3
	lda.w #$0006
	ldx.b $BB
	bne .1xxxxxx
	sta.b d5
	lda.w #$0000
.1xxxxxx:
	sta.b $B7
	jmp.w .20
.12:
	jsl.l SpriteFrameStart
	lda.w #$4A40
	sta.b $10
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	lda.w #$0001
	sta.b $00
	lda.w #$0000
	ldx.w #$0038
	ldy.w #$002F
	jsl.l DrawSprite
	jsl.l SpriteFrameEnd
	lda.w #$000A
	sta.b $B7
	jmp.w .20
.13:
	lda.b $BB
	bne .t1xxxxxx
	jsr.w .24
	bra .2xxxx

.t1xxxxxx:
	jsr.w .23
.2xxxx:
	jsl.l .25
	lda.w #DATA8_9AEE5C
	sta.b tmp2
	lda.w #$009A
	sta.b $CB
	lda.w #$0020
	sta.b tmp0
	lda.w #$0010
	sta.b tmp1
	lda.w #$00C8
	tsb.b $C3
	lda.w #$000B
	ldx.b $BB
	bne .1xxxxxxx
	sta.b d5
	lda.w #$0000
.1xxxxxxx:
	sta.b $B7
	jmp.w .20
.14:
	lda.w #DATA8_9AEE7C
	sta.b tmp2
	lda.w #$009A
	sta.b $CB
	lda.w #$0010
	sta.b tmp0
	lda.w #$0010
	sta.b tmp1
	lda.w #$0008
	tsb.b $C3
	lda.w #$000D
	sta.b $B7
	jmp.w .20
.15:
	lda.b $BB
	beq .t1xxxxxxx
.1xxxxxxxx:
	lda.w #$0005
	sta.b $B7
	jmp.w .20

.t1xxxxxxx:
	lda.w #DATA8_9AEE1C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0030
	sta.b tmp0
	jsr.w .29
	lda.w #$0005
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w .20
.16:
	lda.b $BB
	beq .t1xxxxxxxx
.1xxxxxxxxx:
	lda.w #$0007
	sta.b $B7
	jmp.w .20

.t1xxxxxxxx:
	lda.w #DATA8_9AEE3C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0040
	sta.b tmp0
	jsr.w .29
	lda.w #$0007
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w .20
.17:
	lda.w #$0008
	sta.b $B7
	jmp.w .20

.t1xxxxxxxxx:
	lda.w #DATA8_9AEE5C
	sta.b $0C
	lda.w #$009A
	sta.b $0E
	lda.w #$0020
	sta.b tmp0
	jsr.w .29
	lda.w #$000C
	sta.b d5
	lda.w #$0001
	sta.b $B7
	jmp.w .20
.18:
	lda.b $83
	clc
	adc.w #$001E
	sta.b $BF
	lda.w #$0002
	sta.b $B7
	lda.w #$0008
	sta.b d5
	jmp.w .20
.19:
	lda.w brightness
	cmp.w #$000F
	bne .20
	lda.b $83
	cmp.b d7
	bmi .20
	lda.w JoyPad
	bne .t1xxxxxxxxxx
	lda.b $83
	cmp.b d6
	bmi .20
	bra .t1xxxxxxxxxx

.t1xxxxxxxxxx:
	lda.w #$0001
	bra .21
.20:
	lda.w #$0000
.21:
	rts
.22:
	sep #$20
	lda.b #$00
	sta.w M7X
	lda.b #$02
	sta.w M7X
	lda.b #$00
	sta.w M7Y
	lda.b #$02
	sta.w M7Y
	stz.w M7A
	lda.b #$01
	sta.w M7A
	stz.w M7B
	stz.w M7B
	stz.w M7C
	stz.w M7C
	stz.w M7D
	lda.b #$01
	sta.w M7D
	rep #$20
	jsr.w .23
	rts
.23:
	lda.w #$0100
	sta.b $D9
	sta.b $DB
	rts
.24:
	lda.w #$0001
	sta.b $D9
	sta.b $DB
	rts
.25:
	stz.b d1
	jsr.w .27
	rtl
.26:
	lda.w #$0001
	sta.b d1
	jsr.w .27
	rtl
.27:
	ldy.w #$0006
	stz.b $A7
.loopxx:
	lda.b $A7
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.w #$0037
	asl a
	tax
	stz.b d0
	sep #$20
.loop2xx:
	lda.b d1
	beq .1xxxxxxxxxx
	lda.b [$0C],y
.1xxxxxxxxxx:
	sta.l $7F4040,x
	iny
	inx
	inx
	inc.b d0
	lda.b d0
	cmp.b #$12
	bmi .loop2xx
	rep #$20
	inc.b $A7
	lda.b $A7
	cmp.w #$000A
	bmi .loopxx
	rts

.t1xxxxxxxxxxx:
	rep #$30
.28:
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.w #$4040
	sta.b $0C
	lda.w #$007F
	sta.b $0E
	ldx.w #$1C00
	lda.w #$0A00
	jsl.l .t1xxxxxxxxxxxx
	pla
	sta.b $0E
	pla
	sta.b $0C
	rtl

.t1xxxxxxxxxxxx:
	php
	sta.w DAS0L
	lda.b $0C
	sta.w A1T0L
	stx.w VMADDL
	sep #$20
	lda.b $0E
	sta.w A1B0
	lda.b #$01
	sta.w DMAP0
	lda.b #$18
	sta.w BBAD0
	lda.b #$01
	sta.w MDMAEN
	rep #$30
	plp
	rtl
.29:
	lda.w #$4000
	sta.b $10
	lda.w #$007F
	sta.b $12
	jsr.w .32
	lda.w #$0010
	sta.b tmp1
	lda.w #$4000
	sta.b tmp2
	lda.w #$007F
	sta.b $CB
	rts
.30:
	ldx.w #$0000
	ldy.w #$0001
.loopxxx:
	lda.l $7F4000,x
	pha
	and.w #$001F
	cmp.w #$001F
	beq .1xxxxxxxxxxx
	clc
	adc.w #$0001
	and.w #$001F
.1xxxxxxxxxxx:
	sta.l $7F4000,x
	pla
	pha
	and.w #$03E0
	cmp.w #$03E0
	beq .2xxxxx
	clc
	adc.w #$0020
	and.w #$03E0
.2xxxxx:
	ora.l $7F4000,x
	sta.l $7F4000,x
	pla
	and.w #$7C00
	cmp.w #$7C00
	beq .3x
	clc
	adc.w #$0400
	and.w #$7C00
.3x:
	ora.l $7F4000,x
	sta.l $7F4000,x
	and.w #$7FFF
	cmp.w #$7FFF
	beq .4x
	ldy.w #$0000
.4x:
	inx
	inx
	cpx.w #$0020
	bmi .loopxxx
	tya
	rts
.31:
	sep #$30
	sty.w CGADD
.loopxxxx:
	sta.w CGDATA
	xba
	sta.w CGDATA
	xba
	dex
	bpl .loopxxxx
	rep #$30
	rtl
.32:
	ldy.w #$0000
.loopxxxxx:
	lda.b [$0C],y
	sta.b [$10],y
	iny
	iny
	cpy.w #$0020
	bmi .loopxxxxx
	rts
.framehook:		; the frame hook of this sequence
	rep #$30
	lda.b $C3
	bit.w #$0080
	beq .t1xxxxxxxxxxxxx
	jsl.l .28
	lda.w #$0080
	trb.b $C3
	jmp.w .3xx

.t1xxxxxxxxxxxxx:
	lda.b $C3
	bit.w #$0008
	beq .3xx
	lda.b $0C
	pha
	lda.b $0E
	pha
	lda.b tmp2
	sta.b $0C
	lda.b $CB
	sta.b $0E
	ldy.b tmp0
	ldx.b tmp1
	jsl.l DMAToCGRAM
	lda.b $C3
	bit.w #$0200
	beq .2xxxxxx
.1xxxxxxxxxxxx:
	lda.b $D1
	sta.b $0C
	lda.b $D3
	sta.b $0E
	ldy.b $CD
	ldx.b $CF
	jsl.l DMAToCGRAM
.2xxxxxx:
	pla
	sta.b $0E
	pla
	sta.b $0C
	lda.w #$0208
	trb.b $C3
.3xx:
	lda.b $C3
	bit.w #$0010
	beq .1xxxxxxxxxxxxx
	sep #$20
	lda.b $D5
	sta.w BG1HOFS
	lda.b $D6
	sta.w BG1HOFS
	lda.b $D7
	sta.w BG1VOFS
	lda.b $D8
	sta.w BG1VOFS
	rep #$20
	lda.w #$0010
	trb.b $C3
.1xxxxxxxxxxxxx:
	lda.b $C3
	bit.w #$0040
	beq .rtl
	sep #$20
	lda.b $D9
	sta.w M7A
	lda.b $DA
	sta.w M7A
	lda.b $DB
	sta.w M7D
	lda.b $DC
	sta.w M7D
	rep #$20
	lda.w #$0040
	trb.b $C3
.rtl:
	rtl
.33:
	sep #$20
	lda.b #$03
	sta.w OBSEL
	lda.b #$80
	sta.w VMAIN
	ldy.w #$0000
	lda.b [$0C],y
	sta.w BGMODE
	iny
	lda.b [$0C],y
	sta.w M7SEL
	iny
	lda.b [$0C],y
	sta.w TM
	iny
	lda.b [$0C],y
	sta.w TS
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG1SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG2SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG3SC
	iny
	iny
	lda.b [$0C],y
	iny
	ora.b [$0C],y
	sta.w BG4SC
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG12NBA
	iny
	iny
	lda.b [$0C],y
	lsr a
	lsr a
	lsr a
	lsr a
	iny
	iny
	ora.b [$0C],y
	sta.w BG34NBA
	rep #$20
	rtl
	db $00
	padbyte $FF
	pad $A08000
