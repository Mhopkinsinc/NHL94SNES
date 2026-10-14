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
	stx.w $0778
	txa
	and.b #$0F
	sta.w $0ACB
	lda.w $1A0C
	bne .t2
	jmp.w .2

.t2:
	ldx.w JOY4L
	stx.w $077A
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
	ora.w $1A0E
	bne .1
	lda.w $1C8A
	ora.w $1C8C
	bne .1
	lda.w $1A02
	beq .t1
	dec a
	sta.w $1A02
	jmp.w .5

.t1:
	lda.b #$1E
	sta.w $1A02
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
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w JOYSER1
	lsr a
	rol.w $077C
	lsr a
	rol.w $077E
	lda.w $077C
	and.b #$0F
	sta.w $0ACD
	lda.w $077E
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
	lda.w $1A0E
	and.b #$01
	sta.w $1A0E
	lda.w $1A04
	beq .2x
.1x:
	dec.w $1A04
.2x:
	stz.w JOYSER0
	lda.b #$01
	sta.w JOYSER0
	lda.w JOYSER0
	and.b #$02
	tax
	eor.w $1A06
	stx.w $1A06
	sta.w $1A0A
	lda.w JOYSER1
	and.b #$02
	tax
	eor.w $1A08
	stx.w $1A08
	ora.w $1A0A
	beq .4
.3:
	lda.b #$10
	sta.w $1A04
.4:
	lda.w $1A04
	bne .t1x
	bra .7

.t1x:
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.w $077A
	stx.w $077C
	stx.w $077E
	lda.w $1A00
	and.b #$80
	beq .t2x
	lda.b #$01
	tsb.w $1A0E
	bra .6

.t2x:
	lda.b #$01
	trb.w $1A0E
.6:
	lda.w $1A00
	and.b #$40
	beq .t1xx
	lda.b #$01
	tsb.w $1A0C
	bra .10

.t1xx:
	lda.b #$01
	trb.w $1A0C
	bra .10
.7:
	stz.w JOYSER0
.10:
	lda.w $0ACA
	cmp.b #$01
	beq .2xx
	ldx.w #$000F
	stx.w JoyPad
	ldx.w $1A0C
	beq .2xx
.1xx:
	jsr.w .12
.2xx:
	lda.w $0ACB
	cmp.b #$01
	beq .4x
	ldx.w #$000F
	stx.w $0778
	ldx.w $1A0C
	beq .8
.3x:
	jsr.w .12
.4x:
	lda.w $1A0C
	beq .8
.5x:
	lda.w $0ACC
	cmp.b #$01
	beq .6x
	ldx.w #$000F
	stx.w $077A
	jsr.w .12
.6x:
	lda.w $0ACD
	cmp.b #$01
	beq .7x
	ldx.w #$000F
	stx.w $077C
	jsr.w .12
.7x:
	lda.w $0ACE
	cmp.b #$01
	beq .8
	ldx.w #$000F
	stx.w $077E
	jsr.w .12
.8:
	lda.w $1A0E
	beq .11
.9:
	lda.b $83
	and.b #$10
	bne .t1xxx
	ldx.w #$1000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
	bra .11

.t1xxx:
	ldx.w #$0000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
.11:
	plp
	rtl
.12:
	and.b #$1E
	cmp.b #$02
	bne .t1xxxx
	lda.b #$04
	tsb.w $1A0E
	bra .1xxx

.t1xxxx:
	cmp.b #$1E
	bne .1xxx
	lda.b #$02
	tsb.w $1A0E
.1xxx:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
