; Unidentified routine.
CODE_9BC7D5:
	jsl.l CODE_9BCDE2
CODE_9BC7D9:
	lda.w #$0080
	ora.l $7E34F4
	sta.l $7E34F4
	lda.w #$0002
	sta.l $7E34BC
	lda.w $0ACF
	cmp.w #$0007
	beq CODE_9BC7FA
	lda.w #$0003
	sta.l $7E34BC
CODE_9BC7FA:
	rtl
