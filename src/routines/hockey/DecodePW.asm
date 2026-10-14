; Turn the password into the playoff state
DecodePW:
	jsl.l PWtoBits
	jml.l ReadPassBits
