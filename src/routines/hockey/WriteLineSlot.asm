; Write the low byte of A to [a3]
WriteLineSlot:
	and.w #$00FF
	sep #$20
	sta.b [a3]
	rep #$20
	rts
