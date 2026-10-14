; Unidentified routine.
CODE_9D8292:
	lda.w #$FFFF
	sta.w $1E49
	sta.w $1E4B
	sta.w $1E4D
	sta.w $1E4F
	sta.w $1E51
	sta.w $1E53
	sta.w $1E55
	sta.w $1E57
	sta.w $1E59
	sta.w $1E5B
	sta.w $1E5D
	sta.w $1E5F
	lda.w #$FF06
	sta.w $1E61
	sta.w $1E65
	sta.w $1E69
	sta.w $1E63
	sta.w $1E67
	sta.w $1E6B
	lda.w #$00FA
	sta.w $1E6D
	sta.w $1E71
	sta.w $1E75
	sta.w $1E6F
	sta.w $1E73
	sta.w $1E77
	stz.w $1E45
	stz.w $1E47
	stz.b a2
	jsl.l CODE_9D8330
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9D8330
	lda.w HomeTeam
	sta.w $1E41
	lda.w #$0001
	sta.w $1E43
	lda.w $1E45
	sec
	sbc.w $1E47
	bmi .t1
	bra .1

.t1:
	lda.w VisTeam
	sta.w $1E41
	lda.w $1E47
	sec
	sbc.w $1E45
.1:
	cmp.w #$0008
	bcs .rtl
	stz.w $1E43
	cmp.w #$0004
	bcs .rtl
	lda.w #$FFFF
	sta.w $1E41
.rtl:
	rtl
