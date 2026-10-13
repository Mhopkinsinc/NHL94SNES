; Unidentified routine.
CODE_9FE71B:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq CODE_9FE732
	lda.w #$EA60
	sta.w $0CE3
CODE_9FE732:
	rtl
