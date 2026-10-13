; Unidentified routine.
CODE_9B8D7C:
	and.w #$00FF
	sep #$20
	sta.b [$95]
	rep #$20
	rts
