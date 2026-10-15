; read the five pads: pads 1 and 2 from the auto read, pads 3 to 5 through the multitap
Multi5Bios:		; read the five pads: pads 1 and 2 from the auto read, pads 3 to 5 through the multitap
			;   on port 2 when $1A0C is set
	php
	sep #$20
	rep #$10
	stz.w $0ACD
	stz.w $0ACE
.loop:
	lda.w HVBJOY
	and.b #$01
	bne .loop
	ldx.w JOY1L
	stx.w JoyPad
	txa
	and.b #$0F
	sta.w $0ACA
	lda.w JOYSER0
	lsr a
	rol.w $0ACA
	ldx.w JOY2L
	stx.w JoyPad+2
	txa
	and.b #$0F
	sta.w $0ACB
	lda.w mp5present
	bne .t2
	jmp.w .2

.t2:
	ldx.w JOY4L
	stx.w JoyPad+4
	txa
	and.b #$0F
	sta.w $0ACC
	lda.w JOYSER1
	lsr a
	rol.w $0ACB
	lsr a
	rol.w $0ACC
	stz.w WRIO
	lda.w $0AD7
	ora.w mp5warning
	bne .1
	lda.w $1C8A
	ora.w $1C8C
	bne .1
	lda.w mp5readdelay
	beq .t1
	dec a
	sta.w mp5readdelay
	jmp.w .5

.t1:
	lda.b #$1E
	sta.w mp5readdelay
.1:
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w $077D
	lsr a
	rol.w $077F
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JOYSER1
	lsr a
	rol.w JoyPad+6
	lsr a
	rol.w JoyPad+8
	lda.w JoyPad+6
	and.b #$0F
	sta.w $0ACD
	lda.w JoyPad+8
	and.b #$0F
	sta.w $0ACE
	lda.w JOYSER1
	lsr a
	rol.w $0ACD
	lsr a
	rol.w $0ACE
	bra .5
.2:
	lda.w JOYSER1
	lsr a
	rol.w $0ACB
.5:
	lda.b #$80
	sta.w WRIO
	lda.w mp5warning
	and.b #$01
	sta.w mp5warning
	lda.w mp5checktimer
	beq .2x
.1x:
	dec.w mp5checktimer
.2x:
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	lda.w JOYSER0
	and.b #$02
	tax
	eor.w mp5port1last
	stx.w mp5port1last
	sta.w mp5portchg
	lda.w JOYSER1
	and.b #$02
	tax
	eor.w mp5port2last
	stx.w mp5port2last
	ora.w mp5portchg
	beq .4
.3:
	lda.b #$10
	sta.w mp5checktimer
.4:
	lda.w mp5checktimer
	bne .t1x
	bra .7

.t1x:
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.w JoyPad+4
	stx.w JoyPad+6
	stx.w JoyPad+8
	lda.w mp5connect
	and.b #$80
	beq .t2x
	lda.b #$01
	tsb.w mp5warning
	bra .6

.t2x:
	lda.b #$01
	trb.w mp5warning
.6:
	lda.w mp5connect
	and.b #$40
	beq .t1xx
	lda.b #$01
	tsb.w mp5present
	bra .10

.t1xx:
	lda.b #$01
	trb.w mp5present
	bra .10
.7:
	stz.w JOYSER0
.10:
	lda.w $0ACA
	cmp.b #$01
	beq .2xx
	ldx.w #$000F
	stx.w JoyPad
	ldx.w mp5present
	beq .2xx
.1xx:
	jsr.w .12
.2xx:
	lda.w $0ACB
	cmp.b #$01
	beq .4x
	ldx.w #$000F
	stx.w JoyPad+2
	ldx.w mp5present
	beq .8
.3x:
	jsr.w .12
.4x:
	lda.w mp5present
	beq .8
.5x:
	lda.w $0ACC
	cmp.b #$01
	beq .6x
	ldx.w #$000F
	stx.w JoyPad+4
	jsr.w .12
.6x:
	lda.w $0ACD
	cmp.b #$01
	beq .7x
	ldx.w #$000F
	stx.w JoyPad+6
	jsr.w .12
.7x:
	lda.w $0ACE
	cmp.b #$01
	beq .8
	ldx.w #$000F
	stx.w JoyPad+8
	jsr.w .12
.8:
	lda.w mp5warning
	beq .11
.9:
	lda.b $83
	and.b #$10
	bne .t1xxx
	ldx.w #$1000
	stx.w JoyPad
	stx.w JoyPad+2
	stx.w JoyPad+4
	stx.w JoyPad+6
	stx.w JoyPad+8
	bra .11

.t1xxx:
	ldx.w #$0000
	stx.w JoyPad
	stx.w JoyPad+2
	stx.w JoyPad+4
	stx.w JoyPad+6
	stx.w JoyPad+8
.11:
	plp
	rtl
.12:
	and.b #$1E
	cmp.b #$02
	bne .t1xxxx
	lda.b #$04
	tsb.w mp5warning
	bra .1xxx

.t1xxxx:
	cmp.b #$1E
	bne .1xxx
	lda.b #$02
	tsb.w mp5warning
.1xxx:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
