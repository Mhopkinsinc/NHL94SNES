; Unidentified routine.
CODE_9D8330:
	jsl.l GetPlayerCount
	lda.b d0
	sta.b d4
	ldx.w #$0000
.loop:
	stx.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC5FC
	lda.b d0
	sta.b d2
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	sec
	sbc.b d2
	sta.b d0
	ldy.b a2
	lda.w $1E45,y
	clc
	adc.b d0
	sta.w $1E45,y
	stx.b d3
	jsl.l .t1
	inx
	cpx.b d4
	bmi .loop
	rtl

.t1:
	lda.b d3
	sta.b d1
	lda.b d0
	sta.b $08
	cmp.w $1E61,y
	beq .1
	bpl .t2
.1:
	cmp.w $1E65,y
	beq .2
	bpl CODE_9D83AD
.2:
	cmp.w $1E69,y
	beq CODE_9D83D3
	bpl CODE_9D83C9
	bra CODE_9D83D3

.t2:
	lda.w $1E61,y
	sta.b $00
	lda.w $1E49,y
	sta.b $04
	lda.b d0
	sta.w $1E61,y
	lda.b d1
	sta.w $1E49,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9D83AD:
	lda.w $1E65,y
	sta.b $00
	lda.w $1E4D,y
	sta.b $04
	lda.b d0
	sta.w $1E65,y
	lda.b d1
	sta.w $1E4D,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9D83C9:
	lda.b d0
	sta.w $1E69,y
	lda.b d1
	sta.w $1E51,y
CODE_9D83D3:
	lda.b d3
	sta.b d1
	lda.b $08
	sta.b d0
	cmp.w $1E6D,y
	bmi .t1
	cmp.w $1E71,y
	bmi CODE_9D8408
	cmp.w $1E75,y
	bmi CODE_9D8424
	bra CODE_9D842E

.t1:
	lda.w $1E6D,y
	sta.b $00
	lda.w $1E55,y
	sta.b $04
	lda.b d0
	sta.w $1E6D,y
	lda.b d1
	sta.w $1E55,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9D8408:
	lda.w $1E71,y
	sta.b $00
	lda.w $1E59,y
	sta.b $04
	lda.b d0
	sta.w $1E71,y
	lda.b d1
	sta.w $1E59,y
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9D8424:
	lda.b d0
	sta.w $1E75,y
	lda.b d1
	sta.w $1E5D,y
CODE_9D842E:
	rtl
