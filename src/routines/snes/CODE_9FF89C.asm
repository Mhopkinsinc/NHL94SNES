; Unidentified routine.
CODE_9FF89C:
	sep #$20
	lda.b #$00
	sta.w M7X
	lda.b #$02
	sta.w M7X
	lda.b #$00
	sta.w M7Y
	lda.b #$02
	sta.w M7Y
	stz.w M7A
	lda.b #$01
	sta.w M7A
	stz.w M7B
	stz.w M7B
	stz.w M7C
	stz.w M7C
	stz.w M7D
	lda.b #$01
	sta.w M7D
	rep #$20
	jsr.w $F8D4
	rts
