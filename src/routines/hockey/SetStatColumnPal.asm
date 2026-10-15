; Text palette $2000 for the sorted stat column (A = $1DF9), else $2400
SetStatColumnPal:
	cmp.w statcolumn
	beq .t1
	lda.w #$2400
	sta.w printa
	bra .1

.t1:
	lda.w #$2000
	sta.w printa
.1:
	rtl
