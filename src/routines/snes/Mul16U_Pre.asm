; Unidentified routine.
Mul16U_Pre:		; A * Y into $08-$0B, unsigned, Y also in $00, no zero test
	phy
	bra Mul16U_Go
