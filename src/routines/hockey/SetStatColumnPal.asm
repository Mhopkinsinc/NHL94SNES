; Text palette $2000 for the sorted stat column (A = $1DF9), else $2400
SetStatColumnPal:
	cmp.w $1DF9
	beq .t1
	lda.w #$2400
	sta.w $0D0D
	bra .1

.t1:
	lda.w #$2000
	sta.w $0D0D
.1:
	rtl
