; Unidentified routine.
CODE_9BABAB:
	lda.w $0CAB
	bpl .t2
	jmp.w .7

.t2:
	tax
	lda.w Xpos,x
	sta.w $0D75
	cmp.w $0CBD
	bpl .t1
	lda.w $0CBD
	sec
	sbc.w #$0004
	cmp.w $0D75
	bpl .2
.1:
	lda.w $0D75
.2:
	bra .5

.t1:
	lda.w $0CBD
	clc
	adc.w #$0004
	cmp.w $0D75
	bmi .5
	lda.w $0D75
.5:
	cmp.w #$FFC0
	bpl .1x
	lda.w #$FFC0
.1x:
	cmp.w #$0040
	bmi .2x
	lda.w #$0040
.2x:
	sta.w Hpos
	sta.w $0CBD
	lda.w Ypos,x
	sta.w $0DD7
	cmp.w $0CBF
	bpl .t1x
	lda.w $0CBF
	sec
	sbc.w #$0004
	cmp.w $0DD7
	bpl .4
.3:
	lda.w $0DD7
.4:
	bra .6

.t1x:
	lda.w $0CBF
	clc
	adc.w #$0004
	cmp.w $0DD7
	bmi .6
	lda.w $0DD7
.6:
	cmp.w #$FF39
	bpl .2xx
.1xx:
	lda.w #$FF39
.2xx:
	cmp.w #$0100
	bmi .4x
.3x:
	lda.w #$0100
.4x:
	sta.w Vpos
	sta.w $0CBF
	txa
	lsr a
	sta.w $0AF3
	jmp.w CODE_9BACCD

.7:
	cmp.w #$FFFF
	beq CODE_9BACC1
	lda.w $0D75
	cmp.w $0CBD
	bpl .t2x
	lda.w $0CBD
	sec
	sbc.w #$0002
	cmp.w $0D75
	bpl .1xxx
	lda.w $0D75
.1xxx:
	bra .8

.t2x:
	lda.w $0CBD
	clc
	adc.w #$0002
	cmp.w $0D75
	bmi .8
	lda.w $0D75
.8:
	cmp.w #$FFC0
	bpl .1xxxx
	lda.w #$FFC0
.1xxxx:
	cmp.w #$0040
	bmi .2xxx
	lda.w #$0040
.2xxx:
	sta.w Hpos
	sta.w $0CBD
	lda.w $0DD7
	cmp.w $0CBF
	bpl .t1xx
	lda.w $0CBF
	sec
	sbc.w #$0002
	cmp.w $0DD7
	bpl .3xx
	lda.w $0DD7
.3xx:
	bra .9

.t1xx:
	lda.w $0CBF
	clc
	adc.w #$0002
	cmp.w $0DD7
	bmi .9
	lda.w $0DD7
.9:
	cmp.w #$FF39
	bpl .2xxxx
.1xxxxx:
	lda.w #$FF39
.2xxxx:
	cmp.w #$0100
	bmi .4xx
.3xxx:
	lda.w #$0100
.4xx:
	sta.w Vpos
	sta.w $0CBF
	bra CODE_9BACCD
