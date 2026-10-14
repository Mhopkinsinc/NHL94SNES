; Unidentified routine.
CODE_9B81EC:
	lda.w JOYSER1
	lsr a
	rol.w $0ACB
CODE_9B81F3:
	lda.b #$80
	sta.w WRIO
	lda.w $1A0E
	and.b #$01
	sta.w $1A0E
	lda.w $1A04
	beq .2
.1:
	dec.w $1A04
.2:
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
	bne .t1
	bra CODE_9B8274

.t1:
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.w $077A
	stx.w $077C
	stx.w $077E
	lda.w $1A00
	and.b #$80
	beq .t2
	lda.b #$01
	tsb.w $1A0E
	bra CODE_9B825F

.t2:
	lda.b #$01
	trb.w $1A0E
CODE_9B825F:
	lda.w $1A00
	and.b #$40
	beq .t1
	lda.b #$01
	tsb.w $1A0C
	bra CODE_9B8277

.t1:
	lda.b #$01
	trb.w $1A0C
	bra CODE_9B8277
