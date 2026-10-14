; Unidentified routine.
CODE_9F8511:
	lda.b $83
	sec
	sbc.w $0D01
	beq CODE_9F8511
	inc.w $1D6D
	lda.w #$003C
	ldx.w $1D6D
	jsl.l CODE_808F98
	lda.w $0764
	sta.b $04
	jsl.l Div32U
	lda.b $00
	sta.w $0A98
	lda.w gsp
	cmp.w #$0002
	bne .1
	lda.w MusicOn
	bne .1
	jsl.l RandomWord
	and.w #$0FFF
	bne .1
	lda.w #$0005
	jsl.l CODE_9C9B5F
.1:
	jsl.l RandomWord
	lda.b $83
	tax
	sec
	sbc.w $0D01
	sta.b d7
	sta.w $0ADB
	asl a
	sta.w $0CDD
	asl a
	asl a
	asl a
	sta.w $0CDF
	asl a
	sta.w $0CE1
	asl a
	adc.w $0CE1
	sta.w $0CE1
	stx.w $0D35
	stx.w $0D01
	jsl.l CODE_9B8017
	lda.w sflags
	bit.w #$0001
	bne .4
	lda.w gmclock
	bne .4
	lda.w $1D81
	bne .t1
	lda.w $163A
	beq .t1
	ldx.b d7
	lda.w $1E9F
	sec
	sbc.b d7
	sta.w $1E9F
	bne .2
	jsl.l CODE_9EC791
.2:
	bra .4

.t1:
	ldx.b d7
.loop:
	lda.w gameclock
	beq .2x
	lda.w $1634
	sec
	sbc.w #$0AAA
	sta.w $1634
	bcs .2x
	dec.w gameclock
	lda.w $19BE
	clc
	adc.w #$FFFD
	bmi .1x
	sta.w $19BE
.1x:
	jsl.l CODE_9B9BF8
.2x:
	dex
	bne .loop
.4:
	lda.w $0CE7
	beq .1xx
	lda.b $83
	sec
	sbc.w $0CE9
	cmp.w #$0096
	bcc .1xx
	dec.w $0CE7
	lda.w $0CE9
	clc
	adc.w #$0096
	sta.w $0CE9
.1xx:
	jsl.l DoGameFrame
	jsl.l CODE_9F967B
	lda.w sflags
	bit.w #$0001
	bne .2xx
	lda.w $1A0E
	beq .3
	lda.w gmode
	bit.w #$0010
	bne .3
	lda.w #$0001
	tsb.w sflags
.2xx:
	jsl.l CODE_9F937B
.3:
	lda.w $1D81
	beq .t1x
	lda.w $1D87
	beq .t1x
	rtl

.t1x:
	jmp.w CODE_9F8511
