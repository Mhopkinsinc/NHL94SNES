; free handle A unless it is a heap block
DisposePtrHandle:		; free handle A unless it is a heap block
	cmp.w #$2000
	bcc .exit
	cmp.w #INIDISP
	bcs .exit
	tax
	lda.l $7E0002,x
	cmp.w #$007E
	beq .exit
	cmp.w #$007F
	beq .exit
	lda.w #$0000
	sta.l $7E0000,x
	sta.l $7E0002,x
.exit:
	rtl
