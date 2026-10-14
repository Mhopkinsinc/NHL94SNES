; Set player X's first assignment from his position
Setplass:
	lda.w position,x
	sta.b d0
	bmi CODE_9FCEEE
	lda.w #$009F
	sta.b a0+2
	lda.w #DATA8_9FCEEF
	sta.b a0
	ldy.b d0
	lda.b [a0],y
	and.w #$00FF
	sta.b d0
	jml.l assreplace
