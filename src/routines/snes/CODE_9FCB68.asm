; Unidentified routine.
CODE_9FCB68:
	lda.w #$FFFF
	sta.w $0BA3
	ldy.b $B5
	lda.w $19EC,y
	cmp.b $A5
	beq CODE_9FCBB5
	tay
	cpy.w #$0018
	bcs CODE_9FCB9A
	lda.w pflags,y
	and.w #$FFF7
	ora.w #$0002
	sta.w pflags,y
	lda.w #$FFFF
	sta.w $19D4,y
	lda.w position,y
	bne CODE_9FCB9A
	lda.w #$0000
	sta.w $0B05,y
CODE_9FCB9A:
	ldy.b $A5
	cpy.w #$0018
	bcs CODE_9FCBB5
	lda.w pflags,y
	ora.w #$0008
	sta.w pflags,y
	lda.b $B5
	sta.w $19D4,y
	tay
	lda.b $A5
	sta.w $19EC,y
CODE_9FCBB5:
	rtl
