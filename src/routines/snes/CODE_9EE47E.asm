; Unidentified routine.
CODE_9EE47E:
	lda.w gmclock
	bne CODE_9EE471
	lda.w Ypos,x
	sta.b d0
	ldy.w pfgoal,x
	bne assnearest
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
assnearest:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE4BE
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1EA7
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
	jsr.w CODE_9EE5E6
CODE_9EE4BE:
	lda.w $1EA5
	bmi CODE_9EE502
	lda.b d0
	cmp.w $1EA5
	bmi CODE_9EE4D3
	jsr.w CODE_9EE593
	lda.w facedir,x
	sta.w $1EAB
CODE_9EE4D3:
	lda.w $1EA1
	sta.b d0
	lda.w $1EA3
	sta.b d1
	lda.w pfgoal,x
	bne CODE_9EE4EA
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
CODE_9EE4EA:
	lda.w #$009E
	sta.b $8B
	lda.w #$E592
	sta.b a0
	lda.w $1023,x
	sec
	sbc.w $0CDD
	sta.w $1023,x
	jml.l CODE_9EA5A4
