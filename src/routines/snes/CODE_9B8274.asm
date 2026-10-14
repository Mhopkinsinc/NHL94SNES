; Unidentified routine.
CODE_9B8274:
	stz.w $4016
CODE_9B8277:
	lda.w $0ACA
	cmp.b #$01
	beq CODE_9B828C
	ldx.w #$000F
	stx.w JoyPad
	ldx.w $1A0C
	beq CODE_9B828C
CODE_9B8289:
	jsr.w CODE_9B8309
CODE_9B828C:
	lda.w $0ACB
	cmp.b #$01
	beq CODE_9B82A1
	ldx.w #$000F
	stx.w $0778
	ldx.w $1A0C
	beq CODE_9B82D6
CODE_9B829E:
	jsr.w CODE_9B8309
CODE_9B82A1:
	lda.w $1A0C
	beq CODE_9B82D6
CODE_9B82A6:
	lda.w $0ACC
	cmp.b #$01
	beq CODE_9B82B6
	ldx.w #$000F
	stx.w $077A
	jsr.w CODE_9B8309
CODE_9B82B6:
	lda.w $0ACD
	cmp.b #$01
	beq CODE_9B82C6
	ldx.w #$000F
	stx.w $077C
	jsr.w CODE_9B8309
CODE_9B82C6:
	lda.w $0ACE
	cmp.b #$01
	beq CODE_9B82D6
	ldx.w #$000F
	stx.w $077E
	jsr.w CODE_9B8309
CODE_9B82D6:
	lda.w $1A0E
	beq CODE_9B8307
CODE_9B82DB:
	lda.b $83
	and.b #$10
	bne CODE_9B82F5
	ldx.w #$1000
	stx.w JoyPad
	stx.w $0778
	stx.w $077A
	stx.w $077C
	stx.w $077E
	bra CODE_9B8307
