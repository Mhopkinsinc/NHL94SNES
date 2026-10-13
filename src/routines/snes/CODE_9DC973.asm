; Unidentified routine.
CODE_9DC973:
	tay
	lda.w #$009D
	sta.b $8F
	lda.w #DATA8_9DC9A2
	sta.b $8D
	lda.b [$8D],y
	and.w #$00FF
	pha
	ldy.b $91
	lda.w #$009C
	sta.b $8F
	lda.w tmdata,y
	sta.b $8D
	ldy.w #$000C
	clc
	adc.b [$8D],y
	sta.b $8D
	ply
	lda.b [$8D],y
	and.w #$00FF
	dec a
	sta.b $A5
	rtl
