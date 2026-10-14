; Assignment: the puck at the start of play
puckfaceoff:
	stz.w $19C0
	lda.w $1D81
	beq .t4
	lda.w $1D83
	beq .t4
	inc.w $1D87
	rtl

.t4:
	lda.w #$FFFF
	sta.w shotPlIdx
	jsl.l CODE_9EDCC3
	lda.w pflags,x
	bit.w #$0002
	bne .t1x
.1x:
	jmp.w CODE_9FB518

.t1x:
	and.w #$FFFD
	sta.w pflags,x
	lda.w gameclock
	bne .t2x
.1xx:
	jml.l CODE_9F8CB1

.t2x:
	lda.w gmode
	bit.w #$0040
	beq .t1xx
.1x2:
	jml.l CODE_9F8CB1

.t1xx:
	lda.w gsp
	cmp.w #$0003
	bne .t3
.1xxx:
	lda.w $178E
	cmp.w $1790
	beq .t3
	jml.l clockcont_0

.t3:
	lda.w gmode
	bit.w #$0008
	beq .t1x2
.1x3:
	jml.l Stop4Pen

.t1x2:
	jsl.l CODE_9ED0FD
	lda.w #$FFFF
	sta.w $1003,x
	sta.w $1023,x
	lda.l $7E34C6
	bne .t2xx
	jmp.w CODE_9FB518

.t2xx:
	lda.w $1E9B
	ora.w $1E9D
	beq .t1xxx
	jmp.w CODE_9FB518

.t1xxx:
	lda.w #$FFFF
	sta.w $1D55
	sta.w $1D57
	lda.w #$0008
	trb.w tmflags
	trb.w $17E0
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq .1xx2
	lda.w sfhormode
	beq .1xx2
	lda.w #$0040
	tsb.w sflags
	jsl.l CODE_9FB9A4
.1xx2:
	lda.l $7E344E
	bne .2
	lda.w $19D0
	beq .2
	jsl.l CODE_9FB5E5
	lsr a
	sta.b d0
	jsl.l CODE_9FB48B
.2:
	lda.l $7E344E
	bne .3
	lda.w $19D2
	beq .3
	jsl.l CODE_9FB5F3
	lsr a
	sta.b d0
	jsl.l CODE_9FB4A2
.3:
	lda.w #$0000
	sta.l $7E344E
	stz.b a1
	lda.w #$0002
	sta.b a2
	sta.b d0
	jsl.l CODE_9FB44C
	jmp.w CODE_9FB518
