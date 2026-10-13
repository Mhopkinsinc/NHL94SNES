; Unidentified routine.
CODE_9D985F:
	lda.w $0ACF
	cmp.w #$0002
	beq CODE_9D9893
	cmp.w #$0003
	beq CODE_9D9893
	cmp.w #$0005
	beq CODE_9D9893
	lda.l $7E3598,x
	ora.w #$0001
	sta.l $7E3598,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3538,x
	lda.b [$89]
	inc.b $89
	and.w #$00FF
	sta.l $7E3528,x
	rtl
