; Draw the game clock unless a replay is playing
showclock:
	lda.w sflags
	bit.w #sf2replay
	beq .t1
	jmp.w .t2

.t1:
	lda.w #$0007
	sta.w mesarea
	lda.w #$0020
	sta.w mesarea+2
	lda.w #$003A
	sta.w $0A2E
	lda.w gameclock
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A30
	rep #$20
	lda.b $00
	sta.b $08
	lda.w #$0006
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A2F
	rep #$20
	lda.b $00
	sta.b $08
	lda.w #$000A
	sta.b $04
	jsl.l Div16x8U
	lda.w RDMPYL
	clc
	adc.w #$0030
	sep #$20
	sta.w $0A2D
	rep #$20
	lda.b $00
	beq .1
	clc
	adc.w #$0030
	sep #$20
	sta.w mesarea+2
	rep #$20
.1:
	lda.w #$2000
	sta.w $0D0D
	lda.w #$0003
	sta.w printx
	lda.w #$0018
	sta.w printy
	lda.w sfhormode
	beq .2
	lda.w #$000D
	sta.w printx
	lda.w #$000B
	sta.w printy
	lda.w gsp
	cmp.w #$0004
	beq .t2
.2:
	lda.w #mesarea>>16
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	jml.l print

.t2:
	rtl
