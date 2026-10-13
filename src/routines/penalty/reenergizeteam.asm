; Unidentified routine.
reenergizeteam:
	lda.w #$0032
	sta.b $A5
CODE_9FDDA2:
	lda.b $91
	beq CODE_9FDDA9
	lda.w #$0034
CODE_9FDDA9:
	clc
	adc.b $A5
	tay
	lda.w #$1000
	sta.w tmpde,y
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne CODE_9FDDC6
	cmp.w #$FFFC
	bne CODE_9FDDC6
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9FDDC6:
	dec.b $A5
	dec.b $A5
	bpl CODE_9FDDA2
	rtl
