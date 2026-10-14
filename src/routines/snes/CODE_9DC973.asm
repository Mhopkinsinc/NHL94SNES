; Unidentified routine.
CODE_9DC973:
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC9A2
	sta.b a1
	lda.b [a1],y
	and.w #$00FF
	pha
	ldy.b a2
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b a1
	ldy.w #$000C
	clc
	adc.b [a1],y
	sta.b a1
	ply
	lda.b [a1],y
	and.w #$00FF
	dec a
	sta.b d0
	rtl
