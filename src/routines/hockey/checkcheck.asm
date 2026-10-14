; Two players are in contact: check what happens each way
checkcheck:
	lda.b d4
	pha
	lda.b a2
	pha
	lda.b a3
org $9EA001
	pha
	jsl.l .cc
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l .cc
	pla
	sta.b a3
	pla
	sta.b a2
	pla
	sta.b d4
	ldx.b a3
.rtl:
	rtl
.1:
	jmp.w holdcheck
.cc:
	ldy.b a2
	lda.w SPA,y
	cmp.w #$F374
	beq .1
	cmp.w #$F864
	beq .1
	cmp.w #$F208
	bne .t1
	jmp.w Bcheck

.t1:
	lda.w SPA,x
	cmp.w #$F342
	bne .rtl
	lda.w gmclock
	beq .1x
	lda.w #$0100
	sta.w $0F23,x
	sta.w $0F23,y
.1x:
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.b d0
	sec
	sbc.w facedir,x
	and.w #$0007
	asl a
	tay
	lda.w #$009E
	sta.b $8B
	lda.w #DATA8_9EA154
	sta.b a0
	sta.w $1543,x
	cpy.w #$0000
	bne .3
	lda.w Xpos,x
	cmp.w #$0050
	bpl .t2
	cmp.w #$A057
	bmi .t2
	lda.w Ypos,x
	cmp.w #$00F8
	bpl .t2
	cmp.w #$FF08
	bpl .t2
	lda.w $0792
	and.w #$00F0
	beq .3
	bra .2

.t2:
	lda.w $0792
	and.w #$0030
	beq .3
.2:
	iny
	iny
	sty.b d0
.3:
	lda.b [a0],y
	jsl.l SetSPAFromA
	ldy.b a2
	lda.w position,y
	beq .t1x
	lda.b d4
	sec
	sbc.w #$0020
	bmi .t1x
	lda.w #$0078
	sta.b d0
	lda.b d0
	sec
	sbc.w $12C3,x
	clc
	adc.w $12C3,y
	lsr a
	sec
	sbc.w $0F23,y
	beq .t2x
	bmi .t2x
	sta.b d0
	jsl.l randomd0
	lda.b d0
	sec
	sbc.w $1483,x
	bmi .t2x
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs .t1x
	lda.w gmode
	bit.w #$0010
	bne .t1x
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$0018
	sta.b d0
	jmp.w AddPenalty

.t1x:
	rtl

.t2x:
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs .1xx
	lda.w gmode
	bit.w #$0010
	bne .1xx
	lda.w $0793
	and.w #$0002
	clc
	adc.w #$001C
	sta.b d0
	jsl.l AddPenalty
.1xx:
	jsl.l CODE_9EC042
	beq .2x
	lda.w $1E8D
	bpl .2x
	ldy.b a2
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
.2x:
	jmp.w FallDown
