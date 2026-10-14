; Unidentified routine.
CODE_80C195:
	lda.b $6C
	bmi .t1
	ldy.b #$01
	jsr.w CODE_80C2DC
	sta.b $6C
	ldy.b $6D
	sty.w WMDATA
	sty.b $08
	ldy.b #$08
	jsr.w CODE_80C2DC
	jmp (DATA16_80BCF9,x)

.t1:
	rts
