; Z set if player X is on the shorthanded team
chkpk2:
	lda.w pfteam,x
	bne .t2
	lda.w sflags
	and.w #sf2pwrtm
	eor.w #sf2pwrtm
	rtl

.t2:
	lda.w sflags
	and.w #sf2pwrtm
	rtl
	cpx.w shotPlIdx
	bne .1
	lda.w $19D4,x
	bmi asseben
.1:
	jmp.w CODE_9E8BE6

.t1:
	rtl
