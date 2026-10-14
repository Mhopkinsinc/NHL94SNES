; Unidentified routine.
CODE_9EDFFF:
	lda.w #$0008
org $9EE002
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	ldy.w #$0000
	lda.w pfteam,x
	bne CODE_9EE014
	ldy.w #$000C
CODE_9EE014:
	lda.w position,y
	beq CODE_9EE022
	iny
	iny
	dec.b $A9
	bpl CODE_9EE014
	jmp.w CODE_9EE0C7
