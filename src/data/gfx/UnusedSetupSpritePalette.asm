; Data.

UnusedSetupSpritePalette:		; three palette rows: SetupScreen and LoadScoutingScreen send the first (a gold ramp) to sprite palette 4, but no sprite on those screens is drawn in palette 4 (letters use 0, team logos 2 and 3; the player photos are background), so it never shows; the second and third rows are the ANH and BUF team blocks (TeamBlockPalettes)
	dw $0000,$1D47,$01AF,$81F1,$8232,$0674,$0696,$86D8
	dw $86D8,$8696,$8674,$0232,$01F1,$81AF,$81AF,$FFFF
	dw $0000,$6F7B,$3DEF,$C210,$4A52,$5294,$DAD6,$E318
	dw $4260,$3A20,$31E0,$A9A0,$A160,$1920,$1100,$031A
	dw $0000,$6F7B,$018F,$81F2,$8275,$02D8,$835B,$03DE
	dw $FC00,$6C00,$5C00,$5000,$4000,$3400,$2400,$031A
