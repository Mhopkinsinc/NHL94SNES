; Assignment: the puck shadow follows the puck
puckshadow:
	lda.w $0D97,x
	cmp.w #$018C
	bne .t2
	lda.w $0D71
	sta.w Xpos,x
	lda.w pucky
	sta.w Ypos,x
	stz.w $0DFB
	lda.w sfhormode
	beq .t1
	inc.w Xpos,x
	rtl

.t1:
	inc.w Ypos,x
	rtl

.t2:
	tay
	beq .rtl
	stz.w Xpos,x
	lda.w #$012C
	sta.w Ypos,x
	lda.w #$000E
	sta.w $0DFB
	lda.w pucky
	bpl .rtl
.1:
	lda.w #$8000
	sta.w attribute,x
	lda.w #$FED4
	sta.w Ypos,x
	dec.w $0DFB
.rtl:
	rtl
