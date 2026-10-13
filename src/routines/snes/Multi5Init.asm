; check for the multitap, then clear the multitap pads and state
Multi5Init:		; check for the multitap, then clear the multitap pads and state
	jsl.l Multi5ConnectCheck
	lda.w #$000F
	sta.w $077A
	sta.w $077C
	sta.w $077E
	stz.w $1A0C
	stz.w $1A0E
	stz.w $1A04
	stz.w $1A02
	lda.w $1A00
	and.w #$0080
	beq CODE_9B8384
	lda.w #$0001
	tsb.w $1A0E
	bra CODE_9B838A
