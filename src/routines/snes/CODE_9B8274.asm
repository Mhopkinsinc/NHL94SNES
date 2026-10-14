; Unidentified routine.
CODE_9B8274:
	stz.w JOYSER0
CODE_9B8277:
	lda.w $0ACA
	cmp.b #$01
	beq .2
	ldx.w #$000F
	stx.w JoyPad
	ldx.w $1A0C
	beq .2
.1:
	jsr.w CODE_9B8309
.2:
	lda.w $0ACB
	cmp.b #$01
	beq .4
	ldx.w #$000F
	stx.w $0778
	ldx.w $1A0C
	beq .8
.3:
	jsr.w CODE_9B8309
.4:
	lda.w $1A0C
	beq .8
.5:
	lda.w $0ACC
	cmp.b #$01
	beq .6
	ldx.w #$000F
	stx.w $077A
	jsr.w CODE_9B8309
.6:
	lda.w $0ACD
	cmp.b #$01
	beq .7
	ldx.w #$000F
	stx.w $077C
	jsr.w CODE_9B8309
.7:
	lda.w $0ACE
	cmp.b #$01
	beq .8
	ldx.w #$000F
	stx.w $077E
	jsr.w CODE_9B8309
.8:
	lda.w $1A0E
	beq CODE_9B8307
.9:
	lda.b $83
	and.b #$10
	bne .t1
	ldx.w #$1000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
	bra CODE_9B8307

.t1:
	ldx.w #$0000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
CODE_9B8307:
	plp
	rtl
