; Unidentified routine.
CODE_9FCDFA:
	lda.w PBnum
	sec
	sbc.b $A9
	sta.w PBnum
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FCE16
	cmp.w #$FFFC
	beq CODE_9FCE16
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9FCE16:
	dec.b $A5
	dec.b $A5
	bpl CODE_9FCDC9
	rtl
