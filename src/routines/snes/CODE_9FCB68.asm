; Unidentified routine.
CODE_9FCB68:
	lda.w #$FFFF
	sta.w $0BA3
	ldy.b d4
	lda.w $19EC,y
	cmp.b d0
	beq .rtl
	tay
	cpy.w #$0018
	bcs .1
	lda.w pflags,y
	and.w #$FFF7
	ora.w #$0002
	sta.w pflags,y
	lda.w #$FFFF
	sta.w $19D4,y
	lda.w position,y
	bne .1
	lda.w #$0000
	sta.w $0B05,y
.1:
	ldy.b d0
	cpy.w #$0018
	bcs .rtl
	lda.w pflags,y
	ora.w #$0008
	sta.w pflags,y
	lda.b d4
	sta.w $19D4,y
	tay
	lda.b d0
	sta.w $19EC,y
.rtl:
	rtl
