; Unidentified routine.
CODE_9F9DB0:
	jsl.l CODE_9FBD66
	ldy.b a2
	lda.w $178E,y
	sta.b d0
	jsl.l CODE_9F9E15
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0004
	sta.b [a1]
	lda.w #$0020
	sta.w mesarea+2
	lda.b d0
	sta.b $08
	lda.w #$000A
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	beq CODE_9F9DED
	adc.w #$0030
	sta.w mesarea+2
CODE_9F9DED:
	lda.w RDMPYL
	adc.w #$0030
	sta.w $0A2D
	jml.l print
