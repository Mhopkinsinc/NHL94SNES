; Put player $1D8F in the cursor slot of the selected line; if he is already in another slot of that line, the old occupant moves there (swap)
SetLineSlot:
	sta.w $1D8F
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l GetTeamLines
	sec
	adc.b d0
	sta.b d0
	lda.w $1D9F
	sec
	sbc.w $1D8B
	cmp.w #$0001
	beq .2
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t3
	cmp.w #$0004
	beq .t2
	lda.b d0
	inc a
	inc a
	sta.b a3
	jsr.w ReadLineSlot
	cmp.w $1D8F
	bne .t1
	jsr.w SwapLineSlots
	bra .4

.t1:
	lda.b d0
	inc a
	inc a
	inc a
	bra .1

.t2:
	lda.b d0
	clc
	adc.w #$0004
	sta.b a3
	jsr.w ReadLineSlot
	cmp.w $1D8F
	bne .t1x
	dec.b a3
	jsr.w .5
	bra .4

.t1x:
	lda.b d0
	inc a
	inc a
	bra .1

.t3:
	lda.b d0
	clc
	adc.w #$0004
	sta.b a3
	jsr.w ReadLineSlot
	cmp.w $1D8F
	bne .t1x2
	jsr.w SwapLineSlots
	bra .4

.t1x2:
	lda.b d0
	inc a
	inc a
	inc a
	bra .3

.t4:
	lda.b d0
.1:
	sta.b a3
	jsr.w ReadLineSlot
	cmp.w $1D8F
	bne .4
	jsr.w .5
	bra .4
.2:
	lda.b d0
	inc a
.3:
	sta.b a3
	jsr.w ReadLineSlot
	cmp.w $1D8F
	bne .4
	dec.b a3
	jsr.w .5
.4:
	lda.b d0
	clc
	adc.w $1D9F
	sbc.w $1D8B
	sta.b a3
	lda.w $1D8F
	jsr.w WriteLineSlot
	rts
.5:
	jsr.w ReadLineSlot
	sta.w $1D93
	inc.b a3
	jsr.w ReadLineSlot
	dec.b a3
	jsr.w WriteLineSlot
	inc.b a3
	lda.w $1D93
	jsr.w WriteLineSlot
	dec.b a3
	rts
