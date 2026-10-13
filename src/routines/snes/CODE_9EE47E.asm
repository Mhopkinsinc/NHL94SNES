; Unidentified routine.
CODE_9EE47E:
	lda.w gmclock
	bne CODE_9EE471
	lda.w Ypos,x
	sta.b $A5
	ldy.w pfgoal,x
	bne CODE_9EE495
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EE495:
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9EE4BE
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	stz.w $1EA7
	lda.w seed
	and.w #$0003
	sta.w temp3,x
	jsr.w $E5E6
CODE_9EE4BE:
	lda.w $1EA5
	bmi CODE_9EE502
	lda.b $A5
	cmp.w $1EA5
	bmi CODE_9EE4D3
	jsr.w $E593
	lda.w facedir,x
	sta.w $1EAB
CODE_9EE4D3:
	lda.w $1EA1
	sta.b $A5
	lda.w $1EA3
	sta.b $A9
	lda.w pfgoal,x
	bne CODE_9EE4EA
	lda.w #$0000
	sec
	sbc.b $A9
	sta.b $A9
CODE_9EE4EA:
	lda.w #$009E
	sta.b $8B
	lda.w #$E592
	sta.b $89
	lda.w temp2,x
	sec
	sbc.w $0CDD
	sta.w temp2,x
	jml.l CODE_9EA5A4
