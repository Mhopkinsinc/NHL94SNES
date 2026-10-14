; The next line of the scouting report; scroll the text box up when it is full
ScrollDisplayUp:
	stz.w $0D47
	inc.w VertLineScrolling
	lda.w VertLineScrolling
	sec
	sbc.w #$0008
	bmi .2
	bvc .3
.1:
	jmp.w CODE_9EC9B0
.2:
	bvc .1
.3:
	dec.w VertLineScrolling
	lda.w #$0007
	sta.b $14
	lda.w #$007E
	sta.b $12
	lda.w #$3B78
	sta.b $10
	lda.b $12
	sta.b $0E
.loop:
	ldx.w #$0028
	lda.b $10
	clc
	adc.w #$0040
	sta.b $0C
	jsl.l MemCopy
	lda.b $0C
	sta.b $10
	dec.b $14
	bpl .loop
	rtl
