; Unidentified routine.
Setplass:
	lda.w position,x
	sta.b $A5
	bmi CODE_9FCEEE
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FCEEF
	sta.b $89
	ldy.b $A5
	lda.b [$89],y
	and.w #$00FF
	sta.b $A5
	jml.l assreplace
