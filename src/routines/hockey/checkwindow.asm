; Move the view so the screen follows the puck
checkwindow:
	lda.w yc1
	sta.b d2
	lda.w xc1
	sta.b d3
	lda.w sflags
	bit.w #$0040
	bne CODE_9FC102
	ldx.w #$001C
	lda.w shotPlIdx
	bmi CODE_9FC0DB
	tax
	lda.w pfgoal,x
	beq .t1
	lda.w $0D4F
	adc.w $0CDD
	sta.w $0D4F
	cmp.w #$0032
	bmi CODE_9FC0DB
	lda.w #$0032
	sta.w $0D4F
	bra CODE_9FC0DB

.t1:
	lda.w $0D4F
	sec
	sbc.w $0CDD
	sta.w $0D4F
	cmp.w #$FFCF
	bpl CODE_9FC0DB
	lda.w #$FFCE
	sta.w $0D4F
CODE_9FC0DB:
	lda.w $0EE3,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0100
	beq .1
	ora.w #$FE00
.1:
	clc
	adc.w Ypos,x
	clc
	adc.w $0D4F
	sta.b d2
	sta.w yc1
	lda.w Xpos,x
	sta.b d3
	sta.w xc1
CODE_9FC102:
	lda.b d2
	sec
	sbc.w Vpos
	sta.b d0
	cmp.w #$FFF7
	bpl .t1
	lda.b d2
	sec
	sbc.w #$FFF6
	sta.b d1
	cmp.w #$FF39
	bpl CODE_9FC13C
	lda.w #$FF39
	sta.b d1
	bra CODE_9FC13C

.t1:
	lda.b d0
	cmp.w #$000B
	bmi CODE_9FC15D
	lda.b d2
	sec
	sbc.w #$000A
	sta.b d1
	cmp.w #$0100
	bmi CODE_9FC13C
	lda.w #$0100
	sta.b d1
CODE_9FC13C:
	lda.b d1
	sec
	sbc.w Vpos
	beq CODE_9FC15D
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .1
	ora.w #$F000
.1:
	cmp.w #$0000
	bne .2
	inc a
.2:
	clc
	adc.w Vpos
	sta.w Vpos
CODE_9FC15D:
	lda.b d3
	sec
	sbc.w Hpos
	sta.b d0
	cmp.w #$FFD8
	bpl .t1
	lda.b d3
	sec
	sbc.w #$FFD8
	sta.b d1
	cmp.w #$FFC4
	bpl CODE_9FC197
	lda.w #$FFC4
	sta.b d1
	bra CODE_9FC197

.t1:
	lda.b d0
	cmp.w #$0029
	bmi CODE_9FC1B8
	lda.b d3
	sec
	sbc.w #$0028
	sta.b d1
	cmp.w #$003D
	bmi CODE_9FC197
	lda.w #$003C
	sta.b d1
CODE_9FC197:
	lda.b d1
	sec
	sbc.w Hpos
	beq CODE_9FC1B8
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq .1
	ora.w #$F000
.1:
	cmp.w #$0000
	bne .2
	inc a
.2:
	clc
	adc.w Hpos
	sta.w Hpos
CODE_9FC1B8:
	rtl
