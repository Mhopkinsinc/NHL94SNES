; Unidentified routine.
TryAddPlayerToList:
	lda.b $A5
	sta.b $A9
	dec.b $A5
	asl.b $A5
	lda.b $91
	beq CODE_9FD6E7
	lda.w #$0034
CODE_9FD6E7:
	adc.b $A5
	tay
	lda.w tmpdst,y
	sec
	sbc.w #$0000
	beq CODE_9FD6F5
	bpl CODE_9FD72D
CODE_9FD6F5:
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq CODE_9FD72D
	cmp.w #$FFFC
	beq CODE_9FD72D
	lda.w #$0005
	sta.b $A5
CODE_9FD707:
	ldy.b $A5
	lda.b [$99],y
	and.w #$00FF
	sta.b $C5
	lda.b $A9
	and.w #$00FF
	cmp.b $C5
	beq CODE_9FD72D
	dec.b $A5
	bpl CODE_9FD707
	ldy.b $B5
	sep #$20
	lda.b $A9
	sta.b [$99],y
	rep #$20
	lda.b $A9
	and.w #$00FF
	rtl
