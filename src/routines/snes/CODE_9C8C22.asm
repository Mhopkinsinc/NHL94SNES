; Unidentified routine.
CODE_9C8C22:
	phx
	phy
	lda.b d0
	pha
	sep #$20
	lda.w $1DFB,y
	rep #$20
	and.w #$00FF
	tay
	sep #$20
	lda.w $1DFB,x
	rep #$20
	and.w #$00FF
	tax
	stx.w $1DC9
	lda.b a2
	beq .2
.1:
	lda.w #$001A
.2:
	clc
	adc.w $1DC9
	tax
	sty.w $1DC9
	lda.b a2
	beq .4
.3:
	lda.w #$001A
.4:
	clc
	adc.w $1DC9
	tay
	lda.w $1DF9
	cmp.w #$0001
	beq .t3
.5:
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t5
	cmp.w #$0004
	bne .t2
	jmp.w .t6

.t2:
	cmp.w #$0005
	bne .t1
	jmp.w CODE_808CF5

.t1:
	jmp.w CODE_9C8D03

.t3:
	sep #$20
	lda.w $18EE,y
	cmp.w $18EE,x
	rep #$20
	beq CODE_9C8D03
.1x:
	bpl CODE_9C8D0B
	jmp.w CODE_9C8D03

.t4:
	sep #$20
	lda.w $1922,y
	cmp.w $1922,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
	bra CODE_9C8D03

.t5:
	sep #$20
	lda.w $18EE,y
	rep #$20
	and.w #$00FF
	sta.b d0
	sep #$20
	lda.w $1922,y
	rep #$20
	and.w #$00FF
	clc
	adc.b d0
	sta.b d0
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.w $1DC9
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.w $1DC9
	sta.w $1DC9
	lda.b d0
	cmp.w $1DC9
	beq CODE_9C8D03
	bmi CODE_9C8D03
	bra CODE_9C8D0B

.t6:
	sep #$20
	lda.w $1956,y
	cmp.w $1956,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
	bra CODE_9C8D03

.t1x:
	sep #$20
	lda.w $198A,y
	cmp.w $198A,x
	rep #$20
	beq CODE_9C8D03
	bpl CODE_9C8D0B
CODE_9C8D03:
	lda.w #$0000
	sta.w $1DC9
	bra CODE_9C8D11
