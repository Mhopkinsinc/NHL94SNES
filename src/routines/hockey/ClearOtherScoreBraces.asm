; Erase the braces around the visible other-scores rows.
ClearOtherScoreBraces:
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	asl a
	adc.w $1DBD
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l CODE_9EC894
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces+6
	sta.b a1
	jsl.l CODE_9EC894
	rts
